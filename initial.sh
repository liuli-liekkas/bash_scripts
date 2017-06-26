#!/bin
if [ $1 == 'help' ];	echo "./ial.sh file parameter "	exit 1
fi
echo "#!/bin/bash" >> $1
chmod a+x $1
vim +2 $1 
