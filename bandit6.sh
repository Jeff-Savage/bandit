#!/bin/bash
#set -x

#---------CONFIG-----------#
banditNumber="6"
banditPassword="HWasnPhtq9AVKe0dmk45nxy20cvUa6EG"

#---------MAIN------------#
sshCommand() {
	sshpass -p$banditPassword ssh -q -n bandit${banditNumber}@bandit.labs.overthewire.org -p 2220 $1
}

bandit=$(sshCommand "find / -user bandit7 -size 33c -group bandit6 2>/dev/null | xargs cat")

echo $bandit