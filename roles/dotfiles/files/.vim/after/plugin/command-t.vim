"
" Settings.
"

if &term =~# 'screen' || &term =~# 'tmux' || &term =~# 'xterm'
  let g:CommandTCancelMap=['<ESC>', '<C-c>']
  let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<Down>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<Up>', '<ESC>OA']
endif

let g:CommandTEncoding='UTF-8'
let g:CommandTFileScanner='watchman'
let g:CommandTInputDebounce=50
let g:CommandTMaxCachedDirectories=10
let g:CommandTMaxFiles=3000000
let g:CommandTScanDotDirectories=1
let g:CommandTTraverseSCM='pwd'
let g:CommandTWildIgnore=&wildignore
let g:CommandTWildIgnore.=',*/.git/*'
let g:CommandTWildIgnore.=',*/.hg/*'
let g:CommandTWildIgnore.=',*/bower_components/*'
let g:CommandTWildIgnore.=',*/tmp/*'
let g:CommandTWildIgnore.=',*.class'

" Allow Command-T to open selections in netrw windows.
let g:CommandTWindowFilter='!&buflisted && &buftype == "nofile" && !exists("w:netrw_liststyle")'

"
" Mappings.
"

nmap <unique> <Leader>c <Plug>(CommandTCommand)
nmap <unique> <Leader>h <Plug>(CommandTHelp)
nmap <unique> <LocalLeader>h <Plug>(CommandTHistory)
nmap <unique> <LocalLeader>l <Plug>(CommandTLine)
nmap <unique> <LocalLeader>t <Plug>(CommandTTag)

" Convenience for starting Command-T at launch without causing freak-out inside
" tmux.

function s:CommandTPreBoot()
  augroup CommandTBoot
    autocmd!
    autocmd VimEnter * call s:CommandTPostBoot()
  augroup END
endfunction

function s:CommandTPostBoot()
  augroup CommandTBoot
    autocmd!
  augroup END
  CommandT
endfunction

command CommandTBoot call s:CommandTPreBoot()
