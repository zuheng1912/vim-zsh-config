"""""""""""""""""""""""vim editor config"""""""""""""""""""""""
"set mouse=a
set nocompatible
filetype off
set nu
filetype on
syntax on
set cindent
set smartindent
set tabstop=4
set shiftwidth =4
set ai!
"colorscheme
set t_Co=256   " This is may or may not needed.
set background=dark
colorscheme onedark
"let mapleader=","

""""""""""""""""""""""" vundle"""""""""""""""""""""""
" 加入Vundle插件的路径
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' "这个必须要加
Plugin 'VundleVim/YouCompleteMe'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'frazrepo/vim-rainbow'
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""vim plug"""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" 要安装的插件写在两个call之间
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
"make theme colourful
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"code comment plug 
Plug 'preservim/nerdcommenter'
"recently opend file
Plug 'mhinz/vim-startify'
"auto tags
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
"color theme
Plug 'sainnhe/sonokai'
"color night-owl
Plug 'haishanh/night-owl.vim'
Plug 'sheerun/vim-polyglot'
"asyntask
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
"code analysis
Plug 'dense-analysis/ale'
"text objectt
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'
"Leaderf,search tags fucntion files 
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
"terminal help
Plug 'skywind3000/vim-terminal-help'
call plug#end()

""""""""""""""""""""asyncrun task config""""""""""""""""""""
let g:asyncrun_open = 6
"let g:asynctasks_term_pos = 'tab'
let g:asynctasks_term_pos = 'external'
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6
" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

""""""""""""""""""""gutentags config""""""""""""""""""""
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

""""""""""""""""""""rainbow bracket config""""""""""""""""""""
let g:rainbow_active = 0

""""""""""""""""""""c/cpp syntax improve""""""""""""""""""""
" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 1
" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1
" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1
" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

""""""""""""""""""""ale config""""""""""""""""""""
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

""""""""""""""""""""ycm comfig""""""""""""""""""""
" turn off hover info
let g:ycm_auto_hover = ''
" toggle hover info with F3
map <F3> <plug>(YCMHover)

""""""""""""""""""""leaderF config""""""""""""""""""""
let g:Lf_WorkingDirectoryMode = 'AF'
let g:Lf_RootMarkers = ['.git','.svn', '.hg', '.project', '.root']
"let g:Lf_WindowPosition = 'popup'
let g:Lf_ShortcutF = '<C-P>'


""""""""""""""""""""nerdtree  config""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
"let NERDTreeShowHidden=1
noremap <silent><tab>m :tabnew<cr>
noremap <silent><tab>e :tabclose<cr>
noremap <silent><tab>n :tabn<cr>
noremap <silent><tab>p :tabp<cr>
noremap <silent><leader>t :tabnew<cr>
noremap <silent><leader>g :tabclose<cr>
noremap <silent><leader>1 :tabn 1<cr>
noremap <silent><leader>2 :tabn 2<cr>
noremap <silent><leader>3 :tabn 3<cr>
noremap <silent><leader>4 :tabn 4<cr>
noremap <silent><leader>5 :tabn 5<cr>
noremap <silent><leader>6 :tabn 6<cr>
noremap <silent><leader>7 :tabn 7<cr>
noremap <silent><leader>8 :tabn 8<cr>
noremap <silent><leader>9 :tabn 9<cr>
noremap <silent><leader>0 :tabn 10<cr>
noremap <silent><s-tab> :tabnext<CR>
inoremap <silent><s-tab> <ESC>:tabnext<CR>

"""""""""""""""""gutentags_plus config"""""""""""""""""""""""
let g:gutentags_plus_switch = 1
let g:gutentags_plus_nomap = 1
"key map for gutentags_plus
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
noremap <silent> <leader>gz :GscopeFind z <C-R><C-W><cr>

""""""""""""""""""""map key""""""""""""""""""""
noremap <silent><C-S> :w<cr>
noremap <silent><leader>f :Leaderf function<cr>
noremap <silent><leader>t :Leaderf tag<cr>
noremap <silent><f6> :AsyncTask project-run<cr>
noremap <silent><f7> :AsyncTask project-build<cr>
noremap <silent><f5> :AsyncTask project-auto<cr>
noremap <silent><C-Q> :wq<cr>
noremap <silent><f1> yiw<cr>
noremap <silent><f2> viwp<cr>

