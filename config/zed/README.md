# Zed

Zed is a modern code editor. It is developed by [zed](https://zed.dev).

---

## General Settings (`settings.json`)

- **Icon Theme:** Material Icon Theme
- **Assistant:** Uses Claude 3.7 Sonnet (via zed.dev) as the default AI model
- **Base Keymap:** VSCode
- **Vim Mode:** Enabled (`vim_mode: true`)
- **Theme:**
  - Mode: Follows system
  - Light: Catppuccin Frappé
  - Dark: Catppuccin Macchiato
- **Fonts:**
  - Buffer font: Maple Mono, size 14
  - UI font: Maple Mono NF, size 14
- **Cursor:**
  - Shape: Block
  - Blinking: Off
- **Whitespace:** Show only on selection
- **Relative Line Numbers:** Enabled
- **Vertical Scroll Margin:** 10
- **Terminal:**
  - Font: Maple Mono NF, size 14
  - Option as Meta: true
  - Copy on select: true
  - Working directory: current project directory
  - `EDITOR` env: `zed --wait`
- **Vim Integration:**
  - System clipboard: always
  - Multiline find: true
  - Smartcase find: true
- **Features:**
  - Edit prediction provider: zed

---

## Keybindings (`keymap.json`)

### General
- **File Finder:** `space space`, `space f f`, `alt-f`
- **Save File:** `ctrl-s`, `space w`
- **Close Buffer:** `space q`
- **Switch Buffers:** `shift-l` (next), `shift-h` (previous)
- **Reveal in Project Panel:** `space e`, `alt-e`
- **Open Recent Projects:** `space f p`, `alt-p`
- **Toggle Project Panel:** `alt-e`
- **Toggle Left/Right/Bottom Dock:** `alt-h`, `alt-l`, `alt-j`
- **Toggle Terminal Panel:** `alt-t`

### Vim Mode (Normal/Visual)
- **Pane Navigation:** `ctrl-h/j/k/l` (move between panes)
- **LSP Actions:**
  - Code Actions: `space c a`
  - Rename: `space c r`
  - Format: `=`
  - Go to Definition: `g d`, `g D` (split)
  - Go to Implementation: `g i`, `g I` (split)
  - Go to Type Definition: `g t`, `g T` (split)
  - Find References: `g r`
  - Go to Diagnostic: `] d`, `[ d`
- **Symbols/Outline:** `space s s` (outline), `space s S` (project symbols)
- **Diagnostics:** `space x x`
- **Git:** `] h`, `[ h` (next/prev hunk)
- **Comment Code (Visual):** `g c`
- **Toggle Inlay Hints:** `space c i`
- **Toggle Soft Wrap:** `space c w`
- **Toggle Zen Mode:** `space z`
- **Markdown Preview:** `space m p` (preview), `space m P` (side preview)
- **Search Word Under Cursor:** `space s w`
- **Chat with AI:** `space a c`
- **Go to File:** `g f`

### Project Panel (File Explorer)
- **New File/Directory:** `a` / `A`
- **Rename/Delete:** `r` / `d`
- **Cut/Copy/Paste:** `x` / `c` / `p`
- **Close Panel:** `q`, `alt-e`

### Pane Navigation (Dock/Workspace)
- **Dock:** `ctrl-w h/j/k/l` (move between panes)
- **Workspace:** `alt-h/l/j` (toggle docks), `alt-t` (terminal), `alt-f` (file finder), `alt-e` (project panel), `alt-p` (recent projects)

---

## Notes

- **Vim Mode:** Most keybindings are designed to work with Vim emulation enabled.
- **Themes:** Uses Catppuccin themes for both light and dark modes.
- **AI Assistant:** Integrated with Claude 3.7 Sonnet for code assistance.
- **Custom Keymaps:** Many shortcuts are inspired by VSCode and Neovim for familiarity and efficiency.
- **No custom themes or prompts are defined in this setup.**

---

**For more information, see the [Zed documentation](https://zed.dev/docs).**
