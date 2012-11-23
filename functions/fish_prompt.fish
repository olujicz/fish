function fish_prompt --description 'Write out the prompt'
	if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    if not set -q __git_cb
        set -x tmp_branch (git name-rev ^/dev/null --name-only HEAD)
        if [ ! -z $tmp_branch ]
            set __git_cb (set_color brown) $tmp_branch (set_color normal)
        end
    end

    if not set -q __git_track
        if [ ! -z $tmp_branch ]
            set __git_track (set_color normal) ' tracking ' (set_color green) (git branch ^/dev/null -r | grep -- '->' | awk '{print $3}') (set_color normal)
        end
    end

    if not set -q __git_cc
        if [ ! -z $tmp_branch ]
            set __git_cc (set_color normal) '(' (set_color yellow) (git rev-parse ^/dev/null --short HEAD) (set_color normal) ')'
        end
    end

    if not set -q __fish_prompt_cwd
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end

    printf '\n'

    if [ ! -z $tmp_branch ]
        printf '%s%s%s' $__git_cb $__git_cc $__git_track
        printf '\n'
    end
    printf '%s%s%s@%s%s %s%s%s > ' (set_color red) (whoami) (set_color normal) (set_color green) (hostname | cut -f 1 -d .) (set_color cyan) (pwd | sed "s:$HOME:~:g") (set_color normal)
end
