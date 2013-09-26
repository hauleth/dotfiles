Dotfiles
========

It is repository of my config files, created as backup in case of UFO/armaggedon
or (which is less propably) loosing my data.

You can feel free to use it for yourself, and even contributte if you want. Just
suggest something in [issues](https://github.com/hauleth/dotfiles/issues) or
create pull request (no link because if you need it, I rather won't accept your
pull request).

Requirements
------------

There are some requirements to use my confs:

- Vim (or gVim/mVim):
    * [Exuberant Ctags][ctags] (for Taglist)
    * [Inconsolata-dz for Powerline][inc-dz] or any other Powerline font (there
      is also possibility to use any other font, explonation coming soon)

- [rbenv][rbenv]

Optional:

- [Conky][conky] - geeky system monitor, only for Linux users
- [Pry][pry] - better replacement for IRb

Instalation
-----------

Instalation easy (but easier way will come in future):

1. Clone whole repo

        $ git clone https://github.com/hauleth/dotfiles.git && cd dotfiles

2. Pull all submodules

        $ git submodule init && git submodule update

3. Symlink needed files (call this inside repo)

        $ for conf in *; do ln -s $(pwd)/$conf ~/.$conf || echo "Cannot symling '$conf'. Propably already exist."; done

4. That's all. Be happy with your brand new confs brought to you by [@Hauleth][t]


[t]: http://twitter.com/hauleth
[inc-dz]: https://github.com/Lokaltog/powerline-fonts
[ctags]: http://ctags.sourceforge.net/
[rbenv]: http://rbenv.org/
[conky]: http://conky.sourceforge.net/
[pry]: http://pryrepl.org/
