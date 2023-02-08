local user_packadd_path = "faerryn_user.nvim/default/default/default/default"
local user_install_path = vim.fn.stdpath "data" .. "/site/pack/user/opt/" .. user_packadd_path
if vim.fn.isdirectory(user_install_path) == 0 then
	os.execute(
	"git clone --quiet --depth 1 https://github.com/faerryn/user.nvim.git " .. vim.fn.shellescape(user_install_path)
	)
end
vim.api.nvim_command("packadd " .. vim.fn.fnameescape(user_packadd_path))

local user = require "user"
user.setup { parallel = true }
local use = user.use

use "faerryn/user.nvim"
use "jeetsukumaran/vim-filebeagle"
use "tpope/vim-commentary"
use "jreybert/vimagit"

use {
	"gruvbox-community/gruvbox",
	config = function()
		vim.api.nvim_command "colorscheme gruvbox"
	end,
}

use "tpope/vim-sensible"

use {
	"ms-jpq/coq_nvim",
	branch = "coq",
	config = function()
    vim.g.coq_settings = {
      auto_start = 'shut-up'
    }
	end,
}

use "junegunn/fzf"
use "junegunn/fzf.vim"
use "tpope/vim-surround"
use {
  "ggandor/leap.nvim",
  config = function()
    require('leap').add_default_mappings()
  end,
}
use "habamax/vim-asciidoctor"
use "github/copilot.vim"

local opt = vim.opt
opt.clipboard = "unnamedplus"
opt.number = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.expandtab = true
opt.cc = '81'
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true
opt.tags = '.git/tags'
opt.textwidth = 80
vim.g.mapleader = ","
vim.g.coq_settings = {
  auto_start = 'shut-up'
}
vim.g.fzf_command_prefix = 'Fzf'
vim.g.easytags_async = 1
vim.g.copilot_no_tab_map = true

local map = function(mode, key, command, options)
  options = options or {}
  vim.api.nvim_set_keymap(mode, key, command, options)
end

map('i', '<C-j>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
map('n', '<C-f>', ':FzfFiles<CR>', { noremap = true })
map('n', '<C-p>', ':FzfGFiles<CR>', { noremap = true })
map('n', '<C-b>', ':FzfBuffers<CR>', { noremap = true })
map('n', '<Tab>', ':b#<CR>', { silent = true })
map('n', '<leader>y', ':%y+<CR>')
map('n', '<leader>u', ':lua require("user").update()')

user.flush()
