#!/bin/sh

HOMEDIR='~'
SHATDIR="$HOMEDIR/.shattings"

function die() {
	echo $*
	exit 1
}

set -x

if [ -e $HOMEDIR/.bashrc ]
then
	{
		echo '# Uncomment to enable'
		echo '# '". \"$SHATDIR/bash/bashrc\""
	} >> "${HOMEDIR}/.bashrc"
	echo Added stub to existing $HOMEDIR/.bashrc
else
	{
		echo ". \"$SHATDIR/bash/bashrc\""
	} >> "${HOMEDIR}/.bashrc"
	echo Created $HOMEDIR/.bashrc
fi

if [ -e "${HOMEDIR}/.vimrc" ]
then
	{
		echo '" Uncomment to enable'
		echo '" '"source $SHATDIR/vim/vimrc"
	} >> "${HOMEDIR}/.vimrc"
	echo Added stub to existing $HOMEDIR/.vimrc
else
	{
		echo "source \"$SHATDIR/vim/vimrc\""
	} >> "${HOMEDIR}/.vimrc"
	echo Created $HOMEDIR/.vimrc
fi

if [ -e "${HOMEDIR}/.screenrc" ]
then
	{
		echo '# Uncomment to enable'
		echo '# '"source \"$SHATDIR/screen/screenrc\""
	} >> "${HOMEDIR}"/.screenrc
	echo Added stub to existing $HOMEDIR/.screenrc
else
	{
		echo "source \"$SHATDIR/screen/screenrc\""
	} >> "${HOMEDIR}"/.screenrc
	echo Created $HOMEDIR/.screenrc
fi


