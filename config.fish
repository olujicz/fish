set -x LC_COLLATE "POSIX"
set -x CDPATH "."

if [ $TERM != 'linux'; or $TERM != 'xterm-256color' ]
    set dircolors_file ~/.config/fish/DIR_COLORS.256
    if [ -e $dircolors_file ]
        eval (dircolors -c $dircolors_file)
    end
end

if [ $TERM == 'rxvt-unicode-256color' ]
    set -x TERM rxvt
end

