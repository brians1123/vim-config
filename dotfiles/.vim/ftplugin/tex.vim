setlocal conceallevel=2
compiler latexmk

" don't automatically open qf list since log file is used instead
let g:qf_auto_open_quickfix = 0

function! RedrawScreen(channel)
    redraw!
endfunction

function! ForwardSearch()
  let current_line = line('.')
  let pdf_name = expand('%:t:r') . '.pdf'
  let command = ['/Applications/Skim.app/Contents/SharedSupport/displayline',
                   \ '-b', '-g', current_line, pdf_name]
  let job = job_start(command, {'close_cb': 'RedrawScreen'})
endfunction

nnoremap <buffer> <Leader>f :silent call ForwardSearch()<CR>
nnoremap <buffer> <Leader>e :cfile %:t:r.log <bar> copen<CR>

" should switch to proper autocmd
if (expand('%') =~# '.*\.xtx')
  setlocal makeprg=latexmk\ -pdf\ -pv\ --xelatex\ %
endif

" jump sections
noremap <script> <buffer> <silent> ]]
        \ :call search('\\section', '')<CR>
noremap <script> <buffer> <silent> [[
        \ :call search('\\section', 'b')<CR>
xnoremap <script> <buffer> <silent> ]]
        \ :<c-u>call search('\\section', '')<CR>
xnoremap <script> <buffer> <silent> [[
        \ :<c-u>call search('\\section', 'b')<CR>

" environment text objects
xnoremap <script> <buffer> <silent> ie
      \ :<c-u>call search('\\begin', 'b') <bar> normal vV%koj<CR>
onoremap <script> <buffer> <silent> ie
      \ :<c-u>call search('\\begin', 'b') <bar> normal vV%koj<CR>
xnoremap <script> <buffer> <silent> ae
      \ :<c-u>call search('\\begin', 'b') <bar> normal vV%<CR>
onoremap <script> <buffer> <silent> ae
      \ :<c-u>call search('\\begin', 'b') <bar> normal vV%<CR>

" change surrouning environment
function! s:ChangeSurroundingEnvironment()
  call inputsave()
  let name = input('')
  call inputrestore()
  execute '.,/end{' . expand('<cword>') . '/s/{' . expand('<cword>') . '}/{' . name . '}'
endfunction

nnoremap <script> <buffer> <silent> cse
  \ ?\\begin{?e<CR>l:call <SID>ChangeSurroundingEnvironment()<CR>:nohlsearch<CR>2<c-o>
