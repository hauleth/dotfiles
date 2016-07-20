compiler cargo

setlocal formatprg=rustfmt\ --write-mode=display
let g:rustfmt_autosave = 1

let g:neomake_rust_cargo_maker = {
      \ 'append_file': 0,
      \ 'args': ['check'],
      \ 'errorformat':
      \   '%-G%f:%s:,' .
      \   '%f:%l:%c: %trror: %m,' .
      \   '%f:%l:%c: %tarning: %m,' .
      \   '%f:%l:%c: %m,'.
      \   '%f:%l: %trror: %m,'.
      \   '%f:%l: %tarning: %m,'.
      \   '%f:%l: %m',
      \ }

let g:neomake_rust_rustc_maker = {
      \ 'args': ['-Z', 'parse-only'],
      \ 'errorformat':
      \   '%-G%f:%s:,' .
      \   '%f:%l:%c: %trror: %m,' .
      \   '%f:%l:%c: %tarning: %m,' .
      \   '%f:%l:%c: %m,'.
      \   '%f:%l: %trror: %m,'.
      \   '%f:%l: %tarning: %m,'.
      \   '%f:%l: %m',
      \ }

inoreabbrev excr extern crate

ClearSwapList

SwapList float f32 f64
SwapList integers i8 i16 i32 i64
SwapList unsigned u8 u16 u32 u64
SwapList ref_mut & &mut
SwapList string str String
SwapList result Ok Err
SwapList option Some None
SwapList assert assert assert_eq
SwapList print print println
SwapList write write writeln
SwapList module mod use
