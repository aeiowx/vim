"/**---------------------------------------
"* @file _vimrc
"* @brief  
"* @author alex_z
"* @version 1.1 
"* @date 2018-2-10
"----------------------------------------*/

behave mswin "windows behavior
" return OS type, eg: windows, or linux, mac, et.st..
function! MySys()
if has("win16") || has("win32") || has("win64") || has("win95")
return "windows"
elseif has("unix")
return "linux"
endif
endfunction

"
"vim vundle config 
"note: 
"1. Get Vundle: git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"2. Install plugin:PluginInstall
"=============================>>>
if MySys() == "windows"
set rtp+=$USERPROFILE/.vim/bundle/Vundle.vim
call vundle#begin('$USERPROFILE/.vim/bundle/') 
elseif MySys() == "linux"
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
endif

"Plugin 'gmarik/vundle'
Plugin 'VundleVim/Vundle.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'neoComplcache'
Plugin 'DoxygenToolkit.vim'
Plugin 'taglist.vim'
Plugin 'winmanager'
Plugin 'ctrlp.vim'
Plugin 'grep.vim'
Plugin 'a.vim'
Plugin 'ctags.vim'
Plugin 'matchit.zip'
Plugin 'Markdown'
"Plugin 'tagbar'

call vundle#end()
filetype plugin indent on
"<<<=============================

"common settings ====>>> 
set t_Co=256
let mapleader=","
set fileformats=unix,dos
"set backup "设置文件备份
set nocompatible " 关闭 vi 兼容模式
syntax on " 自动语法高亮
colorscheme jellybeans "设定配色方案 -jellybeans -monokai
set number " 显示行号
set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4 " 设定 tab 长度为 4
"设置空格替换tab"
"set ts=4
"set expandtab
"set autoindent
"set nobackup " 覆盖文件时不备份
set autochdir " 自动切换当前目录为当前文件所在的目录
"filetype plugin indent on " 开启插件
filetype plugin indent on 
"==============================
set backupcopy=yes " 设置备份时的行为为覆盖
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan " 禁止在搜索到文件两端时重新搜索
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
set showmatch " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=1 " 短暂跳转到匹配括号的时间
set magic " 设置魔术
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T " 隐藏工具栏
set guioptions-=m " 隐藏菜单栏
set smartindent " 开启新行时使用智能自动缩进
set backspace=indent,eol,start
" 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ " 设置在状态行显示的信息
"set foldenable " 开始折叠
"set foldmethod=syntax " 设置语法折叠
"set foldcolumn=0 " 设置折叠区域的宽度
"setlocal foldlevel=1 " 设置折叠层数为
"set foldclose=all " 设置为自动关闭折叠 
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>  " 用空格键来开关折叠
autocmd  FileType "txt"  set filetype=c
set incsearch "设置实时查找


" 用户目录变量$VIMFILES
if MySys() == "windows"
let $VIMFILES = $VIM.'/vimfiles'
elseif MySys() == "linux"
let $VIMFILES = $HOME.'/.vim'
endif
"
" 设定doc文档目录
let helptags=$VIMFILES.'/doc'
"
" 设置字体 以及中文支持
if has("win32") || has("win64")
"set guifont=Inconsolata:h16:cANSI
set guifont=Courier_new:h10
endif

" 配置多语言环境
if has("multi_byte")

" UTF-8 编码
"set FileExplorer=utf-8,gbk
set termencoding=utf-8
set formatoptions+=mM
"set encoding=gbk "显示用的编码方式
set encoding=utf-8"显示用的编码方式
set fenc=utf-8 "保存的文件的编码方式
set fencs=utf-8,gbk,gb2312,gb18030"文件解码列表
let g:fencview_autodetect=1

if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
set ambiwidth=double
endif

if has("win32") || has("win64")
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages en "zh_CN.utf-8
endif
else
echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" Buffers操作快捷方式!
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>

" Tab操作快捷方式!
nnoremap <C-TAB> :tabnext<CR>
nnoremap <C-S-TAB> :tabprev<CR>

"关于tab的快捷键
" map tn :tabnext<cr>
" map tp :tabprevious<cr>
" map td :tabnew .<cr>
" map te :tabedit
" map tc :tabclose<cr>


"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
"时候会变得非常方便.
nnoremap <C-h> <C-w>wh
nnoremap <C-j> <C-w>wj "切换窗口映射为C-j
nnoremap <C-k> <C-w>wk
nnoremap <C-l> <C-w>wl

"一些不错的映射转换语法（如果在一个文件中混合了不同语言时有用）
"nnoremap <leader>1 :set filetype=xhtml<CR>
"nnoremap <leader>2 :set filetype=css<CR>
"nnoremap <leader>3 :set filetype=javascript<CR>
"nnoremap <leader>4 :set filetype=php<CR>

" set fileformats=unix,dos,mac
" nmap <leader>fd :se fileformat=dos<CR>
" nmap <leader>fu :se fileformat=unix<CR>

" use Ctrl+[l|n|p|cc] to list|next|previous|jump to count the result
" map <C-x>l <ESC>:cl<CR>
" map <C-x>n <ESC>:cn<CR>
" map <C-x>p <ESC>:cp<CR>
" map <C-x>c <ESC>:cc<CR>

" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python map <F12> :!python %<CR>

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

" 打开javascript折叠
let b:javascript_fold=1
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1
" 设置字典 ~/.vim/dict/文件的路径
autocmd filetype javascript set dictionary=$VIMFILES/dict/javascript.dict
autocmd filetype css set dictionary=$VIMFILES/dict/css.dict
autocmd filetype php set dictionary=$VIMFILES/dict/php.dict
"<<<=============================================================

"plugin ==========================================================>>>
"-----------------------------------------------------------------
" plugin - ctags.vim 
"-----------------------------------------------------------------
set tags=tags; "自动定位tags文件"
set autochdir
filetype plugin indent on "new-omni-completion
set completeopt=longest,menu
 
"wmmanager  
let g:winManagerWindowLayout = "FileExplorer" "|TagList
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap wf :FirstExplorerWindow<cr>
nmap wb :BottomExplorerWindow<cr>
nmap wm :WMToggle<CR>  
"快速头文件、源文件切换  
nnoremap <silent> <F12> :A<CR>  
"显示新窗口
map <leader>v :vsplit 
"----------------------------------------------------------------- 
"" plugin - taglist.vim 查看函数列表，需要ctags程序
"
"----------------------------------------------------------------- 
if MySys() == "windows" " 设定windows系统中ctags程序的位置
let Tlist_Ctags_Cmd = '"'.$VIMRUNTIME.'/ctags.exe"'
elseif MySys() == "linux" " 设定linux系统中ctags程序的位置
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif
nnoremap <silent><F4> :TlistToggle<CR>
nnoremap tt :TlistToggle<CR>
let Tlist_Show_One_File = 1 " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1 " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 0 " 在右侧窗口中显示taglist窗口
let Tlist_File_Fold_Auto_Close=1 " 自动折叠当前非编辑文件的方法列表
let Tlist_Auto_Open = 1 
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Compact_Format = 1

"-----------------------------------------------------------------
" plugin - mark.vim 给各种tags标记不同的颜色，便于观看调式的插件。
" \m mark or unmark the word under (or before) the cursor
" \r manually input a regular expression. 用于搜索.
" \n clear this mark (i.e. the mark under the cursor), or clear all highlighted marks .
" \* 当前MarkWord的下一个 \# 当前MarkWord的上一个
" \/ 所有MarkWords的下一个 \? 所有MarkWords的上一个
"-----------------------------------------------------------------
"-----------------------------------------------------------------
" plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录
" :ERDtree 打开NERD_tree :NERDtreeClose 关闭NERD_tree
" o 打开关闭文件或者目录 t 在标签页中打开
" T 在后台标签页中打开 ! 执行此文件
" p 到上层目录 P 到根目录
" K 到第一个节点 J 到最后一个节点
" u 打开上层目录 m 显示文件系统菜单（添加、删除、移动操作）
" r 递归刷新当前目录 R 递归刷新当前根目录
"-----------------------------------------------------------------
" F3 NERDTree 切换
map <F1> :NERDTreeToggle<CR>
imap <F1> <ESC>:NERDTreeToggle<CR>
                map <C-F1> :NERDTreeFind<CR>
                let NERDTreeChDirMode=2  "选中root即设置为当前目录
                let NERDTreeQuitOnOpen=1 "打开文件时关闭树
                let NERDTreeShowBookmarks=1 "显示书签
                let NERDTreeMinimalUI=1 "不显示帮助面板
                let NERDTreeDirArrows=1 "目录箭头 1 显示箭头  0传统+-|号

"-----------------------------------------------------------------
" plugin - NERD_commenter.vim 注释代码用的，
" [count],cc 光标以下count行逐行添加注释(7,cc)
" [count],cu 光标以下count行逐行取消注释(7,cu)
" [count],cm 光标以下count行尝试添加块注释(7,cm)
" ,cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释。
" 注：count参数可选，无则默认为选中行或当前行
"-----------------------------------------------------------------
let NERDSpaceDelims=1 " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1 " 多行注释时样子更好看

"-----------------------------------------------------------------
" plugin - DoxygenToolkit.vim 由注释生成文档，并且能够快速生成函数标准注释
"-----------------------------------------------------------------
let g:load_doxygen_syntax=1 "语法检查
"let g:doxygen_enhanced_color=1 "语法颜色增强，打开后字体很难看~
let g:DoxygenToolkit_briefTag_pre="@brief "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns "
let g:DoxygenToolkit_authorName="alex_z"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_versionString="1.0 "
let g:DoxygenToolkit_licenseTag="Copyright (C), 2013, eVideo.  All rights reserved." 
map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>
map <leader>db :DoxBlock<CR>
map <leader>dc a /** */<LEFT><LEFT><LEFT>
"单行注释
map <a-l> $a<TAB>///< 
map <a-m> $a<TAB>// 

"-----------------------------------------------------------------
" plugin – checksyntax.vim JavaScript常见语法错误检查
" 默认快捷方式为 F5
"-----------------------------------------------------------------
let g:checksyntax_auto = 0 " 不自动检查

"-----------------------------------------------------------------
" plugin - NeoComplCache.vim 自动补全插件
"-----------------------------------------------------------------
let g:neocomplcache_enable_at_startup = 1
"let g:AutoComplPop_NotEnableAtStartup = 1
let g:NeoComplCache_EnableAtStartup = 1
let g:NeoComplCache_SmartCase = 1
let g:NeoComplCache_TagsAutoUpdate = 1
let g:NeoComplCache_EnableInfo = 1
let g:NeoComplCache_EnableCamelCaseCompletion = 1
let g:NeoComplCache_MinSyntaxLength = 3
let g:NeoComplCache_EnableSkipCompletion = 1
let g:NeoComplCache_SkipInputTime = '0.5'
let g:NeoComplCache_SnippetsDir = $VIMFILES.'/snippets'
" <TAB> completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" snippets expand key
imap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)
smap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)

"-----------------------------------------------------------------
"grep.vim
"-----------------------------------------------------------------
:let Grep_Shell_Quote_Char = " "
"let tmptxt = split(filepattern)
"let txt = join(tmtxt) . ' '
nnoremap <leader>g :Grep -nsr <CR><CR><CR> 
"-----------------------------------------------------------------

"-----------------------------------------------------------------
" plugin - matchit.vim 对%命令进行扩展使得能在嵌套标签和语句之间跳转
" % 正向匹配 g% 反向匹配
" [% 定位块首 ]% 定位块尾
"-----------------------------------------------------------------

" plugin – a.vim
"-----------------------------------------------------------------
if has('gui_running') && has("win32")
    au GUIEnter * simalt ~x
endif

if has('gui_running') && has("win64")
    au GUIEnter * simalt ~x
endif
"super tab , 不好用容易影响到正常tab键的使用
"let g:SuperTabDefaultCompletionType="context"

"---------------------------
"set make prg
"---------------------------
"set makeprg=ndk-build
set makeprg=make

map <C-B> :call Do_make()<CR>
"函数名需要大写
function Do_make()
execute "silent make"
execute "copen"
endfunction

map <leader>cl :call Do_Make_clean()<CR>
function Do_Make_clean()
execute "silent make clean"
execute "copen"
endfunction

"插入日期
if has("win64") || has("win32")
	map <F5> :r!date /T<CR>1-ddi### <ESC><S-a>###<ESC>o
elseif has("unix")
	map <F5> :r!date<CR>o 
"	map <leader>da :i""Alex add -->"
endif

"------------------------------
"plugin - mark down
"------------------------------
let g:vim_markdown_folding_disabled=1
let mapleader = ","
nnoremap <leader>md :%!$vim/vimfiles/plugin/Markdown.pl --html4tags <CR>
"insert header
map mh   i### 
map mh1  i# 
map mh2  i## 
map mh3  i### 
map mh4  i#### 
map mh5  i##### 
"insert line
map ml o---<ESC>
"insert code block
map <leader>cb i```<CR>```<ESC>O

"------------------------------
"call source insight
"------------------------------
nnoremap <leader>ci :!start "C:\Program Files (x86)\Source Insight 3\Insight3.exe" -i +<C-R>=expand(line("."))<CR> %<CR>

"------------------------------
"cscope
"------------------------------
"set cscopequickfix=s-,c-,d-,i-,t-,e-
" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim... 
"if has("cscope")
if 0
    """"""""""""" Standard cscope/vim boilerplate
    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose  

    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif

"nmap <Leader>tb :TagbarToggle<CR>      "快捷键设置
"let g:tagbar_ctags_bin='ctags'          "ctags程序的路径
"let g:tagbar_width=30                   "窗口宽度的设置
"map <F3> :Tagbar<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()  "如果是c语言的程序的话，tagbar自动开启
"
"<<<=====================================================================
