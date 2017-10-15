compiler cargo

setlocal iskeyword+=!
setlocal formatprg=rustfmt\ --write-mode=display
let g:rustfmt_autosave = 1
let g:racer_experimental_completer = 1

inoreabbrev excr extern crate

nnoremap <buffer> K     <Plug>(rust-doc)
nnoremap <buffer> <C-]> <Plug>(rust-def)

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
