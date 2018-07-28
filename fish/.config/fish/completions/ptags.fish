complete -c ptags -n "__fish_use_subcommand" -s t -l thread -d 'Number of threads'
complete -c ptags -n "__fish_use_subcommand" -s f -l file -d 'Output filename ( filename \'-\' means output to stdout )'
complete -c ptags -n "__fish_use_subcommand" -l bin-ctags -d 'Path to ctags binary'
complete -c ptags -n "__fish_use_subcommand" -l bin-git -d 'Path to git binary'
complete -c ptags -n "__fish_use_subcommand" -s c -l opt-ctags -d 'Options passed to ctags'
complete -c ptags -n "__fish_use_subcommand" -s g -l opt-git -d 'Options passed to git'
complete -c ptags -n "__fish_use_subcommand" -l opt-git-lfs -d 'Options passed to git-lfs'
complete -c ptags -n "__fish_use_subcommand" -s e -l exclude -d 'Glob pattern of exclude file ( ex. --exclude \'*.rs\' )'
complete -c ptags -n "__fish_use_subcommand" -l completion -d 'Generate shell completion file' -r -f -a "bash fish zsh powershell"
complete -c ptags -n "__fish_use_subcommand" -s s -l stat -d 'Show statistics'
complete -c ptags -n "__fish_use_subcommand" -s v -l verbose -d 'Verbose mode'
complete -c ptags -n "__fish_use_subcommand" -l exclude-lfs -d 'Exclude git-lfs tracked files'
complete -c ptags -n "__fish_use_subcommand" -l include-untracked -d 'Include untracked files'
complete -c ptags -n "__fish_use_subcommand" -l include-ignored -d 'Include ignored files'
complete -c ptags -n "__fish_use_subcommand" -l include-submodule -d 'Include submodule files'
complete -c ptags -n "__fish_use_subcommand" -l validate-utf8 -d 'Validate UTF8 sequence of tag file'
complete -c ptags -n "__fish_use_subcommand" -l unsorted -d 'Disable tags sort'
complete -c ptags -n "__fish_use_subcommand" -l config -d 'Generate configuration sample file'
complete -c ptags -n "__fish_use_subcommand" -s h -l help -d 'Prints help information'
complete -c ptags -n "__fish_use_subcommand" -s V -l version -d 'Prints version information'
