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
 set shiftwidth=4
 set tabstop=4
 
 "------------------------------------------------------------
 " Mappings {{{1
 " マッピング
 
 " Yの動作をDやCと同じにする
 map Y y$
 
 " <C-L>で検索後の強調表示を解除する
 nnoremap <C-L> :nohl<CR><C-L>
 
 
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
