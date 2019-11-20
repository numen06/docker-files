#!/bin/bash
if   [$FRPC]; 
then 
./frpc -c ./frpc.ini
else 
./frps -c ./frps.ini
fi
