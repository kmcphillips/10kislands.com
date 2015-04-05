class FtpUploader
  attr_reader :username, :host, :password, :files

  def initialize(host, username=nil, password=nil)
    @host = host
    @username = username
    @password = password

    @files = []
  end

  def add(file, path, opts={})
    @files << FtpUploadFile.new(file, path, binary: !!opts[:binary])
  end

  def upload
    log "Starting upload"
    raise "Host must be set" if host.blank?

    Net::FTP.new(@host, @username, @password) do |ftp|
      # ftp.login

      @files.each do |file|
        log "Processing #{ file }"

        ftp.chdir("~")

        begin
          log "Changing to path #{ file.path }"
          ftp.chdir(file.path)
          log "Path found"
        rescue Net::FTPPermError => e
          log "Path not found", e

          file.segments.each do |segment|
            begin
              log "Changing to path segment #{ segment }"
              ftp.chdir(segment)
              log "Path segment found"
            rescue Net::FTPPermError => ee
              log "Path segment not found", ee
              log "Creating path #{ segment }"
              ftp.mkdir(segment)
              log "Changing to created path segment #{ segment }"
              ftp.chdir(segment)
            end
          end
        end

        log "Currently working in #{ ftp.pwd }"

        if file.binary
          log "Uploading binary file #{ file.file } => #{ file.filename }"
          ftp.putbinaryfile(file.file, file.filename)
        else
          log "Uploading text file #{ file.file } => #{ file.filename }"
          ftp.puttextfile(file.file, file.filename)
        end

        log "Finished processing #{ file }"
      end

      log "Upload finished"

      @files = []
    end
  end

  def inspect
    "#<FtpUploader host:#{ host } username:#{ username } password:#{ password.present? ? "*****" : "" } pending_files:#{ @files.count }>"
  end

  private

  def log(message, exception=nil)
    Rails.logger.info("[#{ self.class.name }] #{ message } #{ exception.try(:message) }")
  end

  class FtpUploadFile
    attr_reader :file, :binary, :filename, :segments

    def initialize(file, target, opts={})
      file = File.new(file) if file.is_a?(String)

      @file = file
      @target = target
      @binary = !!opts[:binary]

      @segments = @target.split(File::SEPARATOR).reject(&:blank?)
      @filename = @segments.pop
    end

    def path
      segments.join("/")
    end
  end

end
