" Vim syntax file for Trac (https://trac.edgewall.org/) wiki
" Language: Trac wiki
" Maintainer: Takuya Yamaguchi (https://github.com/yamat47)
" URL: https://github.com/yamat47/trac-vim-plugin

if exists('b:current_syntax')
  unlet b:current_syntax
endif

runtime! syntax/html.vim

syn case match

syn region htmlH1   start="^=\s.*"      end="$" contains=headerId,@tracInlineItem,@Spell
syn region htmlH2   start="^==\s.*"     end="$" contains=headerId,@tracInlineItem,@Spell
syn region htmlH3   start="^===\s.*"    end="$" contains=headerId,@tracInlineItem,@Spell
syn region htmlH4   start="^====\s.*"   end="$" contains=headerId,@tracInlineItem,@Spell
syn region htmlH5   start="^=====\s.*"  end="$" contains=headerId,@tracInlineItem,@Spell
syn region htmlH6   start="^======\s.*" end="$" contains=headerId,@tracInlineItem,@Spell
syn region headerId start="\s#"         end="$" contained

syn region tracListItem matchGroup=tracListItemIdentifier start="\%([-*]\|\%(\d\+\|\l\)\.\)\ze\s\+" end="$" contained contains=@tracInlineItem transparent
syn region tracListItemLine start="^\s*\%([-*]\|\%(\d\+\|\l\)\.\)\s\+" end="$" oneline contains=tracListItem

syn match tracDefinitionListTerm "^\s\%(!:\|[^:]\)\+::\ze\%(!:\|[^:]\)*$" contains=tracDefinitionListTermIdentifier
syn match tracDefinitionListTermIdentifier "::\ze\%(!:\|[^:]\)*$" contained

syn region tracBlockquote start="^\s*>" end="$" contains=tracListItem,@tracInlineItem

syn region tracCodeBlock matchGroup=tracCodeBlockIdentifier start="^\s*{{{\(#!\a\+\)\?\s*$" end="^\s*}}}\s*$"
syn region tracComment start="^\s*{{{#!comment\s*$" end="^\s*}}}\s*$" contains=tracUrl

syn region tracItalic     matchGroup=tracTextIdentifier start="'\{2}"       end="'\{2}"       oneline contains=tracEscape
syn region tracItalic     matchGroup=tracTextIdentifier start="/\{2}"       end="/\{2}"       oneline contains=tracEscape
syn region tracBold       matchGroup=tracTextIdentifier start="'\{3}"       end="'\{3}"       oneline contains=tracEscape
syn region tracBold       matchGroup=tracTextIdentifier start="\*\{2}"      end="\*\{2}"      oneline contains=tracEscape
syn region tracBoldItalic matchGroup=tracTextIdentifier start="'\{5}"       end="'\{5}"       oneline contains=tracEscape
syn region tracBoldItalic matchGroup=tracTextIdentifier start="\*\{2}'\{2}" end="\*\{2}'\{2}" oneline contains=tracEscape
syn region tracUnderline  matchGroup=tracTextIdentifier start="_\{2}"       end="_\{2}"       oneline contains=tracEscape
syn region tracStrike     matchGroup=tracTextIdentifier start="\~\{2}"      end="\~\{2}"      oneline contains=tracEscape
syn region tracSuper      matchGroup=tracTextIdentifier start="\^"          end="\^"          oneline contains=tracEscape
syn region tracSub        matchGroup=tracTextIdentifier start=",\{2}"       end=",\{2}"       oneline contains=tracEscape
syn region tracInlineCode matchGroup=tracTextIdentifier start="{\{3}"       end="}\{3}"       oneline
syn region tracInlineCode matchGroup=tracTextIdentifier start="`"           end="`"           oneline

syn region tracTableRow start="^\s*|\{2}" end="|\{2}\s*\\\?$" oneline contains=tracTableRowNotStartNewRowIdentifier,tracTableCellIdentifier
syn match tracTableRowNotStartNewRowIdentifier "\\$" contained
syn match tracTableCellIdentifier "=\?|\{2}=\?" contained

syn region tracLink start="\[\{1}" end="\]\{1}"
syn region tracLink start="\[\{2}" end="\]\{2}"
syn match  tracLink "\<\(wiki:\)\?\([A-Z][a-z]\+\)\{2,}\>\([#/]\<\([A-Z][a-z]\+\)\{2,}\>\)*"
syn match  tracLink "#\d\+"
syn match  tracLink "{\d\+}"
syn match  tracLink "\<r\d\+"
syn match  tracLink "\<r\d\+:\d\+"
syn match  tracLink "\[\d\+:\d\+\(/[^]]\+\)*\]"
syn match  tracLink `\<\([A-Za-z]\+:\)\?\(wiki\|source\|attachment\|milestone\|diff\|log\|report\|changeset\|comment\|ticket\):\(".\+"\|'.\+'\|\(\S\+\)\+\)`
syn match  tracUrl  "\<\%(\%(\%(https\=\|file\|ftp\|gopher\)://\|\%(mailto\|news\):\)[^[:space:]'\"<>]\+\|www[[:alnum:]_-]*\.[[:alnum:]_-]\+\.[^[:space:]'\"<>]\+\)[[:alnum:]/]"

syn region tracAnchor start="\[\(=\)\?#\(\h\|-\)\+" end="\]"

syn region tracMacro start="\[\{2}" end="\]\{2}"

syn match tracRule "^-\{4,}$"

syn match tracLineBreak "\[\[BR\]\]"
syn match tracLineBreak "\\"

syn match  tracEscape "![^ ]\+\( \|$\)"
syn match  tracEscape "\s*\^\{2}\%([-*]\|\d\+\)"
syn region tracEscape start="!\[" end="\]\%(\]\)\@!"

syn cluster tracInlineItem contains=tracItalic,tracBold,tracBoldItalic,tracUnderline,tracStrike,tracSuper,tracSub,tracInlineCode,tracLink,tracEscape

hi def link headerId Delimiter
hi def link tracListItemIdentifier Identifier
hi def link tracDefinitionListTerm htmlBold
hi def link tracDefinitionListTermIdentifier Identifier
hi def link tracBlockquote Comment
hi def link tracCodeBlockIdentifier Identifier
hi def link tracComment Comment
hi def link tracItalic htmlItalic
hi def link tracBold htmlBold
hi def link tracBoldItalic htmlBoldItalic
hi def link tracUnderline htmlUnderlineItalic
hi def link tracStrike htmlItalic
hi def link tracSuper htmlItalic
hi def link tracSub htmlItalic
hi def link tracInlineCode htmlItalic
hi def link tracTextIdentifier Identifier
hi def link tracTableRowNotStartNewRowIdentifier Identifier
hi def link tracTableCellIdentifier Identifier
hi def link tracLink htmlLink
hi def link tracUrl htmlLink
hi def link tracAnchor Delimiter
hi def link tracMacro PreProc
hi def link tracRule PreProc
hi def link tracLineBreak PreProc
hi def link tracEscape Special

let b:current_syntax = "trac"

