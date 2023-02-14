local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

plugins = {
	-- syntaxes
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("treesitter")
			-- require("nvim-treesitter.configs").setup({
			-- 	ensure_installed = "all"
			-- })
		end,
		event = "BufRead",
	},
	{
		"nkrkv/nvim-treesitter-rescript",
		ft = "rescript"
	},
	{
		"danielo515/nvim-treesitter-reason",
		ft = "reason"
	},
	{
		"reasonml-editor/vim-reason-plus",
		ft = "reason"
	},
	{
		"elixir-editors/vim-elixir",
		ft = "elixir"
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust"
	},
	-- { "mhanberg/elixir.nvim",
	-- 	dependencies = { "nvim-lua/plenary.nvim" }, ft = "elixir", config = function()
	-- 	require("elixir").setup({ enableTestLenses = true })
	-- end },

	-- colorscheme
	"catppuccin/nvim",
	"cocopon/iceberg.vim",
	"EdenEast/nightfox.nvim",

	-- code tools
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
				current_ligne_blame = true
			})
		end,
		event = "BufRead",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
		event = "BufRead",
	},
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup()
		end,
		event = "BufRead",
	},
	{
		"windwp/nvim-autopairs",
		event = "BufRead",
	},
	{
		"liuchengxu/vista.vim",
		cmd = { "Vista" },
	},
	-- {
	-- 	"klen/nvim-test",
	-- 	config = function()
	-- 		require("nvim-test").setup()
	-- 	end,
	-- 	event = "BufRead",
	-- },
	{
		"TimUntersberger/neogit",
		config = function()
			require("neogit").setup({})
		end,
		cmd = { "Neogit" },
	},
	"wakatime/vim-wakatime",
	{
		"github/copilot.vim",
		event = "BufRead",

	},

	-- interface
	{
		"glepnir/dashboard-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = 'VimEnter',
		config = function()
			require("dashboard-config")
		end
	},
	{
		"romgrk/winteract.vim",
		cmd = "InteractiveWindow"
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup()
		end
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "gbrlsnchs/telescope-lsp-handlers.nvim",
				config = function()
					require('telescope').load_extension('lsp_handlers')
				end
			}
		},
		config = function()
			require("telescope-config")
		end,
		cmd = "Telescope"
	},
	{
		"folke/trouble.nvim",
		-- dependencies = {
		-- 	"kyazdani42/nvim-tree.lua"
		-- },
		config = function()
			require("trouble").setup({})
		end,
		cmd = { "TroubleToggle", "Trouble" },
	},
	{
		"akinsho/toggleterm.nvim",
	},
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify"
		},
		config = function()
			require("noice").setup({})
		end,
		-- cmd = { "NoiceToggle", "Noice" },
	},
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
		cmd = "WhichKey"
	},
	{ "nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("neo-tree").setup()
		end,
		cmd = { "NeoTreeToggle", "NeoTreeFocusToggle" },
	},
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup()
		end
	},

	-- LSP
	{
		"williamboman/mason.nvim",
		dependencies = {
			"mfussenegger/nvim-dap",
			"mhartington/formatter.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig"
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()
			require("mason-lspconfig").setup_handlers {
				-- The first entry (without a key) will be the default handler
				-- and will be called for each installed server that doesn't have
				-- a dedicated handler.
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup {}
				end,
				-- Next, you can provide a dedicated handler for specific servers.
				-- For example, a handler override for the `rust_analyzer`:
				["rust_analyzer"] = function()
					require("rust-tools").setup {}
				end
			}
		end },

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			"hrsh7th/cmp-emoji",
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			"onsails/lspkind.nvim",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			-- "molleweide/LuaSnip-snippets.nvim",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("nvim-cmp-config")
		end,
		event = "InsertEnter"
	},
}

require("lazy").setup(plugins, opts)
vim.g.maploader = ","

vim.cmd([[

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
nnoremap <leader>l :NeoTreeFocusToggle<CR>
nnoremap <leader>m :MinimapToggle<CR>
nnoremap <C-w>n :split<CR>
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" aliases
command! TT :ToggleTerm direction=float

autocmd BufReadPost *.re set filetype=reason
" autocmd BufWritePre *.re lua vim.lsp.buf.formatting_sync()
" autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync()
" autocmd BufWritePre *.exs lua vim.lsp.buf.formatting_sync()
" autocmd BufWritePre *.ex lua vim.lsp.buf.formatting_sync()
" autocmd BufWritePre *.res lua vim.lsp.buf.formatting_sync()
autocmd BufWritePre * lua vim.lsp.buf.format()
]])
