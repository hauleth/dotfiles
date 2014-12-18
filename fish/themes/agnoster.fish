set SEGMENT_SEPARATOR ''
set SEGMENT_BG
set RSTATUS

set SEGMENT_LSEPARATOR ''

function prompt_segment --desc 'Create prompt segment'
  set -l bg $argv[1]
  set -l fg $argv[2]
  [ (count $argv) -gt 2 ]; and set -l content $argv[3..-1]

  set_color -b $bg

  if begin; [ -n "$SEGMENT_BG" ]; and [ "$SEGMENT_BG" != "$bg" ]; end
    color_echo $SEGMENT_BG $SEGMENT_SEPARATOR
  end

  if [ -n "$content" ]
    set SEGMENT_BG $bg
    set_color -b $bg $fg
    echo -n " $content"
  end
end

function color_echo
  set_color $argv[1]
  echo -n $argv[2]
end

function prompt_context
  set -l user (whoami)
  set -l host (hostname)

  if begin; [ "$user" != "$DEFAULT_USER" ]; or [ -n "$SSH_CLIENT" ]; end
    prompt_segment black normal "$user@$host "
  end
end

function parse_git_dirty
  set -l submodule_syntax
  set submodule_syntax "--ignore-submodules=dirty"
  set git_dirty (command git status -s $submodule_syntax  2> /dev/null)
  if [ -n "$git_dirty" ]
    echo -n "±"
  else
    echo -n ""
  end
end

# Status:
# - was there an error
# - am I root
# - are there background jobs?
function prompt_status
  set -l icons
  if [ "$RSTATUS" -ne 0 ]
    set icons $icons (set_color red -b black; echo -n "✘ ")
  end
  if [ (id -u $USER) -eq 0 ]
    set icons $icons (set_color red -b black; echo -n "⚡ ")
  end
  if [ (jobs -l | wc -l) -ne 0 ]
    set icons $icons (set_color red -b black; echo -n "⚙ ")
  end

  prompt_segment black normal "$icons"
end

function prompt_git -d "Display the actual git state"
  set -l ref
  set -l dirty
  if command git rev-parse --is-inside-work-tree >/dev/null ^&1
    set dirty (parse_git_dirty)
    set ref (command git symbolic-ref HEAD ^/dev/null)
    if [ $status -gt 0 ]
      set -l branch (command git show-ref --head -s --abbrev |head -n1 ^/dev/null)
      set ref "➦ $branch "
    end
    set branch_symbol \uE0A0
    set -l branch (echo $ref | sed  "s-refs/heads/-$branch_symbol -")
    if [ "$dirty" != "" ]
      prompt_segment yellow black "$branch$dirty "
    else
      prompt_segment green black "$branch$dirty "
    end
  end
end

# Dir: current working directory
function prompt_dir
  set -l dir (prompt_pwd)
  prompt_segment blue black "$dir "
end

function prompt_finish
  prompt_segment normal normal
  echo -n ' '
  set SEGMENT_BG
end

function fish_prompt
  set RSTATUS $status
  prompt_status
  prompt_context
  prompt_dir
  prompt_git
  prompt_finish
end

function fish_right_prompt
  if [ -n "$fish_bind_mode" ]
    switch "$fish_bind_mode"
    case default
      set color white
    case insert
      set color yellow
    case visual
      set color magenta
    case '*'
      set color black
    end

    set_color normal
    color_echo "$color" "$SEGMENT_LSEPARATOR"
    set_color -b $color
    color_echo black " $fish_bind_mode "
    set_color normal
  end
end
