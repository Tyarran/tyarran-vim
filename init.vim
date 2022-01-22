call plug#begin('~/.config/nvim/plugged')

"Syntaxes
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jordwalke/vim-reasonml'
Plug 'prettier/vim-prettier'

""Colorschemes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'chriskempson/base16-vim'
Plug 'folke/tokyonight.nvim'

""Tools
Plug 'andymass/vim-matchup'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tommcdo/vim-fubitive'
Plug 'tpope/vim-repeat'
Plug 'romgrk/winteract.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-rhubarb'
Plug 'lewis6991/gitsigns.nvim'
Plug 'terrortylor/nvim-comment'
Plug 'nacro90/numb.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'folke/which-key.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'liuchengxu/vim-clap'
" Plug 'liuchengxu/vista.vim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'gfanto/fzf-lsp.nvim'

"Completion + LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'github/copilot.vim'
Plug 'folke/trouble.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'nvim-lua/popup.nvim'
Plug 'gbrlsnchs/telescope-lsp-handlers.nvim'
" Plug 'tamago324/nlsp-settings.nvim'



call plug#end()

set cursorline
set mouse=a
filetype on
set hidden
set nu
set ai
set si
set ic  "Insensitive case
syn on
filetype indent on
filetype plugin on
let mapleader=","
set background=dark
set t_Co=256
let g:tokyonight_style = "night"
colorscheme tokyonight
set incsearch
set inccommand=nosplit
set hlsearch
set smartcase
set clipboard+=unnamedplus
syntax on

"Keybindings
nmap <C-y> :set hlsearch! hlsearch?<CR>
nnoremap <tab> :bprevious<CR>
nnoremap <backspace> :bnext<CR>
tnoremap <Esc> <C-\><C-n>
nmap <C-p> :Telescope find_files<CR>
nnoremap <Leader>gf :Telescope git_files<CR>
nnoremap <Leader>b :Telescope buffers<CR>
nnoremap <Leader>p :Telescope<CR>
nmap <leader>w :InteractiveWindow<CR>
nnoremap <leader>d :Telescope lsp_dynamic_workspace_symbols<CR>
nnoremap <leader>g :Telescope live_grep<CR>
nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>s :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>H :lua vim.lsp.buf.hover()<CR>


"FuzzyFinding


au BufReadPost *.inc set syntax=php

" set wrap
" set mouse=a



let g:dashboard_default_executive ='telescope'

" Vista
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ 'python': 'vim_lsp',
  \ }

lua require("gitsigns-config")
" lua require("lsp-handlers-config")
lua require("lspconfig-config")
" lua require("lspkind-config")
lua require("lualine-config")
" lua require("null-ls-config")
lua require("nvim-cmp-config")
lua require("nvim-tree-config")
lua require("tree-config")
lua require("treesitter-config")
lua require("telescope-config")
lua require("trouble-config")
lua require("nvim-comment-config")
" lua require("nlsp-settings-config")
lua require("nvim-lsp-installer-config")

lua << EOF
require('nvim-autopairs').setup{}
EOF
lua << EOF
require('toggleterm').setup{}
EOF

lua << EOF
require('numb').setup{}
EOF

let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 0 "1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'notify',
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

nnoremap <C-n> :lua tree.toggle()<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue


autocmd CursorHoldI * lua vim.lsp.buf.signature_help()
set updatetime=500

imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

lua << EOF
hover = function()
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
	  vim.lsp.handlers.hover, { focusable = false }
	)
	vim.lsp.buf.hover()
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
	  vim.lsp.handlers.hover, { focusable = true }
	)
end
EOF
autocmd CursorHold * lua hover()
