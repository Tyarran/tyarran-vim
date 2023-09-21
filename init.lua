vim.g.mapleader = ","


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
	-- essentials
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "HiPhish/nvim-ts-rainbow2" },
		config = function()
			require("treesitter-config")
		end
	},
	-- syntaxes
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
	-- {
	-- 	"elixir-editors/vim-elixir",
	-- 	ft = "elixir"
	-- },
	{
		"simrat39/rust-tools.nvim",
		ft = "rust"
	},

	-- colorscheme
	"catppuccin/nvim",
	"cocopon/iceberg.vim",
	"EdenEast/nightfox.nvim",
	"navarasu/onedark.nvim",
	"folke/tokyonight.nvim",
	{
		"EdenEast/nightfox.nvim",
		config = function()
			require('nightfox').setup({
				options = {
					styles = {
						comments = "italic",
						keywords = "bold",
						types = "italic,bold",
					}
				}
			})
		end
	},
	{
		"giusgad/pets.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "edluffy/hologram.nvim" },
		config = function()
			require("pets").setup()
		end
	},

	-- code tools
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
				current_ligne_blame = true
			})
		end,
		event = "insertEnter",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true
			})
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
	-- 	"TimUntersberger/neogit",
	-- 	config = function()
	-- 		require("neogit").setup({})
	-- 	end,
	-- 	cmd = { "Neogit" },
	-- },
	"wakatime/vim-wakatime",
	{
		"github/copilot.vim",
		event = "BufRead",
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"jfpedroza/neotest-elixir",
		},
		config = function()
			local neotest = require("neotest")
			neotest.setup({
				adapters = {
					require("neotest-elixir")
				}
			})
			vim.keymap.set("n", "<Leader>rt", function()
				neotest.run.run()
			end)
			vim.keymap.set("n", "<Leader>rft", function()
				neotest.run.run(vim.fn.expand("%"))
			end)
			vim.keymap.set("n", "<Leader>to", function()
				neotest.output.open({ enter = true })
			end)
			vim.keymap.set("n", "<Leader>so", function()
				neotest.output.open({ enter = true })
				neotest.summary.open()
			end)
			vim.keymap.set("n", "<Leader>tsc", function()
				neotest.summary.close()
			end)
		end,
		ft = "elixir",
	},
	{
		"tpope/vim-fugitive"
	},
	-- {
	-- 	"LintaoAmons/scratch.nvim",
	-- },
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		config = function()
			require("barbecue").setup {
				theme = "tokyonight"
			}
		end,
		opts = {
			-- configurations go here
		},
	},

	-- interface
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require 'alpha'.setup(require 'alpha.themes.startify'.config)
		end
	},
	{
		"eandrju/cellular-automaton.nvim",
		config = function()
			require("cellular-automation-config")
		end
	},
	{
		"romgrk/winteract.vim",
		-- cmd = "InteractiveWindow",
		config = function()
			vim.keymap.set("n", "<Leader>w", "<cmd>InteractiveWindow<cr>", { silent = true })
		end
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
			{
				"gbrlsnchs/telescope-lsp-handlers.nvim",
				config = function()
					require('telescope').load_extension('lsp_handlers')
				end,
			},
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build =
				"cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
			},
		},
		config = function()
			require("telescope-config")
			vim.keymap.set("n", "<Leader>gf", "<cmd>Telescope git_files<cr>", { silent = true })
			vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", { silent = true })
			-- vim.keymap.set("n", "<C-p>", "<cmd>Telescope git_files<cr>", { noremap = true, silent = true })
			vim.keymap.set("n", "<Leader>p", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
				{ noremap = true, silent = true })
			vim.keymap.set("n", "<Leader>b", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
			vim.keymap.set("n", "<Leader>d", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
				{ noremap = true, silent = true })
			vim.keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
				{ noremap = true, silent = true })
			vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>",
				{ noremap = true, silent = true })
			vim.keymap.set("n", "<C-f>", "<cmd>Telescope live_grep<cr>",
				{ noremap = true, silent = true })
			vim.keymap.set("n", "<leader>cb", "<cmd>Telescope current_buffer_fuzzy_find<cr>",
				{ noremap = true, silent = true })
		end
	},
	{
		"folke/trouble.nvim",
		-- dependencies = {
		-- 	"kyazdani42/nvim-tree.lua"
		-- },
		config = function()
			require("trouble").setup({})
			vim.keymap.set("n", "<Leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
		end,
		cmd = { "TroubleToggle", "Trouble" },
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup()
			vim.keymap.set("n", "<Leader>tt", "<cmd>ToggleTerm<cr>", { silent = true, noremap = true })
		end
	},
	-- {
	-- 	"folke/noice.nvim",
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"rcarriga/nvim-notify"
	-- 	},
	-- 	config = function()
	-- 		require("noice").setup({})
	-- 	end,
	-- 	-- cmd = { "NoiceToggle", "Noice" },
	-- },
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
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("neo-tree").setup()
		end,
		cmd = { "Neotree" },
	},
	{
		'willothy/nvim-cokeline',
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons"
		}, -- If you want devicons
		-- config = true
		config = function()
			require('cokeline').setup({
				sidebar = {
					filetype = { 'neo-tree', 'NvimTree' },
					components = {
						{
							text = function(buf)
								return vim.bo[buf.number].filetype
							end,
							-- ...
						},
					}
				},
			})
			vim.keymap.set('n', '<Tab>', '<Plug>(cokeline-focus-prev)', { silent = true })
			vim.keymap.set('n', '<backspace>', '<Plug>(cokeline-focus-next)', { silent = true })
			vim.keymap.set('n', '<Leader>p', '<Plug>(cokeline-switch-prev)', { silent = true })
			vim.keymap.set('n', '<Leader>n', '<Plug>(cokeline-switch-next)', { silent = true })
			vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { silent = true })

			for i = 1, 9 do
				vim.keymap.set('n', ('<F%s>'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i),
					{ silent = true })
				vim.keymap.set('n', ('<Leader>%s'):format(i), ('<Plug>(cokeline-switch-%s)'):format(i),
					{ silent = true })
			end
		end
	},
	{
		"edluffy/hologram.nvim",
		config = function()
			require('hologram').setup {
				auto_display = false -- WIP automatic markdown image display, may be prone to breaking
			}
		end
	},
	{
		"chrishrb/gx.nvim",
		event = { "BufEnter" },
		config = true, -- default settings
		-- you can specify also another config if you want
		config = function()
			require("gx").setup {
				open_browser_app = "xdg-open", -- specify your browser app; default for macos is "open" and for linux "xdg-open"
				handlers = {
					plugin = true, -- open plugin links in lua (e.g. packer, lazy, ..)
					github = true, -- open github issues
				},
			}
		end,
	},
	{
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"SmiteshP/nvim-navbuddy",
				dependencies = {
					"SmiteshP/nvim-navic",
					"MunifTanjim/nui.nvim"
				},
				-- config = function()
				-- 	-- vim.keymap.set("n", "<Leader>nn", require('nvim-navbuddy').open,
				-- 	-- 	{ silent = true, noremap = true })
				-- end,
				opts = { lsp = { auto_attach = true } }
			}
		},
		config = function()
			vim.keymap.set("n", "<Leader>nn", require('nvim-navbuddy').open,
				{ silent = true, noremap = true })
		end
		-- your lsp config or other stuff
	},
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
			require("mason-lspconfig").setup {
				ensure_installed = { "elixirls", "bashls",
					"pyright", "dockerls",
					"docker_compose_language_service", "cssls", "html", "jsonls", "vimls", "jsonls",
					"lua_ls", "sqlls", "solargraph" }
			}
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
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover,
				{ noremap = true, silent = true })
			vim.keymap.set("n", "<leader>s", vim.lsp.buf.signature_help, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true })
			vim.keymap.set({ "n", "v" }, "<leader>r", vim.lsp.buf.references,
				{ noremap = true, silent = true, buffer = true })
			vim.keymap.set("n", "<leader>t", vim.lsp.buf.document_symbol, { noremap = true, silent = true })
			vim.keymap.set({ "n", "v" }, "<leader>f", vim.lsp.buf.format, { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, { noremap = true, silent = true })
		end
	},

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
		event = "BufRead"
	},

	-- others
	{
		"epwalsh/obsidian.nvim",
		config = function()
			require("obsidian").setup({
				dir = "~/Notes/Notes",
				completion = {
					nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
				}
			})
			vim.keymap.set("n", "<leader>os", ":ObsidianSearch<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>oqs", ":ObsidianQuickSwitch<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>on", ":ObsidianNew ", { noremap = true })
		end,
	},
	{
		"rhysd/vim-grammarous"
	},
}

require("lazy").setup(plugins, opts)
-- vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ft", ":Neotree reveal toggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { noremap = true, silent = true })

local options = {
}

-- vim.opt = { table.unpack(vim.opt or {}), tale.unpack(options) }
-- vim.opt = options
vim.opt.ai = true
vim.opt.background = "dark"
-- vim.opt.clipboard=unnamedplus
vim.opt.cursorline = true
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ic = true
-- vim.opt.Insensitive case
vim.opt.inccommand = "nosplit"
vim.opt.incsearch = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.smartindent = true
vim.opt.smartcase = true
-- vim.opt.t_Co = 256
vim.opt.wrap = true
vim.opt.termguicolors = true
vim.opt.relativenumber = false

-- filetype indent on
-- filetype on
-- filetype plugin on
--
vim.cmd([[

set clipboard+=unnamedplus
set completeopt=menu,menuone,noselect

colorscheme tokyonight-night

"Keybindings
nmap <C-y> :set hlsearch! hlsearch?<CR>
nnoremap <C-d> :BufferClose<CR>
tnoremap <C-n><C-n> <C-\><C-n>
nmap m [m
nmap M ]m
vmap m [m
vmap M ]m
nnoremap <C-w>n :split<CR>
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" aliases
command! TT :ToggleTerm direction=float
autocmd BufReadPost *.re set filetype=reason
autocmd BufWritePre * lua vim.lsp.buf.format()
]])
