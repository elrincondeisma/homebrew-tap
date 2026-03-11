cask "keypet" do
  version "1.0.1"
  sha256 "19e1d442a0f356ebdf69620a04f5b5b731b2d5aa3a73ce51265602414236410b"

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
