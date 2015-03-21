class PublishJob < ActiveJob::Base
  queue_as :default

  def perform(opts={})
    @user = opts[:user]

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

  def prepare_cards
    # TODO
  end

  def upload
    # TODO
  end

  def log_attempt
    Rails.logger.info("[#{ self.class }] Attempting publish by #{ @user.try(:name) || "unknown" }")
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
