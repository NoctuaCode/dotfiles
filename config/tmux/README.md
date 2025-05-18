# Tmux

Tmux is a tool that allows me to manage my terminal sessions. It is developed by [tmux](https://github.com/tmux/tmux).

---

## Prefix Key

- **Default prefix is changed from `Ctrl-b` to `Ctrl-a`**
- To send a literal `Ctrl-a` to a program, press `Ctrl-a` twice.

---

## Plugins

This configuration uses [TPM (Tmux Plugin Manager)](https://github.com/tmux-plugins/tpm) to manage plugins. The following plugins are enabled:

| Plugin Name                     | Purpose/Description                           |
| ------------------------------- | --------------------------------------------- |
| `nikolovlazar/tokyo-night-tmux` | Tokyo Night theme for tmux                    |
| `tmux-plugins/tpm`              | Tmux Plugin Manager                           |
| `tmux-plugins/tmux-sensible`    | Sensible default settings for tmux            |
| `aserowy/tmux.nvim`             | Neovim integration for tmux                   |
| `tmux-plugins/tmux-resurrect`   | Restore tmux environment after system restart |

To install plugins for the first time, press `Ctrl-a` then `I` (capital i).

---

## Theme & Appearance

- **Tokyo Night theme** is applied with custom window, pane, and zoom ID styles.
- **Undercurl** and 24-bit color support enabled for better visuals.
- **Status bar** is enabled.
- **Mouse support** is enabled for easier pane and window management.
- **History limit** is increased to 30,000 lines.
- **Windows and panes start at index 1** (not 0).
- **Escape time** is set to 0 for faster key response.

---

## General Options

| Option               | Value/Description                            |
| -------------------- | -------------------------------------------- |
| `mode-keys`          | vi (Vim-style keybindings in copy mode)      |
| `mouse`              | on (enable mouse support)                    |
| `detach-on-destroy`  | off (don't detach when destroying last pane) |
| `history-limit`      | 30000 (increase scrollback buffer)           |
| `base-index`         | 1 (windows start at 1)                       |
| `pane-base-index`    | 1 (panes start at 1)                         |
| `renumber-windows`   | on (renumber windows after closing one)      |
| `escape-time`        | 0 (zero delay for escape key)                |
| `default-terminal`   | screen-256color                              |
| `terminal-overrides` | ,xterm-256color:RGB                          |

---

## Keybindings

### Reload Configuration

| Keybinding   | Action                            |
| ------------ | --------------------------------- |
| `prefix + r` | Reload `~/.config/tmux/tmux.conf` |

### Pane Resizing (with Vim/Neovim awareness)

- If the active pane is running Vim/Neovim, the resize keys are sent to the editor instead of resizing the pane.

| Keybinding | Action            |
| ---------- | ----------------- |
| `Alt-h`    | Resize pane left  |
| `Alt-j`    | Resize pane down  |
| `Alt-k`    | Resize pane up    |
| `Alt-l`    | Resize pane right |

### Pane Resizing in Copy Mode

| Keybinding          | Action            |
| ------------------- | ----------------- |
| `Alt-h` (copy mode) | Resize pane left  |
| `Alt-j` (copy mode) | Resize pane down  |
| `Alt-k` (copy mode) | Resize pane up    |
| `Alt-l` (copy mode) | Resize pane right |

### Pane & Window Management

| Keybinding | Action                                   |
| ---------- | ---------------------------------------- |
| `x`        | Kill current pane                        |
| `C`        | Create new session                       |
| `h`        | Split window vertically (current path)   |
| `v`        | Split window horizontally (current path) |

### Sesh Integration

| Keybinding | Action                         |
| ---------- | ------------------------------ |
| `o`        | Open Sesh session picker popup |

### Plugins

- **tmux-resurrect**: Restore tmux sessions and windows after a restart.
- **tmux-sensible**: Provides a set of sensible default settings.
- **tokyo-night-tmux**: Applies a modern, visually appealing theme.
- **tmux.nvim**: Neovim integration for tmux.

---

## Notes

- To reload the configuration, press `Ctrl-a` then `r`.
- To install plugins, press `Ctrl-a` then `I` (capital i).
- All keybindings use the new prefix `Ctrl-a` unless otherwise noted.
- For more information, see the [tmux documentation](https://github.com/tmux/tmux/wiki) and the documentation for each plugin.
