#!/bin/bash

filename='input.txt'
n=1

echo -e " a)  Open Recursion DNS (source port U53)"
echo -e " b)  CLDAP (source port U389)"
echo -e " c)  Simple Service Discovery Protocol – SSDP (source port U1900)"
echo -e " d)  Memcache (source port 11211) "
echo -e " e)  mDNS (port U5353)"
echo -e " f)  SNMP (source port U161 U162)"
echo -e " g)  NTP monlist (source port U123)"
echo -e " h)  Jenkins "
echo -e " i)  Tomcat "
echo -e " j)  Rpcbind (source port 111)"
echo -e " k)  CharGen (source Port U19)"
echo -e " l)  Wget Result "
echo -e " m)  Curl Result "
echo -e " n) GitLab"
echo -e "Enter the vulnerability choice"

read choice

case $choice in


a)

while read line; do

$echo dig amazonaws.com @$line


n=$((n+1))
done < $filename
;;

b)

while read line; do

$echo sudo nmap -p 389 -sU -Pn $line

n=$((n+1))
done < $filename
;;

c)

while read line; do

$echo sudo nmap -p1900 -sSU -Pn $line

n=$((n+1))
done < $filename
;;

d)

while read line; do

$echo sudo nmap –p11211 sSU $line

n=$((n+1))
done < $filename
;;



e)

while read line; do

$echo dig +short -p 5353 -t ptr _services._dns-sd._udp.local @$line

n=$((n+1))
done < $filename
;;


f)

while read line; do

$echo sudo nmap -p161-162 -sSU -Pn $line

n=$((n+1))
done < $filename
;;


g)

while read line; do

$echo sudo ntpdc -n -c monlist  $line

n=$((n+1))
done < $filename
;;


h) Jenkins

while read line; do

$echo $line -p 33848 -sU —script

n=$((n+1))
done < $filename
;;

i) Tomcat

while read line; do

$echo sudo nmap -sV -p8080 $line

n=$((n+1))
done < $filename
;;


j)

while read line; do

$echo sudo nmap -p111 -sSU -Pn $line

n=$((n+1))
done < $filename
;;


k)

while read line; do

$echo sudo nmap -p 19 $line

n=$((n+1))
done < $filename
;;

l)

while read line; do

echo $line
$echo wget -S --spider $line

n=$((n+1))
done < $filename
;;


m)

while read line; do

echo $line
$echo curl -IL $line

n=$((n+1))
done < $filename
;;

n)

while read line; do

echo $line 

if [ "$line" -ne 2 ]; then
    echo -ne "this script takes exactly 2 argument : the first is the ip address, the second the port number. \n example
: ./detect_gitlab.sh 3.85.25.102 80\n"
    exit 1
fi
if $(curl -v -m 3 -i http://$1:$2/help 2>&1 | grep -q  "_gitlab_session"); then echo 'GitLab found'; else echo 'No open GitLab found'; fi

n=$((n+1))
done < $filename
;;

esac
