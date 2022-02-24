#!/bin/bash
while true
do
	echo "timeout 60s"
	sleep 60

	while ! op list vaults
	do
   		echo "op not initilazed"
   		echo "initializing..."
   		opauth=$(expect ~/Workspace/admin-container/scripts/auto_onepassword.exp | awk 'FNR == 3 {print}' | tr -d '"')
   		sed -i "/*OP_SESSION_my*/$opauth/" ~/.profile
		source ~/.profile
   		echo "finished"
	done
done
