set -x LC_COLLATE "POSIX"
set -x CDPATH "."

if [ $TERM = 'rxvt-unicode-256color' ]
    set -x TERM rxvt
end

if [ $TERM = 'rxvt' ]
    set dircolors_file ~/.config/fish/DIR_COLORS.256
    if [ -e $dircolors_file ]
        eval (dircolors -c $dircolors_file)
    end
else
    set LS_COLORS ''
end

bind \ec 'kill-word'
