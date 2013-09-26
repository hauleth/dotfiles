Dotfiles
========

It is repository of my config files, created as backup in case of UFO/armageddon
or (which is less probably) loosing my data.

You can feel free to use it for yourself, and even contribute if you want. Just
suggest something in [issues](https://github.com/hauleth/dotfiles/issues) or
create pull request (no link because if you need it, I rather won't accept your
pull request).

Vim plug-ins
------------

- [Ag][vim-ag] - based on Ack.vim, use [`ag`][ag] command
- [Airline][airline] - nicer status bar, Powerline replacement
- [Autoclose][autoclose] - automatically close brackets and quotes
- [BufExplorer][bufexplorer] - list and manage your buffers
- [BufferLine][bufferline] - list your buffers on status bar
- [CtrlP][ctrlp] - fuzzy file finder chooser
- [Emmet][emmet] - CSS selectors to HTML tags expander
- [Fugitive][fugitive] - the best Git tool ever!
- [Gundo][gundo] - show Vim change tree
- [Indent Guides][indent-guides] - show indentation level visually, sometimes
  useful (when dealing with tragic code)
- [LaTeX Box][latex-box] - helpers for LaTeX docs
- [Loremipsum][ipsum] - *Lorem ipsum* generator
- [Multiple Cursors][multiple-cursors] - Sublime Text style multiple selections
- [NERDCommenter][commenter] - fast comment lines or block of code
- [Netrw][netrw] - network oriented file browsing and editing
- [Numbers][numbers] - relative line numbering switcher
- [Rails][vim-rails] - some Rails specific commands
- [Ruby][vim-ruby] - as above, but for Ruby
- [SnipMate][snipmate] - TextMate-like snippets
- [Solarized][solarized] - awesome and beautiful color theme
- [SuperTab][supertab] - intelligent `<Tab>` key (indentation, completion and
  snippets)
- [Surround][surround] - quoting/parenthesizing made simple
- [Sytnastic][syntastic] - check syntax on save
- [Tabular][tabular] - fast and simple aligning/tableizeing text
- [Tagbar][tagbar] - list tags in file and allow fast jumping to them
- [TMux navigator][tmux-nav] - allow jumping between Vim windows and TMux panes
  using the same key combos

Support for additional languages:

- [CoffeeScript][coffee]
- [Fish][fish]
- [Puppet][puppet]
- [TypeScript][ts]

Requirements
------------

There are some requirements to use my confs:

- Vim (or gVim/mVim):
    * [Exuberant Ctags][ctags] (for Taglist)
    * [Inconsolata-dz for Powerline][pow-fonts] or any other Powerline font
      (there is also possibility to use any other font, explonation coming soon)
- [rbenv][rbenv]
- [The silver searcher][ag]

Optional:

- [Conky][conky] - geeky system monitor, only for Linux users
- [Pry][pry] - better replacement for IRb

Installation
------------

Installation easy (but easier way will come in future):

1. Clone whole repo

        $ git clone https://github.com/hauleth/dotfiles.git && cd dotfiles

2. Pull all submodules

        $ git submodule init && git submodule update

3. Symlink needed files (call this inside repo)

        $ for conf in *; do ln -s $(pwd)/$conf ~/.$conf || echo "Cannot symling '$conf'. Propably already exist."; done

4. That's all. Be happy with your brand new confs brought to you by [@Hauleth][t]

Copyrights
----------

Copyrights (c) 2013 [Łukasz Niemier][blog]

[t]: http://twitter.com/hauleth "Just follow me"
[blog]: http://lukasz.niemier.pl "Awesome Fantasy Rubist"

[pow-fonts]: https://github.com/Lokaltog/powerline-fonts "Some fonts with extras"
[ctags]: http://ctags.sourceforge.net/ "Exuberant Ctags"
[rbenv]: http://rbenv.org/ "Manage Ruby versions"
[conky]: http://conky.sourceforge.net/ "Conky - Linux system monitor"
[pry]: http://pryrepl.org/ "Great Ruby REPL"
[ag]: https://github.com/ggreer/the_silver_searcher "The Silver Searcher"

[airline]: https://github.com/bling/vim-airline
[autoclose]: https://github.com/Townk/vim-autoclose
[vim-ag]: https://github.com/vim-scripts/ag.vim
[bufexplorer]: https://github.com/vim-scripts/bufexplorer.zip
[bufferline]: https://github.com/bling/vim-bufferline
[ctrlp]: https://github.com/kien/ctrlp.vim
[emmet]: https://github.com/mattn/emmet-vim
[fugitive]: https://github.com/tpope/vim-fugitive
[gundo]: https://github.com/sjl/gundo.vim
[indent-guides]: https://github.com/nathanaelkane/vim-indent-guides
[latex-box]: https://github.com/LaTeX-Box-Team/LaTeX-Box
[ipsum]: https://github.com/vim-scripts/loremipsum
[multiple-cursors]: https://github.com/terryma/vim-multiple-cursors
[commenter]: https://github.com/scrooloose/nerdcommenter
[netrw]: https://github.com/vim-scripts/netrw.vim
[numbers]: https://github.com/mysuf3/numbers.vim
[vim-rails]: https://github.com/tpope/vim-rails
[vim-ruby]: https://github.com/vim-ruby/vim-ruby
[snipmate]: https://github.com/garbas/vim-snipmate
[solarized]: http://ethanschoonover.com/solarized
[supertab]: https://github.com/ervandew/supertab
[surround]: https://github.com/tpope/vim-surround
[syntastic]: https://github.com/scrooloose/syntastic
[tabular]: https://github.com/godlygeek/tabular
[tagbar]: https://github.com/majutsushi/tagbar
[tmux-nav]: https://github.com/christoomey/vim-tmux-navigator

[coffee]: http://coffeescript.org/
[fish]: http://fishshell.com/
[puppet]: http://puppetlabs.com/
[ts]: http://www.typescriptlang.org/
