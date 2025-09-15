#!/bin/bash
#set -x

#---------CONFIG-----------#
banditNumber="10"
banditPassword="FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey"

#---------MAIN------------#
sshCommand() {
	sshpass -p$banditPassword ssh -q -n bandit${banditNumber}@bandit.labs.overthewire.org -p 2220 $1
}

bandit=$(sshCommand "cat data.txt | base64 -d | awk '{print $NF}'")

echo $bandit | awk '{print $NF}'