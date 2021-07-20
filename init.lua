local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

cmd 'packadd paq-nvim'               -- load the package manager
local paq = require('paq-nvim').paq  -- a convenient alias
paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself

paq {'aserebryakov/vim-todo-lists'}
paq {'bounceme/poppy.vim'}
paq {'bronson/vim-trailing-whitespace'}
paq {'cakebaker/scss-syntax.vim'}
paq {'dzeban/vim-log-syntax'}
paq {'fatih/vim-go'}
paq {'jeetsukumaran/vim-filebeagle'}
paq {'jiangmiao/auto-pairs'}
paq {'junegunn/fzf'}
paq {'junegunn/fzf.vim'}
paq {'justinmk/vim-gtfo'}
paq {'lifepillar/vim-gruvbox8'}
paq {'mg979/vim-visual-multi'}
paq {'neoclide/coc.nvim'}
paq {'neovim/nvim-lspconfig'}
paq {'nvim-treesitter/nvim-treesitter'}
paq {'scrooloose/nerdcommenter'}
paq {'tomlion/vim-solidity'}
paq {'tpope/vim-fugitive'}
paq {'tpope/vim-rhubarb'}
paq {'tpope/vim-sensible'}
paq {'tpope/vim-surround'}
paq {'xolox/vim-misc'}
paq {'ggandor/lightspeed.nvim'}

cmd 'colorscheme gruvbox8'
g.mapleader = ","
opt.wrap = false
opt.clipboard = 'unnamed'
opt.hlsearch = false
opt.splitright = true
opt.ignorecase = true
opt.smartcase = true
opt.shell = 'zsh'
opt.showcmd = true
opt.wildignore = '*/tmp/*,*.so,*.swp,*.zip,*/target/*,*/it-classes/*'
opt.number = true
opt.grepprg = 'rg'
opt.hidden = true
opt.lazyredraw = true
opt.smarttab = true
opt.matchtime = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.expandtab = true
opt.cc = '121'
opt.complete = '.,w,b,u,t,i'
opt.tags = 'tags'
opt.ttyfast = true
opt.mouse = 'a'
opt.updatetime = 300
opt.signcolumn = 'yes'
opt.backup = false
opt.writebackup = false
opt.cmdheight = 2

local map = function(mode, key, command, options)
  options = options or {}
  vim.api.nvim_set_keymap(mode, key, command, options)
end

map('x', 'p', '"_dP', { noremap = true, silent = true })
map('n', 'gx', ':sil !open <c-r><c-a><cr>', { silent = true })
map('n', '<C-p>', ':FzfGFiles<CR>', { noremap = true })
map('n', '<C-b>', ':FzfBuffers<CR>', { noremap = true })
map('n', '<leader>r', ':FzfRg<CR>')
map('n', '<C-f>', 'GoDecls<CR>', { noremap = true })
map('n', '<leader><Tab>', ':b#<CR>', { silent = true })
map('n', '<leader>ya', ':%y+<CR>')
map('', '<C-j>', '<C-W>j')
map('', '<C-k>', '<C-W>k')
map('', '<C-h>', '<C-W>h')
map('', '<C-l>', '<C-W>l')
map('n', '<Up>', '[e')
map('n', '<Down>', ']e')
map('v', '<Up>', '[egv')
map('v', '<Down>', ']egv<F37>')
map('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
map('i', '<Esc>', 'v:lua.smart_esc()', {expr = true, noremap = true})

cmd([[
  au! cursormoved * call PoppyInit()
  autocmd CursorHold * silent call CocActionAsync('highlight')
]])

g.fzf_command_prefix = 'Fzf'
g.easytags_async = 1
g.terminal_scrollback_buffer_size = 100000
g.session_autoload = 'no'
g.go_diagnostics_enabled = 0
g.go_metalinter_enabled = '[]'
g.go_jump_to_error = 0
g.go_fmt_command = "goimports"
g.go_auto_sameids = 0
g.go_highlight_types = 1
g.go_highlight_fields = 1
g.go_highlight_functions = 1
g.go_highlight_function_calls = 1
g.go_highlight_operators = 1
g.go_highlight_extra_types = 1
g.go_highlight_build_constraints = 1
g.go_highlight_generate_tags = 1

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = fn.col('.') - 1
  return col == 0 or fn.getline('.'):sub(col, col):match('%s') ~= nil
end

function _G.smart_tab()
  return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

function _G.smart_esc()
  return vim.fn.pumvisible() == 1 and t'<C-y><Esc>' or t'<Esc>'
end

require'lightspeed'.setup {
  highlight_unique_chars = true,
}

local lsp = require 'lspconfig'
-- For ccls we use the default settings
lsp.ccls.setup {}
-- root_dir is where the LSP server will start: here at the project root otherwise in current folder
lsp.pyls.setup {root_dir = lsp.util.root_pattern('.git', fn.getcwd())}
