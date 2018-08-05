class Html2epub < Formula
  desc "html2epub"
  homepage "https://github.com/jwhitehorn/html2epub"
  url "https://github.com/jwhitehorn/html2epub/archive/b2f9b6c2b4e2c2120c84e7f58e7c54dc0a629ad8.tar.gz"
  sha256 "8c563681c41ddc801a9970a4745c58252afeb3645d511e71e2ce98fc3ebc4afd"

  depends_on "ruby" => :build

  def install
    libexec.install Dir["*"]

    system "gem", "install", "bundler"
    system "bundle", "install"
    bin.install "main.rb" => "html2epub"
  end

end
