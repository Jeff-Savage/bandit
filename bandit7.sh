#!/bin/bash
#set -x

#---------CONFIG-----------#
banditNumber="7"
banditPassword="morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj"

#---------MAIN------------#
sshCommand() {
	sshpass -p$banditPassword ssh -q -n bandit${banditNumber}@bandit.labs.overthewire.org -p 2220 $1
}

bandit=$(sshCommand "cat data.txt | grep millionth")

echo $bandit | awk '{print $NF}'