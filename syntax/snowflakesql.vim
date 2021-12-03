" Vim syntax file
" Language:	SQL, SnowflakeSQL
" Maintainer:	Daniel Arndt
" Repository:
" License:      Vim

if exists("b:current_syntax")
  finish
endif

syn case ignore

" The SQL reserved words, defined as keywords.

syn keyword sqlSpecial	false null true

syn keyword sqlKeyword	access add as asc begin by case check cluster column
syn keyword sqlKeyword	cache compress connect current cursor decimal default desc
syn keyword sqlKeyword	else elsif end exception exclusive file for from
syn keyword sqlKeyword	function group having identified if immediate increment
syn keyword sqlKeyword	index initial initrans into is level link logging loop
syn keyword sqlKeyword	maxextents maxtrans mode modify monitoring
syn keyword sqlKeyword	nocache nocompress nologging noparallel nowait of offline on online start
syn keyword sqlKeyword	parallel successful synonym table tablespace then to trigger uid
syn keyword sqlKeyword	unique user validate values view when whenever
syn keyword sqlKeyword	where with option order pctfree pctused privileges procedure
syn keyword sqlKeyword	public resource return row rowlabel rownum rows
syn keyword sqlKeyword	session share size smallint type using
syn keyword sqlKeyword	join cross inner outer left right

syn keyword sqlOperator	not and or
syn keyword sqlOperator	in any some all between exists
syn keyword sqlOperator	like escape
syn keyword sqlOperator	union intersect minus
syn keyword sqlOperator	prior distinct
syn keyword sqlOperator	sysdate out

syn keyword sqlStatement analyze audit comment commit
syn keyword sqlStatement delete drop execute explain grant lock noaudit
syn keyword sqlStatement rename revoke rollback savepoint set
syn keyword sqlStatement truncate
" next ones are contained, so folding works.
syn keyword sqlStatement create update alter select insert contained

syn keyword sqlType	bfile blob boolean char character clob date datetime
syn keyword sqlType	dec decimal float int integer long mlslabel nchar
syn keyword sqlType	nclob number numeric nvarchar2 precision raw rowid
syn keyword sqlType	smallint real timestamp urowid varchar varchar2 varray

" Strings:
syn region sqlString	matchgroup=Quote start=+n\?"+     end=+"+
syn region sqlString	matchgroup=Quote start=+n\?'+     end=+'+
syn region sqlString	matchgroup=Quote start=+n\?q'\z([^[(<{]\)+    end=+\z1'+
syn region sqlString	matchgroup=Quote start=+n\?q'<+   end=+>'+
syn region sqlString	matchgroup=Quote start=+n\?q'{+   end=+}'+
syn region sqlString	matchgroup=Quote start=+n\?q'(+   end=+)'+
syn region sqlString	matchgroup=Quote start=+n\?q'\[+  end=+]'+

" Numbers:
syn match sqlNumber	"-\=\<\d*\.\=[0-9_]\>"

" Comments:
syn region sqlComment	start="/\*"  end="\*/" contains=sqlTodo,@Spell fold 
syn match sqlComment	"--.*$" contains=sqlTodo,@Spell
syn match sqlComment "^rem.*$" contains=sqlTodo,@Spell

" Setup Folding:
" this is a hack, to get certain statements folded.
" the keywords create/update/alter/select/insert need to
" have contained option.
syn region sqlFold start='^\s*\zs\c\(Create\|Update\|Alter\|Select\|Insert\)' end=';$\|^$' transparent fold contains=ALL

syn sync ccomment sqlComment

" Functions:
" Other:
syn keyword sqlFunction	to_timestamp regexp_substr split iff
" Todo:
syn keyword sqlTodo TODO FIXME XXX DEBUG NOTE contained

" Define the default highlighting.
hi def link Quote		Special
hi def link sqlComment		Comment
hi def link sqlFunction		Function
hi def link sqlKeyword		sqlSpecial
hi def link sqlNumber		Number
hi def link sqlOperator		sqlStatement
hi def link sqlSpecial		Special
hi def link sqlStatement	Statement
hi def link sqlString		String
hi def link sqlType		Type
hi def link sqlTodo		Todo

let b:current_syntax = "sql"
" vim: ts=8
