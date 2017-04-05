" sql-heredoc.vim - Syntax files for SQL heredocs.
" Version: v0.1.0

" Store current syntax.
let s:previous_syntax = b:current_syntax

" Store the SQL syntax so it can be included below.
unlet b:current_syntax
syntax include @SQL syntax/sql.vim

syntax region rubyHereDocSQL matchgroup=Statement start=+<<\z(SQL\)+ end=+^\z1$+ contains=@SQL
syntax region rubyHereDocDashSQL matchgroup=Statement start=+<<-\z(SQL\)+ end=+\s\+\z1$+ contains=@SQL

" Since Ruby 2.3
syntax region rubyHereDocTildeSQL matchgroup=Statement start=+<<\~\z(SQL\)+ end=+\s\+\z1$+ contains=@SQL

" Often seen in the ActiveRecord source.
syntax region rubyHereDocUnderscoreSQL matchgroup=Statement start=+<<_\z(SQL\)+ end=+\s\+\z1$+ contains=@SQL

" Sometime used for Redshift SQL queries.
syntax region rubyHereDocRSSQL matchgroup=Statement start=+<<\z(RSSQL\)+ end=+^\z1$+ contains=@SQL
syntax region rubyHereDocDashRSSQL matchgroup=Statement start=+<<-\z(RSSQL\)+ end=+\s\+\z1$+ contains=@SQL

let b:current_syntax = s:previous_syntax
