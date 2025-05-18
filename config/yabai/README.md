# Yabai

Yabai is a tiling window manager for macOS. It is developed by [koekeishiya](https://github.com/koekeishiya).

---

## General Settings

| Setting               | Value/Description                                  |
| --------------------- | -------------------------------------------------- |
| `layout`              | `bsp` (binary space partitioning, default layout)  |
| `window_placement`    | `second_child` (new windows spawn to right/bottom) |
| `top_padding`         | 10px                                               |
| `bottom_padding`      | 10px                                               |
| `left_padding`        | 10px                                               |
| `right_padding`       | 10px                                               |
| `window_gap`          | 10px                                               |
| `mouse_follows_focus` | on (center mouse on focused window)                |
| `focus_follows_mouse` | autoraise (focus window under mouse)               |
| `mouse_modifier`      | alt (⌥)                                            |
| `mouse_action1`       | move (modifier + left-click to move window)        |
| `mouse_action2`       | resize (modifier + right-click to resize window)   |

---

## Scripting Additions & Signals

- **Load scripting addition on startup and after dock restarts:**
  ```sh
yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
sudo yabai --load-sa
  ```
- **Finder window focus workaround:**
  - On Finder window creation or destruction, briefly switches spaces to ensure focus is correct.

---

## Application Rules

These rules automatically assign applications to specific spaces (desktops) or set management behavior.

| Application(s)                                                | Space | Manage | Notes                        |
| ------------------------------------------------------------- | ----- | ------ | ---------------------------- |
| Terminal, iTerm, Alacritty, WezTerm, kitty, Ghostty           | 3     | on     | All major terminal emulators |
| Arc, Firefox Dev, Safari, Chrome, Google Chrome, Zen, SigmaOS | 2     | on     | Browsers                     |
| Zed, Visual Studio Code, Code, Emacs                          | 1     | on     | Code editors                 |
| TablePlus, DBngin                                             | 4     | on     | Database tools               |
| Hoppscotch                                                    | 4     | on     | API testing tool             |
| Messages, Messenger, Signal, WhatsApp                         | 7     | on     | Messaging apps               |
| Mail, Proton Mail                                             | 8     | on     | Mail clients                 |
| System Settings, Calculator, Karabiner-Elements               | -     | off    | Not managed by yabai         |
| Finder (window_created/window_destroyed)                      | -     | -      | Space focus workaround       |
| Picture in Picture (by title)                                 | -     | off    | Not managed, mouse focus off |

---

## Example Rules

```sh
yabai -m rule --add app="^Terminal|iTerm|Alacritty|WezTerm|kitty|Ghostty$" space=3
yabai -m rule --add app="^Arc|Firefox Developer Edition|Safari|Chrome|Google Chrome|Zen|SigmaOS$" space=2
yabai -m rule --add app="^Zed|Visual Studio Code|Code|Emacs$" space=1
yabai -m rule --add app="^TablePlus|DBngin$" space=4
yabai -m rule --add app="^Hoppscotch$" space=4
yabai -m rule --add app="^Messages|Messenger|Signal|WhatsApp$" space=7
yabai -m rule --add app="^Mail|Proton Mail$" space=8
yabai -m rule --add app="^System Settings$" manage=off
yabai -m rule --add app="^Calculator$" manage=off
yabai -m rule --add app="^Karabiner-Elements$" manage=off
yabai -m rule --add title="^Picture in Picture$" manage=off mouse_follows_focus=off
```

---

## Notes

- **Scripting addition** is required for some features (window moving, stacking, etc.).
- **Spaces** are numbered as in Mission Control (1 = leftmost space).
- **Rules** use regular expressions to match application names or window titles.
- You can customize these rules to fit your workflow by editing the `yabairc` file.

---

**For more information, see the [yabai documentation](https://github.com/koekeishiya/yabai/wiki).**
