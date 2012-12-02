function fish_prompt --description 'Write out the prompt'
    set branch_line (git branch ^/dev/null -vv | grep '^*')

    printf '\n'
    if [ ! -z $branch_line ];
        set LOCAL (echo $branch_line | awk '{print $2}')
        set REMOTE (echo $branch_line | grep -o '\[.*\]' | sed 's:\(\[\|\]\)::g' | cut -f 1 -d ':')
        set BRANCH_DIFFERENCES (echo $branch_line | grep -o '\[.*\]' | sed 's:\(\[\|\]\)::g' | cut -f 2 -d ':')

        set local_branch (set_color yellow)$LOCAL(set_color normal)
        set local_branch_commit (set_color normal)'('(set_color yellow)(git log $LOCAL --oneline -n 1 | awk '{print $1}')(set_color normal)')'(set_color normal)
        set branch_differences (set_color red)$BRANCH_DIFFERENCES(set_color normal)
        set remote_branch (set_color green)$REMOTE(set_color normal)
        set remote_branch_commit (set_color normal)'('(set_color yellow)(git log $REMOTE --oneline -n 1 | awk '{print $1}')(set_color normal)')'(set_color normal)

        printf '%s%s' $local_branch $local_branch_commit
        if [ $BRANCH_DIFFERENCES != $REMOTE ];
            printf '%s' $branch_differences
        end
        printf ' %s%s\n' $remote_branch $remote_branch_commit
    end

    set whoami (set_color red)(whoami)(set_color normal)
    set hostname (set_color green)(hostname | cut -f 1 -d .)(set_color normal)
    set pwd (set_color cyan)(pwd | sed "s:$HOME:~:g")(set_color normal)
    printf '%s@%s %s > ' $whoami $hostname $pwd
end
