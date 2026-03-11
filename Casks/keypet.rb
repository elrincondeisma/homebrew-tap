cask "keypet" do
  version "1.0.3"
  sha256 "fb604565f1266ce9e09fbdf86366c55a170af778a8dae6dc3f1746ecebac6b8e"

  url "https://github.com/elrincondeisma/keypet/releases/download/v#{version}/KeyPet-#{version}-arm64.dmg",
      verified: "github.com/elrincondeisma/keypet/"
  name "KeyPet"
  desc "Desktop pixel pet that reacts to your keyboard activity"
  homepage "https://github.com/elrincondeisma/keypet"

  depends_on arch: :arm64

  app "KeyPet.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/KeyPet.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/keypet",
  ]
end
