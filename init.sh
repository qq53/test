# File : init.sh
#  ------------------------------------
#   Create date: 2014-05-20 21:09
#   Modified date: 2014-05-20 21:16
#   Author: Sen1993
#   Email: 1730806439@qq.com
#  ------------------------------------
 
#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

mv ./.vimrc ~/
mv autoload/ /usr/share/vim/vim74/
mv doc/ /usr/share/vim/vim74/
mv plugin/ /usr/share/vim/vim74/

clear
echo "参考以下说明:"
cat README
echo ""
