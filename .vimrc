set title           "타이틀바에 현재 편집중인 파일 표시
set titleold=""
set titlestring=VIM:\ %F

set nu              "라인번호 표시
set term=xterm-color

set mouse-=a         "마우스사용안함. 터미널에서 복사하는데 방해됨
"set mouse=a         "마우스사용(커서변경, 블록지정 등)
"
set nobackup        "백업파일안만듦
set bs=indent,eol,start "backspace키 줄처음에 위치한 경우 상위줄과 합침

syntax on

if !has("gui_running") 
	set t_Co=256 
endif 

" feel free to choose :set background=light for a different style 
"set background=dark
set background=light

set showcmd         "부분적인 명령어 상태라인 보이기
"set showmatch       "매치되는 괄호 반대쪽보이기

set ignorecase      "찾기시 대/소문자구분안함
set hlsearch        "찾는 단어 하이라이트
set incsearch       "점진적 찾기
set smartindent     "좀더 똑똑한 들여쓰기를 위한 옵션이다.

"set textwidth=79   "만약 79번째 글자를 넘어가면
"set wrap           "자동으로 를 삽입하여 다음 줄로 넘어간다.
"set nowrap         "자동 줄바꿈 안함

set ruler           "화면 우측 하단에 현재 커서의 위치를 보여준다.
set noexpandtab     "noexpandtab : <Tab> -> <Tab>, exapndtab : <Tab> -> <Space><Space><Space><Space>

set sc              "완성중인 명령을 표시
set ru              "커서위치 항상 보이기
set nuw=5           "줄번호표시 너비 설정

"set ts=4            "탭크기 설정
"set sw=4
set tabstop=4       "Tab을 눌렀을 때 8칸 대신 4칸 이동하도록 한다.
set shiftwidth=4    "자동 들여쓰기를 할때 4칸 들여쓰도록 한다.

set noet 
set sts=0

set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

nmap <silent> <F2> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

"NERDTree
Bundle 'The-NERD-tree'
let NERDTreeWinPos = "left"
nmap <F9> :NERDTreeToggle<CR>

"Bundle 'AutoComplPop'

"C/C++ omni-completion with ctags database
Bundle 'OmniCppComplete'

"Python Omni Completion 
Bundle 'pythoncomplete'

Bundle 'neocomplcache'
let g:neocomplcache_enable_at_startup=1

Bundle 'matchparenpp'

Bundle 'tComment'
Bundle 'snipMate'
Bundle 'SnipMgr'
"Bundle 'Syntastic'
Bundle 'ctrlp.vim'
"Bundle 'Powerline'
Bundle 'fugitive.vim'
Bundle 'hgrev'

"for Gundo [Undo History Tree Viewer]
Bundle 'Gundo'
nnoremap <F5> :GundoToggle<CR>

let g:gundo_right = 1
let g:gundo_width = 45 
let g:gundo_preview_height = 40

Bundle 'Tagbar'
nmap <F8> :TagbarToggle<CR>

"Bundle 'vcscommand.vim'

"source explorer
"Bundle 'Source-Explorer-srcexpl.vim'

"for python
Bundle 'pyflakes'

"You don't need any ctags for it to work! Only clang is needed
"Use of Clang for completing C, C++, Objective-C and Objective-C++
Bundle 'clang-complete'

"Zoom In/Out"
" - Usage: C-w o(owl)
Bundle 'ZoomWin'

filetype plugin indent on
"filetype on

"colorscheme evening
colorscheme desert
"colorscheme zenburn 
"let g:zenburn_force_dark_Background=1
"colorscheme vibrantink

"http://www.vim.org/scripts/script.php?script_id=1464
"colorscheme moria
"let moria_style = 'white' 
"let moria_monochrome = 1

"colorscheme werks
"colorscheme wombat
"colorscheme solarized

"colorscheme molokai
"let g:molokai_original=1

"colorscheme pyte

"colorscheme peaksea

"colorscheme inkpot

"colorscheme desert256

"colorscheme wombat256
"colorscheme wombat256mod

"colorscheme twilight


if has("autocmd") 
"	autocmd FileType python setlocal complete+=~/.vim/dict/pydiction-1.2.1/pydiction iskeyword+=.,( 
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
endif "has("autocmd") 

"add tags files
"set tags+=/Applications/cocos2d-x-2.1.5/scripting/javascript/bindings/js/tags
"set tags+=/Users/jeongchangyong/Downloads/lighttpd-1.4.32/src/tags

function! ResetTitle()
    " disable vim's ability to set the title
    exec "set title t_ts='' t_fs=''"

    " and restore it to 'bash'
    exec ":!echo -e '\033kbash\033\\'\<CR>"
endfunction

au VimLeave * silent call ResetTitle()
