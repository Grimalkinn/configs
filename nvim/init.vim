" Clear the background color for normal text and non-text elements
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight NonText ctermbg=NONE guibg=NONE

" Force application to current session if theme is already loaded
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE


"" 04-Nov-26

""let mapleader="/"

""inoremap <leader> : <CR>
""inoremap <S>> :<CR>
 
"bookmark"

inoremap <C-;> <Esc>:  

""Nigga
syntax on
""set showcmd
set cmdheight=1
set number
""set cursorline
""set cursorcolumn
set relativenumber 
set expandtab
set autoindent
set showmatch
set softtabstop=2
set shiftwidth=2
set tabstop=2
set scrolloff=21
set nohlsearch
set nolist
set noshowmode
set laststatus=1
                                  

syntax on
highlight CursorLineNr cterm=bold ctermbg=darkblue
""syntax on
highlight NumberLine cterm=bold ctermbg=darkblue

filetype on
filetype plugin on
filetype indent on

"" satatus line [git path mode filetype line column page]
""set laststatus=1;
""set git = :!git branch
set statusline+=%1*\┊[%l]
""""""""""""""""""""""""""
fun! GitBranch(file)
    let l:dir = fnamemodify(system('readlink -f ' . a:file), ':h')
    let l:cmd = 'git -C ' . l:dir . ' branch --show-current 2>/dev/null'
    let b:git_current_branch = trim(system(l:cmd))
endfun

augroup GitBranch
    autocmd!
    autocmd BufEnter,ShellCmdPost,FileChangedShellPost * call GitBranch(expand('%'))
augroup END
""""""""""""""""""""""""

set nobackup
set nocompatible
""set encoding=UTF-8
set guifont=DroidSansMono\ Nerd\ Font:h11

""================
fun! MyMode()
  let l:map_mode = {
        \ 'n' : 'NORMAL',
        \ 'v' : 'VISUAL',
        \ 'i' : 'INSERT',
    \ }
  return get(l:map_mode, mode(), mode())
endfun
""================
fun! GitBootyBranch()
  let l:map_booty = {
    \ '' : 'Bitch-less',
    \ }
  return get(l:map_booty, b:git_current_branch, b:git_current_branch)
endfun
""=====================
fun! Anal() abort
  let l:count=ale#statusline#Count(bufnr(''))
  return printf('[Er:%d::Wr:%d] ', l:count.error, l:count.warning)
endfun
""=====================
set statusline+=\ [%{MyMode()}]
set statusline+=\ [%{GitBootyBranch()}]
set statusline+=\ [%t]
set statusline+=\ 
set statusline+=\%m
set statusline+=%=
set statusline+=%=
""set statusline+=\ [%f]
""set statusline+=\%m
set statusline+=%=
set statusline+=%=
set statusline+=\ %{Anal()}
set statusline+=\%y
""set statusline+=\ [%l:%c]
set statusline+=\ [%b::\0x%B] 
set statusline+=\-[%l:%c]
set statusline+=\ [%p%%]\┊
set laststatus=3

hi User1 ctermfg=yellow
hi Visual ctermbg=black ctermfg=darkblue

set completeopt=menuone,noinsert


"make copy paste easier
"vnoremap <leader>ya ggVGy<C-O>
"nnoremap <C-a> ggVG
vmap <C-c> Y<CR> ""copy in normal mode""
vmap <C-v> P<CR>
imap <C-v> <Esc> P<CR>a ""paste in insert mode""

"select with ctrl+shift+left/right righ
inoremap <C-S-Left> <C-o>v
inoremap <C-S-Right> <C-o>v

vnoremap <C-S-C> "+y
inoremap <C-S-V> <C-r>+

"set <C-S-Left>=^[O5D
"set <C-S-Right>=^[O5C

"map tab and enter to autocomplete
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"
""====="" for <enter>
inoremap <silent><expr> <Enter> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<Enter>"
""""inoremap <silent><expr> <cr> "\<c-g>u\<CR>"


"map ctrl+esc to esc
"inoremap <C-Esc><Esc>

"comments single line for diff file types
""inoremap <C-/> :<S-Left>exe "<S-Right>normal! I".b:commentType<CR>
""autocmd BufReadPost *.java let b:commentType='// ' #java

"custom comment cmd to cut line, place // and paste line
"inoremap <C-/> !bookmark

"map ctrl+l to clear whole line
""imap <silent> <C-l> <Esc>:d<CR>a
inoremap <silent> <C-l> <Esc>:d<CR>i

" set the indent char => '┊'
""let g:indentLine_char = " "🔃️↪️ ↔️ ↕️ ⚪️ ↩️  🔋️💣️🗿️🚬️🪦️💯️
let g:indentLine_char = "::"
""let g:indentLine_char_list = ['|','¦', '┆', '┊']
""let g:indentLine_char_list = ['|','¦', '┆', '┊']
let g:indentLine_char_list = ['┊','┆','¦','|', '┊']
 ""paste in insert mode""""""
""set statusline+=\-[%{b:git_current_branch}]
 ""paste in insert mode""""""♊️
                                    
"first line indent
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_first_char = '┊'  " '|' '↪️'  paste in insert mode

"save with ctrl+s & stay in insert mode
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

"map :q! to ctrl+q to quit from any mode
nmap <c-q> :q!<CR>
inoremap <C-Q> <C-O>:q!<CR>

"map crtl+right  to move completely right
inoremap <C-Right> <C-o>E<Right>

"map c+del to del right
imap <C-Del> <C-o>ce
"map c+backspace to del left    
""inoremap <C-w> <C-\><C-o>dB
imap <C-h> <C-o>db
imap <C-BS> <C-w>

""imap <C-BS> <C-\><C-h>
""inoremap <C-h> <C-w>
""noremap! <C-BS> <C-w>
""noremap! <C-h> <C-w>
"inoremap <C-BS> <Esc>dd

"del to left
"imap <C-BS> <Esc>db
"inoremap <silent> <C-bs> :nohlsearch<CR><C-bs>

"auto compete brackets
inoremap } {}<Esc>ha
inoremap ) ()<Esc>i
inoremap ] []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha
inoremap // // <Esc>a
inoremap > <><Esc>ha

"map :wq to ctrl+w
noremap! <c-w> <Esc>:wq<CR>
nmap <c-w> :wq<CR>
"imap <c-w> <Esc>:wq

"map :!% to ctrl+b to run/build executabe
nmap <c-b> :! chmod +x % ; ./%<CR>

"map Ctrl+Esc to build from src
nmap <C-Esc> :! 

"map ctrl+e to make file executable
"nmap <c-e> :! chmod +x %<CR>

"map ctrl+f to search use n for next and N for back
inoremap <C-F> /
"map <Esc><C-F> :vimgrep /

"map ctrl+o to open in new tab 
"nmap <C-O> t:e  

"map ctrl+u to undo and crtl+r to redo 
"inoremap <C-U> <C-O>u
inoremap <C-R> <C-O><C-R>

"Turn off bracket highlighting cum here
let loaded_matchparen = 1 

"open file
nmap <C-o> :e
"imap <C-o> :e 

"New tab
imap <silent> <C-t> <Esc>:tabnew<CR>
nmap <silent> <C-t> :tabnew<CR>

"map ctrl+p to PlugInstall
nmap <c-p> :PlugInstall<CR>

"insert and remove comments in visual and normal mode
""imap  ,<C-/> :s/^////g<CR>:let @/ = ""<CR>
""imap  ,<C-/> :s/^////g<CR>:let @/ = "// "<CR>

" Normal Mode: Insert '// ' at the beginning of the current line
nnoremap <silent> <C-/> I// <ESC>
nnoremap <silent> <C-_> I// <ESC>
" Visual Mode: Insert '// ' at the beginning of all selected lines
vnoremap <silent> <C-/> :s/^/\/\/ /<CR>:noh<CR>
vnoremap <silent> <C-_> :s/^/\/\/ /<CR>:noh<CR>
" Insert Mode: Insert '// ' at the beginning of the line without leaving insert mode
inoremap <silent> <C-/> <Esc>I// <Esc>la
inoremap <silent> <C-_> <Esc>I// <Esc>la

"uncomment with ctrl+\"
" Normal Mode: Remove '// ' from the start of the line if it exists
nnoremap <silent> <C-\> :s/^\(\s*\)\/\/ /\1/<CR>:noh<CR>
" Insert Mode: Remove '// ' from the start of the line and return to editing
inoremap <silent> <C-\> <Esc>:s/^\(\s*\)\/\/ /\1/<CR>:noh<CR>f/hi
" Visual Mode: Remove '// ' from the start of all selected lines
vnoremap <silent> <C-\> :s/^\(\s*\)\/\/ /\1/<CR>:noh<CR>gv




"toggle file manager
let g:coc_disable_startup_warning = 1
imap <C-e> <Esc>:NERDTreeToggle<CR>a
nmap <C-e> :NERDTreeToggle<CR>

"Enable mouse click for nvim
set mouse=a

"Fix cursor replacement after closing nvim
"set guicursor=
"https://github.com/ryanoasis/vim-devicons
"
"
"Shift + Tab does inverse tab
inoremap <S-Tab> <C-d>


"See invisible characters
"set list listchars=tab:>\ ,trail:+,eol:$
""

"" highlight
highlight! number ctermfg=grey 
highlight! EndOfBuffer ctermfg=white cterm=NONE
highlight! statusline ctermfg=NONE cterm=NONE


"" plugins 
call plug#begin('~/.local/share/nvim/site/plugged')

"Plug 'relastle/bluewery.vim'
"Plug 'nelstrom/vim-blackboard', {'branch':'release'}
"Plug 'hardselius/warlock', {'branch':'colors'}
"Plug 'Yggdroot/indentLine'
Plug 'hrsh7th/nvim-cmp'
"Plug 'hrsh7th/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-path'
"Plug 'hrsh7th/cmp-cmdline'
Plug 'wbthomason/packer.nvim'
Plug 'L3MON4D3/LuaSnip'
""Plug 'saadparwaiz1/cmp_luasnip'
"Plug 'lukas-reineke/indent-blankline.nvim'
">"Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'Yggdroot/indentline'
Plug 'ellisonleao/gruvbox.nvim'
""Plug 'folke/which-key.nvim'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch':'release'}
"Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/ryanoasis/vim-devicons'
"Plug 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'

call plug#end()

let g:NERDTreeDirArrowExpandable="📁"  "↪️ 🔃️
let g:NERDTreeDirArrowCollapsible="📂" "↪️ ◻️◼️🔃️↪️ ↔️ ↕️ ⚪️ ↩️ ➖️ ➕️
let NERDTreeIgnore=['\.class$', '\.pdf$']

" air-line 
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1

"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif

" unicode symbols
"let g:NERDTreeIndicatorMapCustom ={"Modified"  : "✹", "Staged"    : "✚","Untracked" : "✭","Renamed"   : "➜","Unmerged"  : "═","Deleted"   : "✖","Dirty"     : "✗","Clean"     : "✔", 'Ignored'   : '☒', "Unknown"   : "?"}

"colorscheme warlock
"let g:lightline = { 'colorscheme': 'bluewery' }


"lua require("init")
"

""""""""""
""open config file in new tab
nmap <C-,> :-tab ~/.config/nvim/init.vim 


"custom autocomplete(macros java)
inoremap sout System.out.println();<Esc>hha
inoremap prln System.out.println();<Esc>hha
""inoremap prin System.out.print();<Esc>hha
""inoremap clas class {}<Esc>hha
inoremap pucl public class {}<Esc>hha
""inoremap func public void () {}<Esc>hhhhha
""inoremap maim public static void main(String a[]) {}<Esc>ha
""inoremap util import java.util.*; import java.io.*;
inoremap fori for (int i=0; i<
""inoremap whil while () {}<Esc>hhhha
inoremap try try ()<Esc>ha
inoremap catch catch(Exception e){}<Esc>hhha
""inoremap if if () ;<Esc>hhha
inoremap elif else if () ;<Esc>hhha
""inoremap @Ova @Override 

set wildmenu
""set wildmenu=longest.list.full
set wildignore=*.docx,*.jpg,*.pdf,*.class,
