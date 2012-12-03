set -x LC_COLLATE "POSIX"
set -x CDPATH "."

if [ $TERM == 'rxvt-unicode-256color' ];
    set -x TERM rxvt
end
