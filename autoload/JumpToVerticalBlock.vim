" JumpToVerticalBlock.vim: Like W / E, but vertically in the same column.
"
" DEPENDENCIES:
"   - CountJump.vim autoload script
"   - CountJump/Region.vim autoload script
"
" Copyright: (C) 2016 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"	001	09-Jun-2016	file creation

function! s:GetExpr()
    return '\%' . virtcol('.') . 'v\S'
endfunction
function! s:Jump( mode, step, isAcrossRegion )
    call CountJump#JumpFunc(a:mode, 'CountJump#Region#JumpToNextRegion', s:GetExpr(), 1, a:step, a:isAcrossRegion, 0)
endfunction
function! JumpToVerticalBlock#BeginForward( mode )
    call s:Jump(a:mode, 1, 0)
endfunction
function! JumpToVerticalBlock#EndForward( mode )
    call s:Jump(a:mode, 1, 1)
endfunction
function! JumpToVerticalBlock#BeginBackward( mode )
    call s:Jump(a:mode, -1, 1)
endfunction
function! JumpToVerticalBlock#EndBackward( mode )
    call s:Jump(a:mode, -1, 0)
endfunction

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
