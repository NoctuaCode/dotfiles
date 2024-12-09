local opt = vim.opt
local global = vim.g

opt.conceallevel = 3
opt.cmdheight = 0
opt.guicursor = ""
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
opt.completeopt = "menuone,preview,noinsert,noselect"
opt.smartindent = true
opt.wrap = false

global.root_spec = { "cwd" }
global.omni_sql_no_default_maps = 1
global.python3_host_prog = "/opt/homebrew/Caskroom/miniconda/base/bin/python"
