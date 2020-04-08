"基本設定
"一旦ファイルタイプをoffにする
filetype off
"ctagsでタグジャンプを可能にする
set tags=~/.tags
".swpファイルを生成しない
set noswapfile
"下部のメッセージ表示欄を２業確保
set cmdheight=2
"ステータス行を常に表示
set laststatus=2
"statuslineに表示させる項目の決定
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=
set statusline+=%{fugitive#statusline()}[POS=%04l,%04v][%p%%][%L]
highlight statusline   term=NONE cterm=NONE guifg=red ctermfg=yellow ctermbg=red
":のあとで補完的になる
set wildmenu
"vimエディタで開いているファイルと同じディレクトリを初期ディレクトリとして設定する。
set browsedir=buffer
"検索の時に大文字小文字を無視
set ignorecase
"検索結果をハイライトして表示
set hlsearch
"タブを半角スペースで入力する
"set expandtab
"インクリメンタルサーチで検索する
set incsearch
":bコマンドでbufferを切り替える時に編集中ファイルを保存しなくても良くなる
set hidden
"不可視文字を表示
set list
"不可視文字の表示方法
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
	hi SpecialKey ctermbg=7
"行数を表示
set number
"対応するカッコを表示
set showmatch
"改行時に前の行のインデントを継続する
set autoindent
"改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
"タブの幅を指定
set tabstop=2
"自動インデントでずれる幅
set shiftwidth=2
"マウス操作をオンにする
set mouse=a
"ビープ音をなくす
set visualbell t_vb=
"行を強調表示
set cursorline
"列を強調表示
set cursorcolumn
"エンコード指定
set encoding=utf-8
set fileencodings=utf-8,sjis,euc-jp
"フォーマットに依存する改行コードの自動判定
set fileformats=unix,dos,mac
"ビジュアルモードで選択したテキストがクリップボードに入るようにする。
set clipboard=unnamed,autoselect,unnamedplus
"ファイルごとにオプションを設定できるようにする（モードライン）
set modeline
"バックスペースでインデントや行を削除可能にする。
set backspace=indent,eol,start
"補完の設定
set completeopt=menuone
"自動で補完する
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
endfor
"文字に色をつける
syntax on
"カラースキームを設定する
colorscheme molokai
set t_Co=256
"行数を黄色にする
highlight LineNr ctermfg=yellow

""キーマッピング
let b:match_words = "if:endif"
let loaded_matchparen = 1
"<Leader>を<Space>にあてる
let mapleader ='\<Space>'
noremap j gj
noremap k gk
noremap <s-h>   ^
noremap <s-j>   }
noremap <s-k>   {
noremap <s-l>   $
noremap m  %
noremap gb gT
nnoremap * *N
nnoremap <ESC><ESC> :nohlsearch<CR>
inoremap <C-f> <C-x><C-o>
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy
nnoremap ：wq :wq
nnoremap ：q :q
nnoremap 'w :w
nnoremap 'q :q
nnoremap 'wq :wq
nnoremap q: <Nop>
nnoremap Q <Nop>
"vimでカーソル位置の単語とヤンクした文字列を置換する
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> cy   ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy   c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
map      g<SPACE>  G
nnoremap <M-SPACE> i<SPACE><ESC><Right>
vnoremap < <gv
vnoremap > >gv
" open ctag in tab/vertical split
map <C-\> *:tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <leader><C-\> *:vsp <CR>:exec("tag ".expand("<cword>"))<CR>
	" }}}1
" その他
"
source ~/.vim/external/autocmd.vim
source ~/.vim/external/space.vim
source ~/.vim/external/imput_col.vim
source ~/.vim/external/undo.vim
source ~/.vim/indent/javascript.vim
let g:SimpleJsIndenter_BriefMode = 4
let g:yaasita_slack_token = "xoxp-13369810642-17178395011-96388157825-aa8a61603b92ef88147bdd011c4886f9"
let g:syntastic_javascript_checkers = ['eslint']
let g:previm_open_cmd = 'google-chrome'

filetype on
