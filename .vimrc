"基本設定 {{{1
"一旦ファイルタイプをoffにする
filetype off
"ctagsでタグジャンプを可能にする
"set tags=~/.tags
".swpファイルを生成しない
set noswapfile
"下部のメッセージ表示欄を２業確保
set cmdheight=2
"ステータス行を常に表示
set laststatus=2
"statuslineに表示させる項目の決定
set statusline=%y\ %F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=%l,%c%V%4P
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
set expandtab
"インクリメンタルサーチで検索する
set incsearch
":bコマンドでbufferを切り替える時に編集中ファイルを保存しなくても良くなる
set hidden
"不可視文字を表示
set list
"不可視文字の表示方法
set listchars=tab:>-,trail:-,extends:<
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
set tabstop=4
"自動インデントでずれる幅
set shiftwidth=4
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
"バックスペースでインデントや行を削除可能にする。
set backspace=indent,eol,start
"補完のプレビューウィンドウを表示しない
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
" }}}1
""キーマッピング {{{1
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
nnoremap Q <Nop>
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
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> cy   ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy   c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
noremap <SPACE>   <PageDown>
nnoremap <S-SPACE> <PageUp>
map      g<SPACE>  G
nnoremap <M-SPACE> i<SPACE><ESC><Right>
vnoremap <SPACE>   <C-d>
vnoremap <S-SPACE> <C-u>
vnoremap < <gv
vnoremap > >gv
" }}}1
" for denite {{{1
packadd denite.nvim
nnoremap [denite] <Nop>
nmap <C-c> [denite]
if executable('rg')
  call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])
  call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
endif
nnoremap <silent> [denite]f :<C-u>DeniteBufferDir -direction=topleft -cursor-wrap=true file file:new<CR>
nnoremap <silent> [denite]g  :<C-u>Denite grep -buffer-name=search-buffer-denite<CR>
" }}}1
" for JavaScript {{{1
let g:syntastic_javascript_checkers = ['eslint']
" }}}1
" for SQL {{{1
function! s:config_sql()
  packadd Align
  packadd SQLUtilities
endfunction

augroup sql-plugins
  autocmd!
  autocmd FileType sql call s:config_sql()
augroup END
" }}}1
" その他 {{{1
"全角スペースを可視化
source ~/.vim/external/space.vim
"最後にいた場所に移動
source ~/.vim/external/autocmd.vim
if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile
endif
filetype on
let g:xml_syntax_folding = 1
set foldmethod=syntax
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
"settings for fodling in this file
" vim: foldcolumn=3
" vim: foldlevel=0
" vim: foldmethod=marker
" }}}1
