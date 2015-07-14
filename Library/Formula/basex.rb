class Basex < Formula
  desc "Light-weight XML database and XPath/XQuery processor"
  homepage "http://basex.org"
  url "http://files.basex.org/releases/8.2.3/BaseX823.zip"
  version "8.2.3"
  sha256 "69167fc8bbac97fd140404c1c37572016b23488bec7fc85fa19fdb391f33f3b8"

  bottle do
    cellar :any
    sha256 "58b5e02334e985e161cd5aa9e5d1b8492daaf4cc36645577e86d28464541147a" => :yosemite
    sha256 "726b7365ee7c73ac1f48176befa08553f7c9b7ee630e172e8dca2401ba4bc983" => :mavericks
    sha256 "9ecf13cac0290aa379ebd08ad6dbdc296aa8773de9532eefaaa94682aee5cdde" => :mountain_lion
  end

  def install
    rm Dir["bin/*.bat"]
    rm_rf "repo"
    rm_rf "data"
    rm_rf "etc"
    prefix.install_metafiles
    libexec.install Dir["*"]
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_equal "1\n2\n3\n4\n5\n6\n7\n8\n9\n10", shell_output("#{bin}/basex '1 to 10'")
  end
end
