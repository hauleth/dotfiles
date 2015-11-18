Dotfiles
========

It is repository of my config files, created as backup in case of UFO/armageddon
or (which is less probably) loosing my data.

You can feel free to use it for yourself, and even contribute if you want. Just
suggest something in [issues](https://github.com/hauleth/dotfiles/issues) or
create pull request (no link because if you need it, I rather won't accept your
pull request).

Requirements
------------

- `fish`
- `make`
- `wget`
- `curl`

Installation
------------

Installation easy (but easier way will come in future):

1. Clone whole repo

        $ git clone https://github.com/hauleth/dotfiles.git && cd dotfiles

2. Run

        $ make nix fish
        $ wa u
        $ make -s

3. To install only some of the files use:

        $ make -s <targets>

Available targets
-----------------

* `bin`
  - Leiningen
  - `cargo cov` (requires `kcov` installed)
  - `cargon` (Cargo nightly, requires `multirust`)
  - `git cleanup`
  - `git imerge`
  - `tmux-airline`
* `conky`
* `fish`
  - Wahoo
  - some plugins
* `gdb`
  - GDB dashboard
* `git`
  - global `.gitignore`
  - NeoVim + Fugitive as mergetool
* `nvim`
  - vim-plug
  - bunch of plugins (check [`init.vim`](nvim/init.vim))
* `ruby`
  - `.gemrc` (skip doc installation)
  - `.pryrc`
* `tmux`
  - `tpm`
  - TMux Powerline-like theme
* `utils`
  - `ctags` with Rust config
  - `.dir_colors` for Solarized theme

Copyrights
----------

Copyrights (c) 2013 [Łukasz Niemier][blog]

[t]: http://twitter.com/hauleth "Just follow me"
[blog]: http://lukasz.niemier.pl "Awesome Fantasy Rubist"
