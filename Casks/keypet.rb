cask "keypet" do
  version "1.0.9"
  sha256 "a374202f6ffe402cb0bab602b711c68d36b5a70548e49ad611f842c06cc3dc56"

  url "https://github.com/elrincondeisma/keypet/releases/download/v#{version}/KeyPet-#{version}-arm64.dmg",
      verified: "github.com/elrincondeisma/keypet/"
  name "KeyPet"
  desc "Desktop pixel pet that reacts to your keyboard activity"
  homepage "https://github.com/elrincondeisma/keypet"

  depends_on arch: :arm64

  app "KeyPet.app"

  preflight do
    system_command "/usr/bin/osascript",
                   args: ["-e", 'tell application "KeyPet" to quit'],
                   sudo: false
    sleep 2
  end

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/KeyPet.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/keypet",
  ]
end
