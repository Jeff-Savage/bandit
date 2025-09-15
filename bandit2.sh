#!/bin/bash
#set -x

#---------CONFIG-----------#
banditNumber="2"
banditPassword="263JGJPfgU6LtdEvgfWU1XP5yac29mFx"

#---------MAIN------------#
sshCommand() {
	sshpass -p$banditPassword ssh -q -n bandit${banditNumber}@bandit.labs.overthewire.org -p 2220 $1
}

bandit=$(sshCommand "cat ./\"--spaces in this filename--\"")

echo $bandit