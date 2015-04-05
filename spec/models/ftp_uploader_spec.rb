require 'rails_helper'

RSpec.describe FtpUploader do
  let(:username){ "someone" }
  let(:password){ "12345" }
  let(:host){ "example.com" }
  let(:uploader){ FtpUploader.new(host, username, password) }

  describe "#inspect" do
    it "should be tested" do
      expect(uploader.inspect).to eq("#<FtpUploader host:example.com username:someone password:***** pending_files:0>")
    end
  end

  describe "#add" do
    let(:text_file){ double }
    let(:binary_file){ double }

    it "should add a hash with params" do
      uploader.add(text_file, "path/to/file.txt")
      uploader.add(binary_file, "path/to/file.bin", binary: "yes")

      expect(uploader.files.length).to eq(2)

      file = uploader.files.first
      expect(file.path).to eq("path/to")
      expect(file.filename).to eq("file.txt")
      expect(file.binary).to be_falsy

      file = uploader.files.last
      expect(file.path).to eq("path/to")
      expect(file.filename).to eq("file.bin")
      expect(file.binary).to be_truthy
    end
  end

  describe "#upload" do
    it "should be tested"
  end
end
