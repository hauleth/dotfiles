#!/usr/bin/env fish

set PLUGINS fasd hub rbenv thefuck gi rust

function wa_get_package
  for search in $argv
    if test -e $WAHOO_PATH/db/pkg/$search
      set target pkg/$search
    else if test -e $WAHOO_PATH/db/themes/$search
      set target themes/$search
    else
      set -l pkg (basename $search)
      if test -e $WAHOO_PATH/pkg/$pkg
        echo (wa::err)"Error: $pkg already installed."(wa::off) 1^&2
      else
        echo (wa::dim)"Trying to clone from URL..."(wa::err)
        git clone --recursive -q $search $WAHOO_PATH/pkg/$pkg
          and echo (wa::em)"✔ $pkg succesfully installed."(wa::off)
          or echo (wa::err)"$pkg is not a valid package/theme."(wa::off) 1^&2
      end
      continue
    end

    if test -e $WAHOO_PATH/$target
      echo (wa::em)"Updating $search..."(wa::off)
      pushd $WAHOO_PATH/$target
      wa_util_sync "origin" >/dev/null ^&1
      popd
      echo (wa::em)"✔ $search up to date."(wa::off)
    else
      echo (wa::em)"Installing $search..."(wa::off)
      git clone (cat $WAHOO_PATH/db/$target) $WAHOO_PATH/$target >/dev/null ^&1
        and echo (wa::em)"✔ $search succesfully installed."(wa::off)
        or echo (wa::err)"Could not install package."(wa::off) 1^&2
    end
  end
end

wa_get_package $PLUGINS
