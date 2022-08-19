call plug#begin('~/.config/nvim/plugged')

"Syntaxes
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jordwalke/vim-reasonml'
Plug 'prettier/vim-prettier'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'elixir-editors/vim-elixir'

""Colorschemes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'chriskempson/base16-vim'
Plug 'folke/tokyonight.nvim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'EdenEast/nightfox.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'LunarVim/onedarker.nvim'

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
" Plug 'nvim-lualine/lualine.nvim'
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
Plug 'liuchengxu/vista.vim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'gfanto/fzf-lsp.nvim'
Plug 'klen/nvim-test'
Plug 'APZelos/blamer.nvim'
Plug 'TimUntersberger/neogit'

"Completion + LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'github/copilot.vim'
Plug 'folke/trouble.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'nvim-lua/popup.nvim'
Plug 'gbrlsnchs/telescope-lsp-handlers.nvim'
" Plug 'tamago324/nlsp-settings.nvim'


call plug#end()

set completeopt=menu,menuone,noselect

colorscheme tokyonight
" colorscheme duskfox
" colorscheme nightfox
" " colorscheme base16-tomorrow-night
" colorscheme base16-material-darker
" let g:onedark_config = {
"     \ 'style': 'darker',
" \}
" colorscheme onedark
set termguicolors
filetype indent on
filetype on
filetype plugin on
" let g:tokyonight_style = "night"

let mapleader=","
set ai
set background=dark
set clipboard+=unnamedplus
set cursorline
set hidden
set hlsearch
set ic  "Insensitive case
set inccommand=nosplit
set incsearch
set mouse=a
set nu
set si
set smartcase
set t_Co=256
set wrap
syn on
syntax on

"Keybindings
nmap <C-y> :set hlsearch! hlsearch?<CR>
nnoremap <tab> :BufferPrevious<CR>
nnoremap <backspace> :BufferNext<CR>
nnoremap <C-d> :BufferClose<CR>
" tnoremap <Esc> <C-\><C-n>
tnoremap <C-n><C-n> <C-\><C-n>
nmap <C-p> :Telescope find_files<CR>
nnoremap <Leader>gf :Telescope git_files<CR>
nnoremap <Leader>b :Telescope buffers<CR>
nnoremap <Leader>p :Telescope<CR>
nmap <leader>w :InteractiveWindow<CR>
nnoremap <leader>d :Telescope lsp_dynamic_workspace_symbols<CR>
nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>s :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>h :lua vim.lsp.buf.hover()<CR>
nnoremap <c-f> :Telescope live_grep<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>r :lua vim.lsp.buf.references()<CR>
nnoremap <leader>t :lua vim.lsp.buf.document_symbol()<CR>
nnoremap <leader>gt :Telescope lsp_dynamic_workspace_symbols<CR>
nnoremap <leader>f :lua vim.lsp.buf.formatting_sync()<CR>
vnoremap <leader>f :lua vim.lsp.buf.range_formatting()<CR>
nnoremap <leader>xx :TroubleToggle<CR>
nmap m [m
nmap M ]m
vmap m [m
vmap M ]m

" aliases
command! TT :ToggleTerm direction=float


au BufReadPost *.inc set syntax=php


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
" lua require("lualine-config")
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
lua require("dashboard-config")
lua << EOF
require("luasnip.loaders.from_vscode").load()
EOF

lua << EOF
require('nvim-autopairs').setup{}
EOF
lua << EOF
require('toggleterm').setup{}
EOF

lua << EOF
require('numb').setup{}
EOF

lua << EOF
require("nvim-test").setup{}
EOF


" autocmd CursorHoldI * lua vim.lsp.buf.signature_help()
" set updatetime=500

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
autocmd BufWritePre *.re lua vim.lsp.buf.formatting_sync()
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync()
autocmd BufWritePre *.exs lua vim.lsp.buf.formatting_sync()
autocmd BufWritePre *.ex lua vim.lsp.buf.formatting_sync()
