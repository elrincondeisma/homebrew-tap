cask "keypet" do
  version "1.0.2"
  sha256 "6c7cbffe4d5404d5b64393bca067963a280e241ef82ab94f6e3a7ca312e038c0"

  url "https://github.com/elrincondeisma/keypet/releases/download/v#{version}/KeyPet-#{version}-arm64.dmg"
  name "KeyPet"
  desc "Desktop pixel pet that reacts to your keyboard activity"
  homepage "https://github.com/elrincondeisma/keypet"

  depends_on arch: :arm64

  app "KeyPet.app"

  zap trash: [
    "~/Library/Application Support/keypet",
  ]
end
