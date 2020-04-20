function wiki
    set -l comm index
    set -l editor nvim

    if set -q NVIM_LISTEN_ADDRESS
        set editor nvr -cc split
    end

    if test (count $argv) -gt 0
        set comm $argv[1]
    end

    switch $comm
        case diary d
            eval "$editor" +VimwikiDiaryIndex
        case today t
            eval "$editor" +VimwikiMakeDiaryNote
        case yesterday y
            eval "$editor" +VimwikiMakeYesterdayDiaryNote
        case tomorrow a
            eval "$editor" +VimwikiMakeTomorrowDiaryNote
        case '' index i
            eval "$editor" +VimwikiIndex
    end
end
