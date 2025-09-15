#!/bin/bash
#set -x

#---------CONFIG-----------#
banditNumber="11"
banditPassword="dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr"

#---------MAIN------------#
sshCommand() {
	sshpass -p$banditPassword ssh -q -n bandit${banditNumber}@bandit.labs.overthewire.org -p 2220 $1
}

bandit=$(sshCommand "cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'")

echo $bandit | awk '{print $NF}'