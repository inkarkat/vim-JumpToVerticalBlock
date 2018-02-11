" Test example movements.

function! Move( virtCol, motion )
    let l:originalPos = getpos('.')
    let l:cnt = 0
    call vimtap#Diag(printf('%s starts at %s', a:motion, l:originalPos[1:2]))
    while 1
	call vimtap#Is(ingo#text#GetCharVirtCol([line('.'), a:virtCol]), l:cnt, printf('%s arrived at position %d', a:motion, l:cnt))

	execute 'normal' a:motion
	let l:newPos = getpos('.')
	if l:newPos == l:originalPos
	    call vimtap#Diag(printf('%d positions for %s', l:cnt, a:motion))
	    break
	else
	    let l:originalPos = l:newPos
	endif

	call vimtap#Is(virtcol('.'), a:virtCol, 'kept same column')

	let l:cnt += 1
    endwhile
endfunction

edit example.txt
call vimtest#StartTap()

for [virtCol, motion] in [[1, ']w'], [6, '3]w'], [12, ']W'], [18, '[w'], [21, '[W']]
    call ingo#cursor#Set((motion =~# '[' ? line('$') - 2 : 3), virtCol)
    call Move(virtCol, motion)
endfor

call vimtest#Quit()
