runtime! syntax/sql.vim
unlet b:current_syntax
syntax include @SQL syntax/sql.vim

syntax region rubyHereDocSQL matchgroup=Statement start=+<<\z(SQL\)+ end=+^\z1$+ contains=@SQL
syntax region rubyHereDocDashSQL matchgroup=Statement start=+<<-\z(SQL\)+ end=+\s\+\z1$+ contains=@SQL

" Since Ruby 2.3
syntax region rubyHereDocTildeSQL matchgroup=Statement start=+<<\~\z(SQL\)+ end=+\s\+\z1$+ contains=@SQL

" Often used seen in the ActiveRecord source.
syntax region rubyHereDocUnderscoreSQL matchgroup=Statement start=+<<_\z(SQL\)+ end=+\s\+\z1$+ contains=@SQL
