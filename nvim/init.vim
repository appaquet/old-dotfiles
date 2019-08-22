set nocompatible        " be iMproved

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Misc settings
""
  syntax on
  filetype plugin on

  set backspace=2
  set ruler               " show the ruler
  set showmatch           " show matching brackets/parenthesis
  set incsearch           " find as you type search
  set hlsearch            " highlight search terms
  set nu                  " Line numbers on
  set smartcase           " case sensitive when uc present
  set ignorecase          " case insensitive search
  set hidden              " Buffer switching without saving

  set autoread            " Auto reread modified file
  set autoindent          " indent at the same level of the previous line
  set mouse=a             " automatically enable mouse usage

  set exrc                " allow project specific .vimrc
  set secure              " (https://andrew.stwrt.ca/posts/project-specific-vimrc/)

  "" Persists the undo across sessions
  set undodir=~/.vim/undodir
  set undofile

  "" Fixes slow escape in tmux
  "" https://www.reddit.com/r/neovim/comments/35h1g1/neovim_slow_to_respond_after_esc/
  if !has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
    augroup END
  endif

  "" fish doesn't play well with vim
  "" See https://github.com/VundleVim/Vundle.vim
  set shell=/bin/bash

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Key mapping
""

"" Various buffers mapping
  map <D-1> :br!<CR>
  map <Leader>1 :br!<CR>
  map <D-2> :br!<CR>:bn!<CR>
  map <Leader>2 :br!<CR>:bn!<CR>
  map <D-3> :br!<CR>:bn! 2<CR>
  map <Leader>3 :br!<CR>:bn! 2<CR>
  map <D-4> :br!<CR>:bn! 3<CR>
  map <Leader>4 :br!<CR>:bn! 3<CR>
  map <D-5> :br!<CR>:bn! 4<CR>
  map <Leader>5 :br!<CR>:bn! 4<CR>
  map <D-6> :br!<CR>:bn! 5<CR>
  map <Leader>6 :br!<CR>:bn! 5<CR>
  map <D-7> :br!<CR>:bn! 6<CR>
  map <Leader>7 :br!<CR>:bn! 6<CR>
  map <D-8> :br!<CR>:bn! 7<CR>
  map <Leader>8 :br!<CR>:bn! 7<CR>
  map <D-9> :br!<CR>:bn! 8<CR>
  map <Leader>9 :br!<CR>:bn! 8<CR>
  map <Leader>] :bn!<CR>
  map <Leader>[ :bp!<CR>
  map <Leader>x :w<CR>:!./%<CR>
  map <Leader>z :'<,'>w !sh<CR>
  map <D-x> :w<CR>:!./%<CR>
  map <D-s> :w<CR>
  map <Leader>s :w<CR>
  map <D-r>r :!./rsync.sh<CR>
  map <Leader>r :!./rsync.sh<CR>
  map <D-q> :q<CR>
  map <Leader>q :q<CR>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null
cmap wq wqa
cmap qw wqq

" Allow creating a file in current buffer's directory by using "E" or "New"
fun! NewCfd( arg )
  execute 'e %:p:h/' . a:arg
endfunction
command! -nargs=* E call NewCfd( '<args>' )
command! -nargs=* New call NewCfd( '<args>' )

" Delete current file. You need to close it after.
fun! DeleteCfd( arg )
  let l:curfile = expand("%")
  silent exe ":!rm ". l:curfile
  silent exe "bwipe! " . l:curfile
endfunction
command! -nargs=* Delete call DeleteCfd( '<args>' )

" Toggle mouse for copy
nmap <Leader>m :call ToggleMouse()<CR>
function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
        set nonumber
    else
        " enable mouse everywhere
        set mouse=a
        set number
    endif
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Identation preferences
""

" Defaults to spaces
setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>

" Some files forced to spaces
autocmd FileType hpp setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>
autocmd FileType h setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>
autocmd FileType cpp setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>
autocmd FileType scala setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>
autocmd FileType lua setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>
autocmd FileType rb setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>

" Allow switching by doing <leader><tab>
nmap <leader><tab> :call SwitchTab()<CR>
function! SwitchTab()
  if (&l:expandtab)
    echo "Switched to Tabs"
    setlocal noexpandtab shiftwidth=4 tabstop=4 cino=N-s<CR>
  else
    echo "Switched to Spaces"
    setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>
  endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugins

  ""
  "" Vundle bundle manager
  ""     -> Bundle manager. To download/update bundles execute: vim +BundleInstall +qall
  ""
    set rtp+=~/.config/nvim/bundle/Vundle.vim
    call vundle#begin()            " required
    Plugin 'VundleVim/Vundle.vim'  " required

  ""
  "" Nerdtree
  ""     -> Show a file tree when you press ctrl-e, select current file <leader> e
  ""
    Plugin 'scrooloose/nerdtree'
    map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
    map <Leader>e :NERDTreeFind<CR>

  ""
  "" Base16 theme
  ""
    set background=dark     " Assume a dark background
    Plugin 'chriskempson/base16-vim'

  ""
  "" Airline (Powerline + Minibufexp alternative)
  ""
    Plugin 'vim-airline/vim-airline'
    let g:airline#extensions#tabline#enabled = 1
    if !has('gui_running')
      let g:airline_powerline_fonts = 1
      Plugin 'vim-airline/vim-airline-themes'
      let g:airline_theme='base16_default'
    endif

  ""
  "" Ctrlp
  ""     -> Fuzy search in file name / tags
  ""     -> You can add .vimrc in a project's folder to add more ignore
  ""
    let g:ctrlp_working_path_mode=0
    let g:ctrlp_persistent_input=0
    set wildignore+=*/.git*,*/.hg/*,*/.svn/*,*/_*,*/.DS*,*/.*swp,*/*.d,*/*.o,*/*.class,*/target/*
    Plugin 'ctrlpvim/ctrlp.vim'

  ""
  ""  Ripgrep
  ""     -> Ripgrep wrapper
  ""
    Plugin 'jremmen/vim-ripgrep'
    map <Leader>r :Rg <cword><CR>

  ""
  "" YouCompleteMe
  ""     -> Autocomplete for C, C++, Python, JavaScript and a ton more
  ""     -> More steps required for installation: https://github.com/Valloric/YouCompleteMe#mac-os-x-installation
  ""     -> Need to go to ~/.vim/bundle/YouCompleteMe and ./install.sh --tern-completer --clang-completer
  ""
    Plugin 'Valloric/YouCompleteMe'
    let g:ycm_autoclose_preview_window_after_insertion = 1 " Auto close after inserted (smarter than default vim)
    au FileType python nmap <leader>d :YcmCompleter GoTo<CR>
    au FileType javascript nmap <leader>d :YcmCompleter GoTo<CR>

    function! SwitchSourceHeader()
      if (expand ("%:e") == "cpp")
        find %:t:r.hpp
      else
        find %:t:r.cpp
      endif
    endfunction

    au FileType cpp nmap <leader>s :call SwitchSourceHeader()<CR>
    au FileType hpp nmap <leader>s :call SwitchSourceHeader()<CR>

  ""
  "" Multiple-cursors
  ""    -> Ctrl-n on a word and then ctrl-n to select next, next, next and do
  ""       modification on all of them). Ctrl-x to skip one, Ctrl-p to
  ""       go to previous one
  ""
    Plugin 'terryma/vim-multiple-cursors'

  ""
  "" Syntastic
  ""    -> Multiple languages syntax checker (php, c++, scala, etc.)
  ""
    Plugin 'scrooloose/syntastic'
    let g:syntastic_cpp_compiler_options = '-std=c++0x'
    let g:syntastic_cpp_check_header = 1

  ""
  "" Bclose
  ""     -> Close current buffer (without messing up everything like bd)
  ""
    Plugin 'cespare/vim-bclose'
    map <D-0> <Plug>Kwbd
    nmap <leader>w <Plug>Kwbd

  ""
  "" JSON
  ""    -> JSON syntax
  ""
    Plugin 'vim-scripts/JSON.vim'
    augroup filetypedetect
      au! BufRead,BufNewFile *.json set filetype=json
    augroup END

  ""
  "" Markdown
  ""    -> Markdown file support (.md)
  ""
    Plugin 'tpope/vim-markdown'

  ""
  "" Command Caps
  ""    -> Allow to take into account common shift typo like :Wq instead
  ""       of :wq because shift is held for too long
  ""
    Plugin 'takac/vim-commandcaps'

  ""
  "" Rename
  ""   -> Rename current file, keeping it in same directory
  ""      -> Rename[!] <newname>
  ""
    Plugin 'vim-scripts/Rename2'


  "" Rust
  Plugin 'rust-lang/rust.vim'

  ""
  "" DelimitMat
  ""   -> Magically closes parenthesis, brackets, etc.
  ""
    Plugin 'Raimondi/delimitMate'

  ""
  "" Required for Vundle to complete
  ""
  call vundle#end()            " required
  filetype plugin indent on    " required


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Local overrides

  if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
  endif

