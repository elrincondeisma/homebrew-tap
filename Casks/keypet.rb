cask "keypet" do
  version "1.0.2"
  sha256 "be60890f04216237bc4d47777b1a5333984a4962addd77ff1cac529be8f19c77"

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
