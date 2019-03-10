set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'lervag/vimtex'
  nnoremap <Leader>b <Esc>:w<CR>:VimtexCompileSS<CR>:VimtexErrors<CR>
  let g:vimtex_view_method = 'skim'
Plugin 'vim-syntastic/syntastic'
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*


  "let g:syntastic_mode_map = {
    "\ "mode": "active",
    "\ "passive_filetypes": ["tex"] }
  let g:syntastic_ignore_files = [ "\m*..tex$" ]
  let g:syntastic_enable_balloons = 0
  let g:syntastic_latex_checkers = [ 'errors-only' ]

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 0

  augroup mySyntastic
    au FileType sml let g:syntastic_always_populate_loc_list = 1
    au FileType sml let g:syntastic_auto_loc_list = 1
  augroup END

Plugin 'jez/vim-better-sml'
  au FileType sml setlocal conceallevel=2

Plugin 'jez/vim-superman'

Plugin 'scrooloose/nerdcommenter'
  let @c = 'yypk\ccj' " comment current line and add new copy
Plugin 'itchyny/lightline.vim'
Plugin 'ajh17/vimcompletesme'
Plugin 'mk12/vim-lean'
Plugin 'sheerun/vim-polyglot'
  let g:polyglot_disabled = ['latex']

Plugin 'vim-python/python-syntax'
Plugin 'tpope/vim-surround'

Plugin 'joshdick/onedark.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'mbbill/undotree'
  nnoremap <Leader>u :UndotreeToggle<CR>

call vundle#end()

"colorscheme onedark

set laststatus=2
let g:airline_powerline_fonts = 0
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='onedark'


let g:lean_auto_replace = 1

"colorscheme onedark
set background=dark
colorscheme onedark
let g:palenight_terminal_italics=1
if (has("termguicolors"))
  set termguicolors
endif


