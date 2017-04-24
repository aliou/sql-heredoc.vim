" sql-heredoc.vim - Syntax files for SQL heredocs.
" Version: v0.2.0

" Store current syntax.
let s:previous_syntax = b:current_syntax

" TODO(ad): Refactor this, this is basically the same line repeated six times.
" wtf @past_aliou.

" Store the SQL syntax so it can be included below.
unlet b:current_syntax
syntax include @SQL syntax/sql.vim

syntax region rubyHereDocSQL matchgroup=Statement start=+<<\z(SQL\)+ end=+^\z1$+ contains=@SQL,rubyInterpolation
syntax region rubyHereDocDashSQL matchgroup=Statement start=+<<-\z(SQL\)+ end=+\s\+\z1$+ contains=@SQL,rubyInterpolation

" Since Ruby 2.3
syntax region rubyHereDocTildeSQL matchgroup=Statement start=+<<\~\z(SQL\)+ end=+\s\+\z1$+ contains=@SQL,rubyInterpolation

" Often seen in the ActiveRecord source.
syntax region rubyHereDocUnderscoreSQL matchgroup=Statement start=+<<_\z(SQL\)+ end=+\s\+\z1$+ contains=@SQL,rubyInterpolation

" Sometime used for Redshift SQL queries.
syntax region rubyHereDocRSSQL matchgroup=Statement start=+<<\z(RSSQL\)+ end=+^\z1$+ contains=@SQL,rubyInterpolation
syntax region rubyHereDocDashRSSQL matchgroup=Statement start=+<<-\z(RSSQL\)+ end=+\s\+\z1$+ contains=@SQL,rubyInterpolation

let b:current_syntax = s:previous_syntax
