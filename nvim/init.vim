call plug#begin('~/.vim/plugged')
" Nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" scala
Plug 'derekwyatt/vim-scala'
" yaml
Plug 'stephpy/vim-yaml'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" themes
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'Mofiqul/codedark.nvim'
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" github copilot
Plug 'github/copilot.vim'
" dev icons
Plug 'ryanoasis/vim-devicons'
" multiple cursors
Plug 'terryma/vim-multiple-cursors'
" colorschemes
Plug 'rafi/awesome-vim-colorschemes'
" start screen
Plug 'mhinz/vim-startify'
call plug#end()

set shell=/usr/bin/zsh

syntax on

" True color support
if (has('termguicolors'))
  set termguicolors
endif

" theme
" let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
" let g:material_theme_style = 'default'
colorscheme material


set laststatus=2
set number 
set noswapfile 
set hlsearch 
set ignorecase 
set incsearch 
set encoding=UTF-8
set smartcase
set autoindent
set shiftwidth=4
set relativenumber

" Better display for messages
set cmdheight=2

" split terminal in bottom
set splitbelow

" NERDTree settings
nmap <C-f> :NERDTreeToggle<CR>
map <C-S> :NERDTreeFind<CR>
nnoremap <leader>n :NERDTreeFocus<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1

" Nerdtree git plugin symbols
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "ᵐ",
    \ "Staged"    : "ˢ",
    \ "Untracked" : "ᵘ",
    \ "Renamed"   : "ʳ",
    \ "Unmerged"  : "ᶴ",
    \ "Deleted"   : "ˣ",
    \ "Dirty"     : "˜",
    \ "Clean"     : "ᵅ",
    \ "Unknown"   : "?"
    \ }

" quit terminal shortcut
tnoremap <Esc> <C-\><C-n>

" open NERDTree automatically
" autocmd VimEnter * NERDTree
" Fuzzy finder shortcut
nnoremap <C-p> :FZF<CR>

nnoremap <C-g> :Rg<cr>
let g:fzf_layout = { 'down': '~40%' }

" ripgrep
if executable('rg')
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
set grepprg=rg\ --vimgrep
" Get text in files with Rg
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
\   fzf#vim#with_preview(), <bang>0)
" Rg
nnoremap <silent> <Leader>fa :Find<CR>
" Rg current worda
nnoremap <Leader>fw :Rg <C-R><C-W><space>
endif

" metals scala
autocmd FileType json syntax match Comment +\/\/.\+$+

" Help Vim recognize *.sbt and *.sc as Scala files
au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsPackages'
nnoremap <silent> <space>tp :<C-u>CocCommand metals.tvp metalsPackages<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Reveal current current class (trait or object) in Tree View 'metalsPackages'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)


" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')


" Remap for do action format
"nmap <silent> F <Plug>(coc-action-format) "does not work
nnoremap <silent> F :call CocAction('format')<CR>

" split resize
nmap <M-h> :vertical resize +1<CR>
nmap <M-l> :vertical resize -1<CR>
nmap <M-k> :resize +1<CR>
nmap <M-j> :resize -1<CR>
