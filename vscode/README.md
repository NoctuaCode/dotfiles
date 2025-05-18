# VS Code / Cursor

Here is my VS Code configuration.

## Where to put the configuration

### MacOS

```bash
/Users/your-username/Library/Application Support/Code/User/
/Users/your-username/Library/Application Support/Cursor/User/
```

### Linux

```bash
~/.config/Code/User/
~/.config/Cursor/User/
```

### Windows

```bash
%APPDATA%\Code\User\
%APPDATA%\Cursor\User\
```

## General Settings (`settings.json`)

- **Editor:**
  - Format on save: enabled
  - Font: Maple Mono, size 12
  - Relative line numbers
  - Minimap: disabled
  - Linked editing: enabled
  - Suggest insert mode: replace
  - Accessibility support: off
- **Terminal:**
  - Font: Maple Mono NF
- **Icon Theme:** Material Icon Theme
- **Color Theme:** Catppuccin Mocha
- **Workbench:**
  - Hide line numbers in Zen Mode: false
  - Show release notes: false
- **Vim Extension:**
  - Leader key: `<Space>`
  - Highlight search, smartcase, autoindent, sneak, surround, system clipboard, and more
  - Custom normal and visual mode keybindings (see below)
- **Git:**
  - Auto fetch: true
  - Confirm sync: false
  - Enabled: true
- **File Exclude:**
  - Ignores `.svn`, `.hg`, `CVS`, `.DS_Store`, `Thumbs.db` (but not `.git`)
- **Language Specific Formatters:**
  - TypeScript, TypeScript React, JSONC: Prettier
  - Python: Ruff
  - Markdown: Markdown All in One
- **Other:**
  - JavaScript: update imports on file move
  - Go: auto-update tools

---

## Vim Keybindings (via VSCodeVim)

### Normal Mode
- **Buffer Navigation:**
  - `<S-h>`: Previous buffer
  - `<S-l>`: Next buffer
- **Splits:**
  - `<leader>|`: Vertical split
  - `<leader>-`: Horizontal split
- **Pane Navigation:**
  - `<leader>h/j/k/l`: Focus left/down/up/right group
- **File Operations:**
  - `<leader>w`: Save
  - `<leader>q`: Quit
  - `<leader>x`: Save and quit
- **Diagnostics:**
  - `[d` / `]d`: Previous/next diagnostic
- **Quick Fix:**
  - `<leader>c a`: Quick fix
- **File Finder:**
  - `<leader>f`: Quick open
- **Format:**
  - `<leader>=`: Format document
- **Definition Preview:**
  - `g h`: Show definition preview hover

### Visual Mode
- **Indenting:** `<` / `>`
- **Move Lines:** `J` / `K`
- **Toggle Comment:** `<leader>c`

---

## Custom Keybindings (`keybindings.json`)

### Navigation & Terminal
- `ctrl+q`: Close folder
- `ctrl+l` / `ctrl+h`: Focus next/previous terminal (when terminal focused)
- `ctrl+t`: Toggle panel
- `ctrl+n`: New terminal (when terminal focused)
- `ctrl+x`: Kill terminal (when terminal focused)

### File Explorer
- `ctrl+e`: Focus files explorer
- `ctrl+e`: Toggle sidebar (when files explorer focused)
- `a`: New file (when files explorer focused)
- `r`: Rename file (when files explorer focused)
- `d`: Delete file (when files explorer focused)

### Extra
- `ctrl+z`: Toggle Zen Mode
- `ctrl+f`: Quick open
- `alt+p`: Project Manager: list projects
- `ctrl+g`: Focus Source Control (Git)

---

## Notes

- **Vim Emulation:** Most keybindings are designed to work with the VSCodeVim extension enabled.
- **Themes:** Uses Catppuccin Mocha for a modern, visually appealing look.
- **Productivity:** Many shortcuts are inspired by Neovim and VSCode defaults for familiarity and efficiency.
- **Language Support:** Prettier and Ruff are used for formatting TypeScript, JSON, and Python files.

---

**For more information, see the [VS Code documentation](https://code.visualstudio.com/docs) and [VSCodeVim documentation](https://github.com/VSCodeVim/Vim).**
