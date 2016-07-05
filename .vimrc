"------------------------------------------------------------
" Plugin

if has('vim_starting')
    set rtp+=~/.vim/plugged/vim-plug
    if !isdirectory(expand('~/.vim/plugged/vim-plug'))
        echo 'install vim-plug...'
        call system('mkdir -p ~/.vim/plugged/vim-plug')
        call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
    end
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}

Plug 'itchyny/lightline.vim'

Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'

Plug 'scrooloose/nerdtree'

Plug 'w0ng/vim-hybrid'
Plug 'vim-scripts/phd'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-scripts/twilight'

call plug#end()

"------------------------------------------------------------
" Plugin

"------------------------------------------------------------
" for bdre
"set encoding=sjis
"set fileencodings=sjis,euc-jp,utf-8

 "------------------------------------------------------------
 " Features {{{1
 "
 " Vi互換モードをオフ（Vimの拡張機能を有効）
 set nocompatible
 
 " ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有効にする
 filetype indent plugin on
 
 " Enable syntax highlighting
 " 色づけをオン
 syntax on

 set background=dark
 "colorscheme jellybeans
 colorscheme hybrid

 "------------------------------------------------------------
 " Must have options {{{1
 " 強く推奨するオプション
 
 " バッファを保存しなくても他のバッファを表示できるようにする
 set hidden
 
 " コマンドライン補完を便利に
 set wildmenu
 
 " タイプ途中のコマンドを画面最下行に表示
 set showcmd
 
 " 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
 set hlsearch
 
 " script, <http://www.vim.org/scripts/script.php?script_id=1876>.
 " 歴史的にモードラインはセキュリティ上の脆弱性になっていたので、
 " オフにして代わりに上記のsecuremodelinesスクリプトを使うとよい。
 " set nomodeline
 
 "------------------------------------------------------------
 " Usability options {{{1
 
 " 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
 " 混在しているときは区別する
 set ignorecase
 set smartcase
 
 " オートインデント、改行、インサートモード開始直後にバックスペースキーで
 " 削除できるようにする。
 set backspace=indent,eol,start
 
 " オートインデント
 set autoindent
 
 " 移動コマンドを使ったとき、行頭に移動しない
 set nostartofline
 
 " 画面最下行にルーラーを表示する
 set ruler
 
 " ステータスラインを常に表示する
 set laststatus=2
 set t_Co=256
 if $TERM == 'screen'
     set t_Co=256
 endif
 
 " バッファが変更されているとき、コマンドをエラーにするのでなく、保存する
 " かどうか確認を求める
 set confirm
 
 " ビープの代わりにビジュアルベル（画面フラッシュ）を使う
 set visualbell
 
 " そしてビジュアルベルも無効化する
 set t_vb=
 
 " 全モードでマウスを有効化
" set mouse=a
 
 " コマンドラインの高さを2行に
 set cmdheight=2
 
 " 行番号を表示
 set number
 
 " キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
 set notimeout ttimeout ttimeoutlen=200
 
 " <F11>キーで'paste'と'nopaste'を切り替える
 set pastetoggle=<F11>
 
 "------------------------------------------------------------
 " Indentation options {{{1
 " インデント関連のオプション {{{1

 " タブ文字の代わりにスペース2個を使う場合の設定。
 " この場合、'tabstop'はデフォルトの8から変えない。
 "set shiftwidth=2
 "set softtabstop=2
 "set expandtab
 
 " インデントにハードタブを使う場合の設定。
 " タブ文字を2文字分の幅で表示する。
 "set shiftwidth=4
 "set tabstop=4
 
 "------------------------------------------------------------
 " Mappings {{{1
 " マッピング
 
 " Yの動作をDやCと同じにする
 map Y y$
 
 " <C-L>で検索後の強調表示を解除する
 nnoremap <C-L> :nohl<CR><C-L>
 " ESC2回で検索ハイライト消す
 nmap <Esc><Esc> :nohlsearch<CR><Esc>
 " カッコの自動補完
 
 "------------------------------------------------------------
 " My Setting
 
 set title
 " 画面表示設定
 set cursorline     " カーソル行の背景色を変える
 "set cursorcolumn   " カーソル位置のカラムの背景色を変える
 set showmatch      " 対応する括弧を強調表示
 set helpheight=999 " ヘルプを画面いっぱいに開く
 set list           " 不可視文字を表示
 " 不可視文字の表示記号指定
 set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮

 " カーソル移動関連の設定
 set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
 set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
 set scrolloff=8                " 上下8行の視界を確保
 set sidescrolloff=16           " 左右スクロール時の視界を確保
 set sidescroll=1               " 左右スクロールは一文字づつ行う

 " ファイル処理関連の設定
 set autoread   "外部でファイルに変更がされた場合は読みなおす
 set nobackup   " ファイル保存時にバックアップファイルを作らない
 set noswapfile " ファイル編集中にスワップファイルを作らない

 " 検索/置換の設定
 set incsearch  " インクリメンタルサーチを行う
 set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
" set gdefault   " 置換の時 g オプションをデフォルトで有効にする

 " タブ/インデントの設定
 set expandtab     " タブ入力を複数の空白入力に置き換える
 set tabstop=4     " 画面上でタブ文字が占める幅
 set shiftwidth=4  " 自動インデントでずれる幅
 set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
 set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

 " インサートモードから抜けると自動的にIMEをオフにする
 set iminsert=0
 
 " ステータス行に現在のgitブランチを表示する
 set statusline=%{fugitive#statusline()})}
 
 " キーマップ
 imap { {}<left>
 imap [ []<left>
 imap ( ()<left>

 inoremap <C-e> <Esc>$a
 inoremap <C-a> <Esc>^i
 noremap <C-e> <Esc>$
 noremap <C-a> <Esc>^

 
 "------------------------------------------------------------
 " 日本語設定
 if &encoding !=# 'utf-8'
   set encoding=japan
   set fileencoding=japan
 endif
 if has('iconv')
   let s:enc_euc = 'euc-jp'
   let s:enc_jis = 'iso-2022-jp'
   if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
     let s:enc_euc = 'eucjp-ms'
     let s:enc_jis = 'iso-2022-jp-3'
   elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
     let s:enc_euc = 'euc-jisx0213'
     let s:enc_jis = 'iso-2022-jp-3'
   endif
   if &encoding ==# 'utf-8'
     let s:fileencodings_default = &fileencodings
     if has('mac')
       let &fileencodings = s:enc_jis .','. s:enc_euc
       let &fileencodings = &fileencodings .','. s:fileencodings_default
     else
       let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
       let &fileencodings = &fileencodings .','. s:fileencodings_default
     endif
     unlet s:fileencodings_default
   else
     let &fileencodings = &fileencodings .','. s:enc_jis
     set fileencodings+=utf-8,ucs-2le,ucs-2
     if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
       set fileencodings+=cp932
       set fileencodings-=euc-jp
       set fileencodings-=euc-jisx0213
       set fileencodings-=eucjp-ms
       let &encoding = s:enc_euc
       let &fileencoding = s:enc_euc
     else
       let &fileencodings = &fileencodings .','. s:enc_euc
     endif
   endif
   unlet s:enc_euc
   unlet s:enc_jis
 endif
 "------------------------------------------------------------
