call plug#begin('~/.config/nvim/plugged')

"Syntaxes
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'nkrkv/nvim-treesitter-rescript'
Plug 'danielo515/nvim-treesitter-reason'
Plug 'elixir-editors/vim-elixir'

"
"Tools
Plug 'nvim-lua/plenary.nvim'

"Colorscheme
Plug 'cocopon/iceberg.vim'
Plug 'EdenEast/nightfox.nvim'

"Code tools
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'andymass/vim-matchup'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-rhubarb'
Plug 'lewis6991/gitsigns.nvim'
Plug 'terrortylor/nvim-comment'
Plug 'windwp/nvim-autopairs'
Plug 'liuchengxu/vista.vim'
Plug 'APZelos/blamer.nvim'
Plug 'klen/nvim-test'
Plug 'TimUntersberger/neogit'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'mfussenegger/nvim-dap'

"Interface
Plug 'romgrk/winteract.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'folke/trouble.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'folke/noice.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'MunifTanjim/nui.nvim'
Plug 'nacro90/numb.nvim'
Plug 'folke/which-key.nvim'
Plug 'wfxr/minimap.vim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }


"Completion + LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'onsails/lspkind-nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'github/copilot.vim'
Plug 'folke/lsp-colors.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'nvim-lua/popup.nvim'
Plug 'gbrlsnchs/telescope-lsp-handlers.nvim'
Plug 'norcalli/nvim-colorizer.lua'


call plug#end()

set completeopt=menu,menuone,noselect

colorscheme iceberg

set termguicolors
filetype indent on
filetype on
filetype plugin on

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
nnoremap <tab> :BufferLineCyclePrev<CR>
nnoremap <backspace> :BufferLineCycleNext<CR>
nnoremap <C-d> :BufferClose<CR>
nnoremap <M-h> :tabprevious<CR>
nnoremap <M-l> :tabnext<CR>
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
nnoremap <leader>l :NeoTreeShowToggle<CR>
nnoremap <leader>m :MinimapToggle<CR>
nnoremap <C-w>n :split<CR>
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" aliases
command! TT :ToggleTerm direction=float


let g:rainbow_active = 1


let g:blamer_enabled = 1
let g:matchup_delim_stopline = 5000

lua << EOF
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
-- The first entry (without a key) will be the default handler
-- and will be called for each installed server that doesn't have
-- a dedicated handler.
function (server_name) -- default handler (optional)
	require("lspconfig")[server_name].setup {}
end,
-- Next, you can provide a dedicated handler for specific servers.
-- For example, a handler override for the `rust_analyzer`:
["rust_analyzer"] = function ()
	require("rust-tools").setup {}
end
}
EOF

lua << EOF
require('lspkind').init({
    -- DEPRECATED (use mode instead): enables text annotations
    --
    -- default: true
    -- with_text = true,

    -- defines how annotations are shown
    -- default: symbol
    -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
    mode = 'symbol_text',

    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})
EOF

lua require("gitsigns-config")
" lua require("lspconfig-config")
lua require("lspkind-config")
lua require("lualine-config")
" lua require("null-ls-config")
lua require("nvim-cmp-config")
lua require("nvim-tree-config")
lua require("tree-config")
lua require("treesitter-config")
lua require("telescope-config")
lua require("trouble-config")
lua require("nvim-comment-config")
" lua require("dashboard-config")
" lua require("barbar-config")
lua << EOF
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})
EOF

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

autocmd BufReadPost *.re set filetype=reason
" autocmd BufWritePre *.re lua vim.lsp.buf.formatting_sync()
" autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync()
" autocmd BufWritePre *.exs lua vim.lsp.buf.formatting_sync()
" autocmd BufWritePre *.ex lua vim.lsp.buf.formatting_sync()
" autocmd BufWritePre *.res lua vim.lsp.buf.formatting_sync()
autocmd BufWritePre * lua vim.lsp.buf.format()
