# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula

class Ondevice < Formula
  desc "Client for the ondevice.io service"
  homepage "https://ondevice.io/"
  url "https://github.com/ondevice/ondevice/archive/v0.5.2.tar.gz"
  sha256 "f8f00ffa82b2f33fef67866dc8512d6e01c0fedbf2aef216f08a0a39a3736e79"

  # depends_on "cmake" => :build
  depends_on "glide" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"

    dir = buildpath/"src/github.com/ondevice/ondevice/"
    dir.install buildpath.children

    cd dir do
      system "glide", "install", "-v"
      system "go", "build", "-o", "ondevice"
      bin.install "ondevice"
      prefix.install_metafiles
    end
  end

  def plist; <<-EOS.undent
   <?xml version="1.0" encoding="UTF-8"?>
   <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
   <plist version="1.0">
   <dict>
     <key>Label</key>
       <string>#{plist_name}</string>
     <key>ProgramArguments</key>
       <array>
         <string>#{opt_bin}/ondevice</string>
         <string>daemon</string>
       </array>
     <key>RunAtLoad</key>
       <true/>
     <key>KeepAlive</key>
       <true/>
     <key>StandardErrorPath</key>
       <string>#{var}/log/ondevice.log</string>
     <key>StandardOutPath</key>
       <string>#{var}/log/ondevice.log</string>
   </dict>
   </plist>
   EOS
  end

  test do
    # TODO run a few self checks (e.g. `ondevice login`, `ondevice ssh` to a demo device,...)
    system bin/"ondevice", "help"
  end
end
