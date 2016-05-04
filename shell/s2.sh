#!/bin/sh
cd /home/logstat/livestatis/shell/dataall
chidname=$2
chidnamefile=${chidname}.log
chidcid=${chidname}.cid
cidpay=${chidname}.pay
uidlogin=${chidname}.login
datafile=/home/logstat/livestatis/test/data/$1/*.log
chidnamefile=${datafile}
cat ${chidnamefile} | awk -F"\\\|cid=" '{print $2}' | awk -F"|" '{print $1}' > ${chidcid}
echo "渠道${chidname} CID数"
sort -u ${chidcid} | wc -l

grep "act=start|" ${chidnamefile} > ${chidnamefile}.start
cat ${chidnamefile}.start  | awk -F"\\\|cid=" '{print $2}' | awk -F"|" '{print $1}' > ${chidcid}.start
echo "渠道${chidname} , act=start CID数"
sort -u ${chidcid}.start | wc -l

grep "act=pay|" ${chidnamefile} > ${cidpay}
cat ${cidpay}  | awk -F"\\\|cid=" '{print $2}' | awk -F"|" '{print $1}' > ${chidcid}.pay
echo "渠道${chidname} , act=pay CID数"
sort -u ${chidcid}.pay | wc -l

cat ${cidpay}  | awk -F"\\\|price=" '{print $2}' | awk -F"|" '{print $1}' > ${chidcid}.price
echo "渠道${chidname} , act=pay 钱数" 
awk '{sum+=$1}END{print sum}' ${chidcid}.price

uidlogin=${chidname}.login
grep "act=login|" ${chidnamefile}  > ${uidlogin}
cat ${uidlogin} | awk -F"\\\|uid=" '{print $2}' | awk -F"|" '{print $1}' > ${udilogin}."uid"
echo "渠道${chidname} , act=login uid数" 
sort -u ${udilogin}."uid" | wc -l
