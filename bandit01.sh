#!/bin/bash
#set -x

#---------CONFIG-----------#
banditNumber="1"
banditPassword="ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If"

#---------MAIN------------#
sshCommand() {
	sshpass -p$banditPassword ssh -q -n bandit${banditNumber}@bandit.labs.overthewire.org -p 2220 $1
}

bandit=$(sshCommand "cat ./-")

echo $bandit