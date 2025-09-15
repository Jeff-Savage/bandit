#!/bin/bash
#set -x

#---------CONFIG-----------#
banditNumber="8"
banditPassword="dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc"

#---------MAIN------------#
sshCommand() {
	sshpass -p$banditPassword ssh -q -n bandit${banditNumber}@bandit.labs.overthewire.org -p 2220 $1
}

bandit=$(sshCommand "cat data.txt | sort | uniq -u")

echo $bandit | awk '{print $NF}'