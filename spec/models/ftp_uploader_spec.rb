require 'rails_helper'

RSpec.describe FtpUploader do
  let(:username){ "someone" }
  let(:password){ "12345" }
  let(:host){ "example.com" }
  let(:uploader){ FtpUploader.new(host, username, password) }

  describe "#inspect" do
    it "should be tested" do
      expect(uploader.inspect).to eq("#<FtpUploader host:example.com username:someone password:[SET] pending_files:0>")
    end
  end

  describe "#add" do
    let(:text_file){ double }
    let(:binary_file){ double }

    it "should add a hash with params" do
      uploader.add(text_file, "path/to/file.txt")
      uploader.add(binary_file, "path/to/file.bin", filename: "override.bin", binary: "yes")

      expect(uploader.files).to eq([
        {file: text_file, path: "path/to/file.txt", filename: nil, binary: false},
        {file: binary_file, path: "path/to/file.bin", filename: "override.bin", binary: true}
      ])
    end
  end

  describe "#upload" do
    it "should be tested"
  end
end
