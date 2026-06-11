cask "ecs-monitor" do
  version "1.1.0"
  sha256 "f2b487c00eff05e4226e4a3b803ed2c1792b3b17a4675bcde863e0a1ffb25149"

  url "https://github.com/elrincondeisma/desktop-monitor-ecs/releases/download/v#{version}/ECSMonitor-#{version}-universal.zip",
      verified: "github.com/elrincondeisma/desktop-monitor-ecs/"
  name "ECS Monitor"
  desc "AWS ECS monitor in the macOS menu bar: clusters, services and tasks"
  homepage "https://github.com/elrincondeisma/desktop-monitor-ecs"

  app "ECS Monitor.app"

  preflight do
    system_command "/usr/bin/osascript",
                   args: ["-e", 'tell application "ECS Monitor" to quit'],
                   sudo: false
    sleep 2
  end

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/ECS Monitor.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/desktop-monitor-ecs",
  ]
end
