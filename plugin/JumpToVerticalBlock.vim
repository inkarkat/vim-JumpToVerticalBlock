" JumpToVerticalBlock.vim: Like W / E, but vertically in the same column.
"
" DEPENDENCIES:
"   - CountJump/Region/Motion.vim autoload script
"
" Copyright: (C) 2016-2017 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"	002	23-Jul-2017	Simplified implementation with the CountJump.vim
"				1.90 support for argumentless a:Expr that
"				returns the region pattern.
"	001	09-Jun-2016	file creation

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_JumpToVerticalBlock') || (v:version < 700)
    finish
endif
let g:loaded_JumpToVerticalBlock = 1
let s:save_cpo = &cpo
set cpo&vim

"- configuration ---------------------------------------------------------------

if ! exists('g:JumpToVerticalBlock_ToBeginMapping')
    let g:JumpToVerticalBlock_ToBeginMapping = 'w'
endif
if ! exists('g:JumpToVerticalBlock_ToEndMapping')
    let g:JumpToVerticalBlock_ToEndMapping = 'W'
endif



"- functions -------------------------------------------------------------------

function! JumpToVerticalBlock#Expr()
    return '\%' . virtcol('.') . 'v\S'
endfunction


"- mappings --------------------------------------------------------------------

call CountJump#Region#Motion#MakeBracketMotion('',
\   g:JumpToVerticalBlock_ToBeginMapping, g:JumpToVerticalBlock_ToEndMapping,
\   function('JumpToVerticalBlock#Expr'),
\   1
\)

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
