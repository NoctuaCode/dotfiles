# Neovim

## General Options

My options are set in `config/nvim/lua/config/options.lua`:

- **Colorscheme:** `catppuccin`
- **Search:**
  - `inccommand = "split"` (show search results in a split)
  - `smartcase = true` (ignore case if search pattern contains uppercase)
  - `ignorecase = true` (ignore case if search pattern contains lowercase)
  - `breakindent = true` (indent wrapped lines)
  - `smartindent = true` (indent based on context)
- **Line Numbers:** `number = true`, `relativenumber = true` (show line numbers and relative numbers)
- **Splits:** `splitbelow = true`, `splitright = true` (split below and right by default)
- **UI:**
  - `signcolumn = "yes"` (show sign column)
  - `cursorline = true` (highlight current line)
  - `scrolloff = 10` (keep 10 lines above and below cursor)
- **Files:**
  - `undofile = true` (enable undo file)
  - `swapfile = false` (disable swap file)
  - `backup = false` (disable backup file)
  - `writebackup = false` (disable write backup file)
  - `undodir = ~/.local/share/nvim/undodir` (set undo directory)
- **Tabs/Indentation:**
  - `tabstop = 4` (set tab size to 4)
  - `softtabstop = 4` (set soft tab size to 4)
  - `shiftwidth = 4` (set shift width to 4)
  - `expandtab = true` (expand tabs to spaces)
- **Search Highlight:** `hlsearch = true`, `incsearch = true` (highlight search results)
- **Text Wrapping:** `wrap = false` (disable text wrapping)
- **Folding:**
  - `foldlevel = 99` (set fold level to 99)
  - `foldmethod = "expr"` (use expression to fold)
  - `foldexpr = "v:lua.vim.treesitter.foldexpr()"` (use treesitter to fold)
  - `foldtext = "v:lua.vim.treesitter.foldtext()"` (use treesitter to fold text)
- **Conceal:** `conceallevel = 2` (set conceal level to 2)
- **Format Options:** `formatoptions = "jcroqlnt"` (set format options)
- **Grep:** `grepformat = "%f:%l:%c:%m"`, `grepprg = "rg --vimgrep"` (set grep format and program)
- **Spell:** `spelllang = { "en", "fr" }` (set spell language to English and French)
- **Fillchars:** Custom icons for folds, diff, etc. (set fillchars)

---

## Plugins

Your plugins are managed via [lazy.nvim](https://github.com/folke/lazy.nvim) and are organized in `config/nvim/lua/plugins/`. Here is a summary:

### UI & Appearance

- **catppuccin/nvim**: Colorscheme.
- **folke/snacks.nvim**: UI enhancements (dim, indent, notifications, dashboard, statuscolumn, etc.).
- **folke/which-key.nvim**: Keybinding hints, with custom groupings.
- **nvim-tree/nvim-web-devicons**: File icons (if Nerd Font is available).

### Navigation & Fuzzy Finding

- **nvim-telescope/telescope.nvim**: Fuzzy finder for files, LSP, etc.
  - **fzf-native**: Native FZF support (if `make` is available).
  - **ui-select**: Dropdown UI for select prompts.
- **ThePrimeagen/harpoon**: Quick file navigation/bookmarking.

### LSP & Completion

- **neovim/nvim-lspconfig**: LSP client configuration.
- **mason-org/mason.nvim**: LSP/DAP/Linter installer.
- **mason-org/mason-lspconfig.nvim**: Mason integration for LSP.
- **WhoIsSethDaniel/mason-tool-installer.nvim**: Ensures LSP/formatter tools are installed.
- **saghen/blink.cmp**: Autocompletion engine.
  - **L3MON4D3/LuaSnip**: Snippet engine.
  - **folke/lazydev.nvim**: Lua LSP for Neovim config/plugins.
- **j-hui/fidget.nvim**: LSP progress UI.

### Treesitter & Syntax

- **nvim-treesitter/nvim-treesitter**: Syntax highlighting, folding, and more.
- **Wansmer/treesj**: Split/join code blocks.
- **OXY2DEV/markview.nvim**: Markdown/codecompanion preview.

### Editing & Refactoring

- **echasnovski/mini.nvim**: Collection of mini-plugins (ai, bracketed, comment, hipatterns, icons, operators, pairs, surround, statusline).
- **ThePrimeagen/refactoring.nvim**: Refactoring tools.
- **stevearc/conform.nvim**: Autoformatting (with per-language configuration).
- **stevearc/oil.nvim**: File explorer.

### Git

- **lewis6991/gitsigns.nvim**: Git signs in the gutter.
- **folke/todo-comments.nvim**: Highlight and search TODO comments.

### Debugging

- **mfussenegger/nvim-dap**: Debug Adapter Protocol client.
  - **leoluz/nvim-dap-go**: Go debugging.
  - **rcarriga/nvim-dap-ui**: DAP UI.
  - **theHamsta/nvim-dap-virtual-text**: Inline variable values.
  - **nvim-neotest/nvim-nio**: Async IO for neotest.

### Miscellaneous

- **tpope/vim-sleuth**: Detect tabstop and shiftwidth automatically.

---

## Notable Keymaps

Shortcuts in neovim are prefixed with `<leader>`. My leader is `space`.

- `<leader>n`: Notification history (snacks)
- `<leader>bd`: Delete buffer (snacks)
- `<leader>cR`: Rename file (snacks)
- `<leader>gg`: Lazygit (snacks)
- `<c-/>`, `<c-_>`: Toggle terminal (snacks)
- `<leader>,`, `<leader>fb`: Buffers (snacks)
- `<leader>/`, `<leader>sg`: Grep (snacks)
- `<leader>ff`: Find files (snacks)
- `<leader>gc`: Git log (snacks)
- `<leader>gs`: Git status (snacks)
- `<leader>sh`: Search help (telescope)
- `<leader>sk`: Search keymaps (telescope)
- `<leader>sf`: Search files (telescope)
- `<leader>sd`: Search diagnostics (telescope)
- `<leader>sn`: Search Neovim config files (telescope)
- `<leader>aa`, `<leader>ae`, `<leader>1-4`: Harpoon navigation
- `<leader>f`: Format buffer (conform)
- `<leader>b`: Toggle breakpoint (dap)
- `<leader>gb`: Run to cursor (dap)
- `<leader>?`: Evaluate word under cursor (dap)

---

## LSP Servers & Tools

- **LSP Servers:** gopls, ruff, ts_ls, lua_ls (with custom settings)
- **Formatters:** stylua (Lua), ruff (Python), prettier
- **Auto-install:** Managed by mason-tool-installer

---

## Treesitter Languages

- bash, c, diff, html, lua, luadoc, markdown, markdown_inline, query, vim, vimdoc, javascript, typescript, go, python

---

## Additional Notes

- Plugins are loaded and managed via [lazy.nvim](https://github.com/folke/lazy.nvim).
- Many plugins are configured with custom options and keymaps for enhanced workflow.
- The configuration is modular and easy to extend.

## Some use case

### Lazygit

This is an exemple of how I use telescope and lazygit

![Lazygit and Telescope](/config/nvim/telescope-lazygit.mp4)
