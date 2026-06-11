cask "ecs-monitor" do
  version "1.2.0"
  sha256 "afadd3bc9bfbd6633825a487b5a1751d69cb9234fe7442ac6426717ea8f6a501"

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
