" Vim syntax file for Trac (https://trac.edgewall.org/) wiki
" Language: Trac wiki
" Maintainer: Takuya Yamaguchi (https://github.com/yamat47)
" URL: https://github.com/yamat47/trac-vim-plugin

if !exists('g:main_syntax')
  if v:version < 600
    syntax clear
  elseif exists('b:current_syntax')
    finish
  endif
  let g:main_syntax = 'trac'
endif

syn region tracH1 matchgroup=tracHeading start="^\s*=\s" end="$"

highlight default link Statement

let b:current_syntax = 'trac'
