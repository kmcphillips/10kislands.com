class FtpUploader
  attr_reader :username, :host, :password, :files

  def initialize(host, username=nil, password=nil)
    @host = host
    @username = username
    @password = password

    @files = []
  end

  def add(file, path, opts={})
    file = File.new(file) if file.is_a?(String)

    @files << {file: file, path: path, filename: opts[:filename], binary: !!opts[:binary]}
  end

  def upload
    raise "Host must be set" if host.blank?

    Net::FTP.new(@host, @username, @password) do |ftp|
      ftp.login

      @files.each do |file|
        # TODO
      end

      @files = []
    end
  end

  def inspect
    "#<FtpUploader host:#{ host } username:#{ username } password:#{ password.present? ? "[SET]" : "[BLANK]" } pending_files:#{ @files.count }>"
  end

end
