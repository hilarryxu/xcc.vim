function! xcc#terminal#open() abort
  call system('tmux split-window')
  call system('tmux last-pane')
endfunction

function! xcc#terminal#send(lines) abort
  if !exists('b:xcc_bound_terminal') || empty(b:xcc_bound_terminal)
    let b:xcc_bound_terminal = input('Tmux pane number: ')
  endif
  for line in a:lines
    call system('tmux -u send-keys -l -t ' . b:xcc_bound_terminal . ' "" ' . shellescape(line . "\r"))
  endfor
endfunction
