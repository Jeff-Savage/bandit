#!/bin/bash
#set -x

#---------CONFIG-----------#
banditNumber="3"
banditPassword="MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx"

#---------MAIN------------#
sshCommand() {
	sshpass -p$banditPassword ssh -q -n bandit${banditNumber}@bandit.labs.overthewire.org -p 2220 $1
}

bandit=$(sshCommand "cat ./inhere/...Hiding-From-You")

echo $bandit