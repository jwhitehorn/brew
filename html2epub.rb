class Html2epub < Formula
  desc "html2epub"
  homepage "https://github.com/jwhitehorn/html2epub"
  url "https://github.com/jwhitehorn/html2epub/archive/0.1.tar.gz"
  sha256 "f77d8887287d7ef5551210d677a703b3157cb810eb66344707b2f13ebff48079"

  depends_on "ruby" => :build

  def install
    libexec.install Dir["*"]

    ENV["GEM_HOME"] = libexec
    ENV["BUNDLE_PATH"] = libexec
    ENV["BUNDLE_GEMFILE"] = libexec/"Gemfile"
    system "gem", "install", "bundler"
    bundle = Dir["#{libexec}/**/bundle"].last
    system bundle, "install", "--without", "test"


    (bin/"html2epub").write <<~EOS
      #!/bin/bash
      GEM_HOME=#{libexec} BUNDLE_GEMFILE=#{libexec}/Gemfile \
        exec #{bundle} exec ruby #{libexec}/main.rb "$@"
    EOS
  end

end
