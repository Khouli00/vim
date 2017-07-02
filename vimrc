" @a:Khalid
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

"my plugins

Plugin 'vim-scripts/L9'
Plugin 'majutsushi/tagbar'
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tomasr/molokai'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/nginx.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax' 
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-commentary'
Bundle "lepture/vim-jinja"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Personal change

"Color
syntax enable
colorscheme molokai
let g:rehash256 = 1


"Work in UTF-8
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" See the docstrings for folded code
let g:SimpylFold_docstring_preview=1

"Remap for insearch plugin
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
":h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"Leader key
let mapleader=","

"Colors
set t_Co=256

"Spaces and tab

set tabstop=4       " number of visual spaces per TAB 
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces

"Copy to clipboard
set clipboard=unnamedplus

"UI config

set number              " show line numbers
set showcmd             " show command in bottom bar
"set cursorline          " highlight current line
" Status Line {  
        set laststatus=2                             " always show statusbar  
        set statusline=  
        set statusline+=%-10.3n\                     " buffer number  
        set statusline+=%f\                          " filename   
        set statusline+=%h%m%r%w                     " status flags  
        set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type  
        set statusline+=%=                           " right align remainder  
      " set statusline+=0x%-8B                       " character value  
        set statusline+=%-14(%l,%c%V%)               " line, character  
        set statusline+=%<%P                         " file position  
"} 



" Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let python_highlight_all=1
syntax on


"option autocmplete
let g:ycm_python_binary_path = 'python'
let g:ycm_server_python_interpreter = '/usr/bin/python3'
" autocomplete window goes away when you’re done
let g:ycm_autoclose_preview_window_after_completion=1


"Option syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }


"Usage: :Shell ls -al 
"Possible to reexecute the command by typing <localleader>r in normal mode in
"a window opened by :Shell. 
"The command :Shell! reexecute the last command. 

function! s:ExecuteInShell(command)
        let command = join(map(split(a:command), 'expand(v:val)'))
        let winnr = bufwinnr('^' . command . '$')
        silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
        setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
        echo 'Execute ' . command . '...'
        silent! execute 'silent %!'. command
        silent! execute 'resize ' . line('$')
        silent! redraw
        silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
        silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
        echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)


"remap stuff
map <C-t> :NERDTreeToggle<CR>
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>h :YcmCompleter GetDoc<CR>
map <C-n> :bnext<CR>
map <C-b> :bprevious<CR>



"Spell checking
"set spell spelllang=en_gb
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
map <F3> :setlocal spell! spelllang=fr_FR<CR>
map <F4> :setlocal spell! spelllang=en_gb<CR>
map <F8> :TagbarToggle<CR>
nnoremap <F9> :SyntasticCheck<CR> :SyntasticToggleMode<CR>
