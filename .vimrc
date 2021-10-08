set encoding=utf-8
let $GTAGSCONF = '/home/eijpnae/Software/bin/share/gtags/gtags.conf'
let $VIMRUNTIME="/home/eijpnae/SoftWare/vim/runtime"
set runtimepath=~/SoftWare/vim/runtime
set nocompatible              " be iMproved, required
set backspace=indent,eol,start
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'preservim/nerdtree'
Plugin 'Valloric/YouCompleteMe'
" bundle 'SHowTrailingWhitespace'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" " Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" " Plugin 'ascenator/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required

" plug pack 
call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'
Plug 'tpope/vim-unimpaired'
"Plug 'mileszs/ack.vim'
call plug#end()
filetype plugin indent on    " required

"function! MyAutoScroll()
"        let s:SusLines=winheight(winnr()) * 0.4 
"        if winheight(winnr())-winline()>=s:SusLines
"                return
"        else
"                let thisline=winline()
"                let inbetween=winheight(winnr())-thisline
"                while inbetween <= s:SusLines
"                        exec "normal! \<c-e>"
"                        let inbetween=inbetween+1
"                endwhile
"        endif                                                                                                    
"endfunction
"
"autocmd! CursorMoved,CursorMovedI * call MyAutoScroll()
autocmd VimEnter * NERDTree | wincmd p


let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1
let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
let g:Lf_ShortcutF = "<C-p>"
let g:Lf_PreviewInPopup = 1
"let g:gutentags_define_advanced_commands = 1


" YCM config
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax=0 
let g:ycm_cache_omnifunc=0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_complete_in_comments=1
"let g:ycm_error_symbol = '✗'
"let g:ycm_min_num_of_chars_for_completion=1 
"let g:ycm_warning_symbol = '⚠'
"set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"inoremappumvisible() ? "\" : "\" "Enter to select the current item
"nnoremap <F5> :YcmForceCompileAndDiagnostics "display the error and warning
"nnoremap <F3> :YcmCompleter GoToDefinitionElseDeclaration "GoToDefinitionElseDeclaration 
" YCM config end


"set completeopt=longest,menu
"inoremap <expr> <CR> pumvisible() ? "<C-y>" : "<CR>" 
"nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|
"let g:ycm_seed_identifiers_with_syntax=1
"let g:ycm_show_diagnostics_ui = 1
" search word under cursor, the pattern is treated as regex, and enter normal
" mode directly

" " search word under cursor, the pattern is treated as regex,
" " append the result to previous search results.
" noremap <C-G> :<C-U><C-R>=printf("Leaderf! rg --append -e %s ",expand("<cword>"))<CR>
"
" " search word under cursor literally only in current buffer
noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg -F --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -F --current-buffer -e %s",expand(""))<CR>


"Gtags configure
let $GTAGSLABEL = 'native'
let $GTAGSCONF = '/home/eijpnae/SoftWare/global-6.6.7/gtags.conf'
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>


let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
"
" " search word under cursor literally in all listed buffers
"noremap <C-D> :<C-U><C-R>=printf("Leaderf! rg -F --all-buffers -e %s ",expand("<cword>"))<CR>
"
" " search visually selected text literally, don't quit LeaderF after
" accepting an entry
" xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F --stayOpen -e %s ",
" leaderf#Rg#visual())<CR>
"
" " recall last search. If the result window is closed, reopen it.
" noremap go :<C-U>Leaderf! rg --recall<CR>
"
"
" " search word under cursor in *.h and *.cpp files.
"noremap <Leader>c :<C-U><C-R>=printf("Leaderf! rg -e %s -g *.h -g *.cc",expand("<cword>"))<CR>
noremap <Leader>w :<C-U><C-R>=printf("Leaderf! rg %s",expand("<cword>"))<CR>
noremap <Leader>f :<C-U><C-R>=printf("Leaderf! rg %s",expand(""))<CR>
" " the same as above
" noremap <Leader>a :<C-U><C-R>=printf("Leaderf! rg -e %s -g *.{h,cpp}",
" expand("<cword>"))<CR>
"
" " search word under cursor in cpp and java files.
noremap <Leader>b :<C-U><C-R>=printf("Leaderf! rg -e %s -t cpp -t java -t c",expand("<cword>"))<CR>
"
" " search word under cursor in cpp files, exclude the *.hpp files
" noremap <Leader>c :<C-U><C-R>=printf("Leaderf! rg -e %s -t cpp -g !*.hpp",
" expand("<cword>"))<CR>
"ack.vim --- {{{
  
" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search
"case sensitively otherwise
"let g:ackprg = '/home/eijpnae/SoftWare/ripgrep/target/release/rg --vimgrep --type-not sql --smart-case'
   
" Auto close the Quickfix list after pressing '<enter>' on a list item
"let g:ack_autoclose = 1
    
" Any empty ack search will search for the work the cursor is on
"let g:ack_use_cword_for_empty_search = 1
     
" Don't jump to first match
"cnoreabbrev Ack Ack!
      
" Maps <leader>/ so we're ready to type the search keyword
"nnoremap <Leader>/ :Ack!<Space>
" }}}


"gtags configuration 

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


syntax on
set showmode
"set tags=./.tags;,.tags
set hlsearch
set wildmenu
set incsearch
set number
set ff=unix
set autoread 
set tabstop=4
set expandtab
set ruler
"keymap
map <C-A> ggvG$ 
"noremap <C-f> :set hlsearch<CR>/

nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <C-n> :LeaderfFunction!<CR>
"nnoremap <C--> <C-o>

noremap <S-f> :set hlsearch<CR>?
noremap <F6> :cn<CR>
noremap <F7> :cp<CR>
noremap <F8> :ccl<CR>
noremap <C-d> yyp
noremap <C-l> dd
noremap <C-w> :w!<CR>
noremap <C-a> <Home>
noremap <C-e> <End>
"noremap <C-c> yy
"noremap <C-v> p
noremap <C-g> :
nnoremap <C-S-z> u      
"nnoremap <C-p> :e ++ff=unix<CR>      
nnoremap <F9> :nohl<CR>
"nnoremap <C-h> :<C-U><C-R>=printf("g/%s/s// /g",expand("<cword>"))<CR>
nnoremap <C-x> :qa!<CR>
inoremap <C-a> <Home>
inoremap <C-e> <End>
imap <C-d> <ESC>:w!<CR>i
imap <C-z> <ESC>ui
imap <C-x> <ESC>:wq!<CR>

"gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
 let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
"
" " 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
"
" " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
 let s:vim_tags = expand('~/.cache/tags')
 let g:gutentags_cache_dir = s:vim_tags
"
" " 配置 ctags 的参数
 let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
 let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
 let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
"
" " 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif
