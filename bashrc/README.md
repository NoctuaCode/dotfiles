# Bash Configuration (`.bashrc`)

This document describes the configuration, aliases, and customizations found in the `.bashrc` file. The setup is designed for productivity, language support, and a modern terminal experience.

---

## Environment Variables

- **Language:**
  - `LANG=en_US.UTF-8`
- **Editor:**
  - `EDITOR=nvim` (sets Neovim as the default editor)
- **Go:**
  - `GOPATH=$HOME/go`

---

## PATH Modifications

The following directories are prepended to the `PATH` to ensure binaries are found in the correct order:

1. `$HOME/.config/bin` (custom scripts)
2. `$HOME/.cargo/bin` (Rust tools)
3. `$(go env GOPATH)/bin` (Go binaries)
4. `$HOME/.local/bin` (user local binaries)
5. `/snap/bin` (Snap packages)

Additionally, [nvm](https://github.com/nvm-sh/nvm) is loaded if available, for Node.js version management.

---

## Aliases

| Alias   | Command/Description                                             |
| ------- | --------------------------------------------------------------- |
| `ls`    | `eza --icons -F -H --group-directories-first --git` (modern ls) |
| `ll`    | `ls -al`                                                        |
| `lt`    | `ls -T --git-ignore`                                            |
| `lta`   | `ls -Ta`                                                        |
| `c`     | `clear`                                                         |
| `v`     | `nvim`                                                          |
| `cat`   | `batcat` (modern cat with syntax highlighting)                  |
| `ga`    | `git add -p`                                                    |
| `gb`    | `git branch`                                                    |
| `gc`    | `git commit -m`                                                 |
| `gdiff` | `git diff`                                                      |
| `glog`  | `git log` (with custom pretty format)                           |
| `gp`    | `git pull --rebase`                                             |
| `gP`    | `git push`                                                      |
| `gs`    | `git status`                                                    |
| `gS`    | `git switch`                                                    |
| `ts`    | `tmux-sessionizer`                                              |

---

## Functions

### `kill_port`
Kills the process using a specified port.

```bash
kill_port <port_number>
```
- Finds the process using the given port and kills it with `kill -9`.
- Prints status messages for success or failure.

---

## Other Customizations

- **Angular CLI autocompletion** is enabled by sourcing the output of `ng completion script`.
- **Color prompt** is enabled for terminals supporting 256 colors or Ghostty.

---

## Notes

- This configuration assumes you have tools like `eza`, `batcat`, `nvim`, and `tmux-sessionizer` installed.
- Aliases and functions are designed to speed up common development and navigation tasks.
- For more information, see the [Bash documentation](https://www.gnu.org/software/bash/manual/bash.html).
