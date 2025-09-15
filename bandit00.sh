#!/bin/bash
#set -x

#---------CONFIG-----------#
banditNumber="0"
banditPassword="bandit0"

#---------MAIN------------#
sshCommand() {
	sshpass -p$banditPassword ssh -q -n bandit${banditNumber}@bandit.labs.overthewire.org -p 2220 $1
}

bandit=$(sshCommand "cat ./readme")

echo $bandit | grep "The password you are looking for is: " | awk '{print $NF}'