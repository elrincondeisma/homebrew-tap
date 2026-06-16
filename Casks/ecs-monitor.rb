cask "ecs-monitor" do
  version "1.3.1"
  sha256 "62f03e39ece27b5f58a95f35793eed6c9e1c94e9f6df78e8857c7ad01d1f6884"

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
