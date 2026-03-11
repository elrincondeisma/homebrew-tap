cask "keypet" do
  version "1.0.1"
  sha256 "6c5b06eacf1ea42d21406929c23bf508856cb26806748c5d9400f2d650258d2a"

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
