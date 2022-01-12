let $PATH=$PATH . ':' . $HOME . '/.local/bin'
let $PATH=$PATH . ':' . $HOME . '/bin'
let $PATH=$PATH . ':' . $HOME . '/usr/local/bin'
call plug#begin('~/.config/nvim/plugged')

"Syntaxes
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'jordwalke/vim-reasonml'
Plug 'nelsyeung/twig.vim'

""Colorschemes
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim'}
Plug 'drewtempelmeyer/palenight.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'chriskempson/base16-vim'
Plug 'folke/tokyonight.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'yunlingz/equinusocio-material.vim'
Plug 'mhartington/oceanic-next'

""Autocompletion
" Plug 'neoclide/coc.nvim'
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Plug 'antoinemadec/coc-fzf'

""Tools
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fubitive'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ojroques/nvim-lspfuzzy'
Plug 'gfanto/fzf-lsp.nvim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'jlanzarotta/bufexplorer'
Plug 'romgrk/winteract.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'axelf4/vim-strip-trailing-whitespace'
" Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'liuchengxu/vista.vim'
Plug 'vbe0201/vimdiscord'
Plug 'nvim-lua/plenary.nvim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'nvim-lualine/lualine.nvim'

" Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
" Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'onsails/lspkind-nvim'
Plug 'github/copilot.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'gbrlsnchs/telescope-lsp-handlers.nvim'
" Plug 'weilbith/nvim-lsp-smag'


call plug#end()

set cursorline
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
set showcmd
set t_Co=256
let g:tokyonight_style = "night"
let g:tokyonight_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }
" colorscheme base16-material-palenight
colorscheme tokyonight

"" -- normal mode mapping
nmap <leader>tb :Vista<CR>
nmap <C-y> :set hlsearch! hlsearch?<CR>
nnoremap <tab> :bprevious<CR>
nnoremap <backspace> :bnext<CR>
tnoremap <Esc> <C-\><C-n>


"FuzzyFinding
" nmap <leader>b :Clap buffers<CR>
nmap <C-p> :Telescope find_files<CR>

nmap <leader>e :lua tree.open()<CR>
nmap <leader>ee :lua tree.close()<CR>

"" -- Search
set incsearch
set inccommand=nosplit
set hlsearch
set smartcase

set wrap
set mouse=a

" NERDTree configuration
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_winsize = 20
" let NERDTreeShowHidden=0
" let NERDTreeIgnore=['.bs.js$', '__pycache__$']

" Nvim-tree
nnoremap <leader>ff :lua tree.open()<CR>


"FZF
let g:fzf_preview_window = ['up', 'ctrl-/']
" nnoremap <Leader>gt :CocList symbols<CR>
" nnoremap <Leader>t :CocList tags<CR>
" let g:fzf_tags_command = 'ctags -R'
nnoremap <Leader>gf :Telescope git_files<CR>
nnoremap <Leader>b :Telescope buffers<CR>
nnoremap <Leader>p :Telescope<CR>

" Coc
" nnoremap <leader>d :CocList diagnostics<CR>

set clipboard+=unnamedplus

" Winteract
nmap <leader>w :InteractiveWindow<CR>

" Rainbow brackets
let g:rainbow_active = 1


let g:localvimrc_ask=0


" For Neovim 0.1.3 and 0.1.
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"NeoVIm
"/home/romain/.local/pipx/shared/bin/python3
let g:python3_host_prog = $HOME.'/.local/share/virtualenvs/nvim3/bin/python'
let g:loaded_ruby_provider = 0
let g:python_host_prog = $HOME.'/.local/share/virtualenvs/vim2/bin/python'

syntax on

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" " Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" nmap <silent> grr <Plug>(coc-references)

" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" " Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" " Map function and class text objects
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" " Remap <C-f> and <C-b> for scroll float windows/popups.
" " Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
" nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
" nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
" inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" " Use CTRL-S for selections ranges.
" " Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" " Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')

" " Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" " Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" " Mappings for CoCList
" " Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

au BufReadPost *.inc set syntax=php

noremap <C-8> <C-\><C-n>
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

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

" Dashboard
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
lua require("null-ls-config")
lua require("nvim-cmp-config")
lua require("nvim-tree-config")
lua require("tree-config")
lua require("treesitter-config")
lua require("telescope-config")
