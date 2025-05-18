# Aerospace

Aerospace is a tiling manager for macOS, it is based on the well known i3.

## Installation

```bash
brew install --cask aerospace
```

## Configuration

The configuration is done in the `~/.config/aerospace` directory.

The main configuration file is `aerospace.toml`.

### My usage

#### Styling

Every window has a gap of 10 pixels between them and the screen border. except for the top of the screen due to [Sketchybar](/config/sketchybar/README.md).

There is two main layouts:

- `tiles`: This is the default layout, it is a grid of windows.
- `accordion`: This means that the windows are stacked.

#### Workspaces

I currently use 8 workspaces. My most used windows are automatically sent to there respective workspaces, like so:

- `1`: IDE
- `2`: Browser
- `3`: Terminal
- `4`: Database / Docker
- `5`: Password Manager
- `6`: Activity Monitor
- `7`: Chat
- `8`: Mail

#### Keyboard shortcuts

- `alt-ctrl-shift-q`: Go to workspace 1.
- `alt-ctrl-shift-w`: Go to workspace 2.
- `alt-ctrl-shift-e`: Go to workspace 3.
- `alt-ctrl-shift-r`: Go to workspace 4.
- `alt-ctrl-shift-a`: Go to workspace 5.
- `alt-ctrl-shift-s`: Go to workspace 6.
- `alt-ctrl-shift-d`: Go to workspace 7.
- `alt-ctrl-shift-f`: Go to workspace 8.

- `cmd-alt-ctrl-shift-q`: Move the current window to workspace 1.
- `cmd-alt-ctrl-shift-w`: Move the current window to workspace 2.
- `cmd-alt-ctrl-shift-e`: Move the current window to workspace 3.
- `cmd-alt-ctrl-shift-r`: Move the current window to workspace 4.
- `cmd-alt-ctrl-shift-a`: Move the current window to workspace 5.
- `cmd-alt-ctrl-shift-s`: Move the current window to workspace 6.
- `cmd-alt-ctrl-shift-d`: Move the current window to workspace 7.
- `cmd-alt-ctrl-shift-f`: Move the current window to workspace 8.

- `alt-ctrl-shift-h`: Focus on the window left of the current window.
- `alt-ctrl-shift-j`: Focus on the window below the current window.
- `alt-ctrl-shift-k`: Focus on the window above the current window.
- `alt-ctrl-shift-l`: Focus on the window right of the current window.

- `cmd-alt-ctrl-shift-h`: Move the current window to the left.
- `cmd-alt-ctrl-shift-j`: Move the current window to the bottom.
- `cmd-alt-ctrl-shift-k`: Move the current window to the top.
- `cmd-alt-ctrl-shift-l`: Move the current window to the right.

- `cmd-alt-ctrl-shift-z`: Fullscreen the current window.
- `cmd-alt-ctrl-shift-x`: Toggle floating the current window.

- `cmd-alt-ctrl-shift-t`: Activate tiles layout and toggle vertical/horizontal.
- `cmd-alt-ctrl-shift-y`: Activate accordion layout and toggle vertical/horizontal.

- `alt-ctrl-shift-t`: Open a new window in Ghostty.
- `alt-ctrl-shift-b`: Open a new window in Brave Browser.

- `alt-tab`: Cycle through the windows.

- `alt-ctrl-cmd-shift-n`: Move the current workspace to the next monitor.

- `alt-ctrl-shift-semicolon`: Activate service mode. You can then hit `esc` to reload the config.
