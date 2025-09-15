#!/bin/bash
#set -x

#---------CONFIG-----------#
banditNumber="5"
banditPassword="4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw"

#---------MAIN------------#
sshCommand() {
	sshpass -p$banditPassword ssh -q -n bandit${banditNumber}@bandit.labs.overthewire.org -p 2220 $1
}

banditFile=$(sshCommand "find ./inhere -type f -size 1033c -not -executable -exec sh -c 'file -b {} | grep -q text' \; -print")
bandit=$(sshCommand "cat $banditFile")

echo $bandit