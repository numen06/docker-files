#!/bin/bash
if [$MODE = "client"]; 
then 
./frpc -c ./frpc.ini
else 
./frps -c ./frps.ini
fi
