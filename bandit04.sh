#!/bin/bash
#set -x

#---------CONFIG-----------#
banditNumber="4"
banditPassword="2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ"

#---------MAIN------------#
sshCommand() {
	sshpass -p$banditPassword ssh -q -n bandit${banditNumber}@bandit.labs.overthewire.org -p 2220 $1
}

banditFile=$(sshCommand "find ./inhere -type f -exec sh -c 'file -b {} | grep -q text' \; -print")
bandit=$(sshCommand "cat $banditFile")

echo $bandit