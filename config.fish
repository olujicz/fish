function fish_prompt
    printf '%s%s%s@%s%s %s%s%s > ' (set_color red) (whoami) (set_color normal) (set_color green) (hostname | cut -f 1 -d .) (set_color cyan) (pwd) (set_color normal)
end
