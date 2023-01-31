#!/bin/bash
 wall "	#Architecture: $(uname -a)
	#CPU physical : $(grep "physical id" /proc/cpuinfo | wc -l)
	#vCPU : $(grep "processor" /proc/cpuinfo | wc -l)
	#Memory Usage: $(free -m | awk ' /Mem/ {print $3}')/$(free -m | awk ' /Mem/ {print $2}')MB ($(free -m | awk ' /Mem/ {printf("%.2f"),$3/$2*100}')%)
	#Disk Usage: $(df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} END {print ut}')/$(df -Bg | grep '^/dev/' | grep -v '/boot$' | awk '{ft += $2} END {print ft}')Gb ($(df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} {ft+= $2} END {printf("%d"), ut/ft*100}')%)
	#CPU load: $(top -bn1 | grep load | awk '{printf "%.2f\n", $(NF-2)}')
	#Last boot: $(who -b | awk '$1 == "system" {print $3 " " $4}')
	#LVM use: $(if [ $(lsblk | grep "lvm" | wc -l) -eq 0 ]; then echo no; else echo yes; fi)
	#Connexions TCP: $(netstat -t | grep ESTABLISHED | wc -l) ESTABLISHED
	#User log:$(users | wc -w)
	#Network: IP $(hostname -I)$(ip link show | awk '$1 =="link/ether" {print $2}')
	#Sudo: $(journalctl _COMM=sudo | grep COMMAND | wc -l) cmd
"
