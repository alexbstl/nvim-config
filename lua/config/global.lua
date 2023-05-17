vim.g.markdown_fenced_languages = { 'html', 'python', 'bash=sh', 'R=r' }
vim.opt.termguicolors = true

-- more opinionated
vim.opt.number = true                  -- show linenumbers
vim.opt.timeoutlen = 400               -- until which-key pops up
vim.opt.updatetime = 250               -- for autocommands and hovers
vim.opt.mouse = 'a'                    -- enable mouse
vim.opt.mousefocus = true
vim.opt.clipboard:append 'unnamedplus' -- use system clipboard

-- don't ask about existing swap files
vim.opt.shortmess:append 'A'

-- use spaces as tabs
local tabsize = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = tabsize
vim.opt.tabstop = tabsize

-- space as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- smarter search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- colortheme tweaks
vim.g.nord_borders = true

-- indent
vim.opt.smartindent = true
vim.opt.breakindent = true

-- consistent number column
vim.opt.signcolumn = "yes:1"

-- how to show autocomplete menu
vim.opt.completeopt = 'menuone,noinsert'

-- add folds with treesitter grammar
vim.opt.foldmethod = "expr"
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- but open all by default
vim.opt.foldlevel = 99

-- global statusline
vim.opt.laststatus = 3

-- split right and below by default
vim.opt.splitright = true
vim.opt.splitbelow = true

--tabline
vim.opt.showtabline = 1

--windowline
vim.opt.winbar = '%t'

--don't continue comments automagically
vim.opt.formatoptions:remove({ 'c', 'r', 'o' })

-- hide cmdline when not used
vim.opt.cmdheight = 0

-- set linewrap and max column
--vim.opt.textwidth = 100
vim.wo.wrap = true
--vim.opt.colorcolumn = '+1' -- Set the colour column to highlight one column after the 'textwidth'
--vim.wo.linebreak = true
vim.wo.list = false

--filetype plugin indent on 
vim.api.nvim_command('filetype plugin indent on')

--load vimscript stuff

--[[ local Plug = vim.fn['plug#']
vim.call('plug#begin','$HOME/.local/share/nvim/site/autoload')
Plug 'lervag/vimtex'
vim.call('plug#end') ]]

--[[ --Vimtex Stuff
vim.g.tex_flavor = 'latex'
if(vim.loop.os_uname().sysname=='Macunix')
then
  vim.g.vimtex_view_method='skim'
  --vim.g.vimtex_view_skim_activate=1
  vim.g.vimtex_view_skim_sync=1
  vim.g.vimtex_view_skim_reading_bar=1
else
  vim.g.vimtex_view_general_viewer='okular'
  vim.g.vimtex_view_general_options = '--noraise --unique @pdf\\#src:@line@tex'
end
vim.g.vimtex_quickfix_mode = 0
vim.opt_local.conceallevel = 2
vim.g.tex_conceal='abdmg'
vim.g.vimtex_compile_progname='nvr' ]]


