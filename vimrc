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
"Plugin 'reedes/vim-pencil'
"Plugin 'reedes/vim-colors-pencil'
"Plugin 'reedes/vim-wordy'
"Plugin 'junegunn/limelight.vim'
Plugin 'reedes/vim-lexical'
"Plugin 'reedes/vim-litecorrect'
Plugin 'majutsushi/tagbar'
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch.vim'
"Plugin 'vim-scripts/LanguageTool'
Plugin 'rhysd/vim-grammarous'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'klen/python-mode'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
"Plugin 'jnurmine/Zenburn'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/nginx.vim'
Plugin 'asciidoc/vim-asciidoc' 
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax' 
"Plugin 'vim-scripts/FuzzyFinder'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
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

augroup pencil
        autocmd!
        "autocmd FileType markdown,asciidoc call pencil#init()
        "autocmd FileType text call pencil#init()
        autocmd FileType asciidoc call lexical#init()
        "autocmd FileType asciidoc call litecorrect#init()
augroup END

au BufNewFile,BufRead *.asc set filetype=asciidoc

let g:tagbar_type_asciidoc = {
    \ 'ctagstype' : 'asciidoc',
    \ 'kinds' : [
        \ 'h:table of contents',
        \ 'a:anchors:1',
        \ 't:titles:3',
        \ 'n:includes:1',
        \ 'i:images:3',
        \ 'I:inline images:3'
    \ ],
    \ 'sort' : 0
\ }

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


"PATH for langague tools plugin
let g:languagetool_jar='/home/kh/LanguageTool/LanguageTool-2.9/languagetool-commandline.jar'

"Leader key
let mapleader=" "

"Colors

"for zenburn 256-color mode needed, system wise : export TERM=xterm-256color
"set t_Co=256
"colors zenburn

syntax enable

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

set encoding=utf-8

" autocomplete window goes away when you’re done
let g:ycm_autoclose_preview_window_after_completion=1


let python_highlight_all=1
syntax on

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
nnoremap <F9> :SyntasticCheck<CR> :SyntasticToggleMode<CR>


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
map <C-n> :NERDTreeToggle<CR>

" definition of whatever currently on
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>h :YcmCompleter GetDoc<CR>

"Spell checking
"set spell spelllang=en_gb
map <F3> :setlocal spell! spelllang=fr_FR<CR>
map <F4> :setlocal spell! spelllang=en_gb<CR>
map <F5> :LanguageToolCheck <CR>
map <F6> :LanguageToolClear <CR>
map <F8> :TagbarToggle<CR>
