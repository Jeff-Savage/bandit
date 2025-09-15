#!/bin/bash
#set -x

#---------CONFIG-----------#
banditNumber="9"
banditPassword="4CKMh1JI91bUIZZPXDqGanal4xvAg0JM"

#---------MAIN------------#
sshCommand() {
	sshpass -p$banditPassword ssh -q -n bandit${banditNumber}@bandit.labs.overthewire.org -p 2220 $1
}

bandit=$(sshCommand "cat data.txt | strings | grep ==")

echo $bandit | awk '{print $NF}'