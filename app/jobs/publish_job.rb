class PublishJob < ActiveJob::Base
  queue_as :default

  attr_reader :uploader, :renderer

  def perform(opts={})
    setup(opts)

    begin
      log_attempt

      prepare_cards
      upload

      log_success
    rescue => e
      log_failure(e)
      raise e
    end
  end

  private

  def setup(opts)
    @user = User.find_by_id(opts[:user_id])
    @renderer = PageRenderer.new

    raise "Cannot find FTP credentials" unless Rails.application.secrets.ftp

    @uploader = FtpUploader.new(
      Rails.application.secrets.ftp["host"],
      Rails.application.secrets.ftp["username"],
      Rails.application.secrets.ftp["password"]
    )
  end

  def prepare_cards
    index = Tempfile.new("home")
    index.write(renderer.home)

    uploader.add(index, "/index_test.html")

    renderer.home_assets.each do |asset|
      [:big, :small].each do |size|
        uploader.add(asset.path(size), asset.url(size).gsub(/\?[0-9]+\Z/, ""), binary: true)
      end
    end
  end

  def upload
    uploader.upload
  end

  def log_attempt
    Rails.logger.info("[#{ self.class }] Attempting publish by #{ @user.try(:name) || "unknown" }")
    Rails.logger.info("[#{ self.class }] Destination: #{ uploader.inspect }")
    @start = Time.now
  end

  def log_success
    Rails.logger.info("[#{ self.class }] Publish successful")
    if @start
      seconds = Time.now - @start
      Rails.logger.info("[#{ self.class }] Completed in #{ seconds } seconds")
    end
  end

  def log_failure(exception=nil)
    Rails.logger.error("[#{ self.class }] Failed to publish: #{ exception.try(:message) }")
    Rails.logger.error(exception.backtrace.join("\n")) if exception.try(:backtrace)
  end

end
