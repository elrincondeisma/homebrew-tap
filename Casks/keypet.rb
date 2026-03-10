cask "keypet" do
  version "1.0.1"
  sha256 "PLACEHOLDER"

  url "https://github.com/elrincondeisma/keypet/releases/download/v#{version}/KeyPet-#{version}-arm64.dmg"
  name "KeyPet"
  desc "Pixel-art desktop pet that reacts to keystrokes"
  homepage "https://github.com/elrincondeisma/keypet"

  depends_on macos: ">= :monterey"

  app "KeyPet.app"

  caveats do
    <<~EOS
      KeyPet requires Accessibility permissions to detect keystrokes.
      Grant access in: System Settings → Privacy & Security → Accessibility

      Since KeyPet is not notarized, on first launch go to:
        System Settings → Privacy & Security → scroll down → "Open Anyway"
    EOS
  end

  zap trash: [
    "~/Library/Application Support/keypet",
    "~/Library/Preferences/com.keypet.app.plist",
    "~/Library/Caches/com.keypet.app",
  ]
end
