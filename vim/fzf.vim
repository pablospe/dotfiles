" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~30%' }

" View fzf buffers
nnoremap <Leader>b :Buffers<cr>

" fzf config
"nnoremap <C-p> :Files<cr>
"let g:fzf_action = {
"\ 'ctrl-t': 'tab split',
"\ 'ctrl-i': 'split',
"\ 'ctrl-s': 'vsplit' }
"let g:fzf_layout = { 'down': '~20%' }

"let g:rg_command = '
"\ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
"\ -g "*.{vim,viml,tsx,ts,js,jsx,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,graphql,gql,sql}"
"\ -g "!{.config,.git,node_modules,vendor,yarn.lock,*.sty,*.bst,build,dist}/*" '

"command! -bang -nargs=* F call fzf#vim#grep(g:rg_command . shellescape(<q-args>), 1, <bang>0)
"command! -bang -nargs=* FU call fzf#vim#grep(g:rg_command . '-m1 ' . shellescape(<q-args>), 1, <bang>0)



"call plug#begin('~/.vim/plugged')
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"call plug#end()


 "FZF
"function! s:buflist()
 "redir => ls
 "silent ls
 "redir END
 "return split(ls, '\n')
"endfunction

"function! s:bufopen(e)
 "execute 'buffer' matchstr(a:e, '^[ 0-9]*')
"endfunction

"nnoremap <silent> <Leader><Enter> :call fzf#run({
"\   'source':  reverse(<sid>buflist()),
"\   'sink':    function('<sid>bufopen'),
"\   'options': '+m',
"\   'down':    len(<sid>buflist()) + 2
"\ })<CR>

 "Open files in horizontal split
"nnoremap <silent> <Leader>s :call fzf#run({
"\   'down': '40%',
"\   'sink': 'botright split' })<CR>

 "Open files in vertical horizontal split
"nnoremap <silent> <Leader>v :call fzf#run({
"\   'right': winwidth('.') / 2,
"\   'sink':  'vertical botright split' })<CR>

"nnoremap <silent> <Leader>C :call fzf#run({
"\   'source':
"\     map(vsplit(globpath(&rtp, "colors/*.vim"), "\n"),
"\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
"\   'sink':    'colo',
"\   'options': '+m',
"\   'left':    30
"\ })<CR>


"
" FZF config
"
nnoremap <leader>e :call Fzf_dev()<CR>

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" Files + devicons
function! Fzf_dev()
  let l:fzf_files_options = '--preview "bat --theme="monokai" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
	\ 'source': <sid>files(),
	\ 'sink':   function('s:edit_file'),
	\ 'options': '-m ' . l:fzf_files_options,
	\ 'down':    '40%' })
endfunction


