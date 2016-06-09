" JumpToVerticalBlock.vim: Like W / E, but vertically in the same column.
"
" DEPENDENCIES:
"   - JumpToVerticalBlock.vim autoload script
"   - CountJump/Motion.vim autoload script
"
" Copyright: (C) 2016 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
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


"- mappings --------------------------------------------------------------------

if v:version < 702 | runtime autoload/JumpToVerticalBlock.vim | endif  " The Funcref doesn't trigger the autoload in older Vim versions.

call CountJump#Motion#MakeBracketMotionWithJumpFunctions(
\   '', g:JumpToVerticalBlock_ToBeginMapping, g:JumpToVerticalBlock_ToEndMapping,
\   function('JumpToVerticalBlock#BeginForward'),
\   function('JumpToVerticalBlock#BeginBackward'),
\   function('JumpToVerticalBlock#EndForward'),
\   function('JumpToVerticalBlock#EndBackward'),
\   0
\)

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
