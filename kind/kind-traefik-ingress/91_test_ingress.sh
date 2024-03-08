#!/bin/
LBFQDN="localhost"

kubectl wait deploy/whoami-deployment --for condition=available --timeout=-1s

echo "**********************"
echo ${LBFQDN}/foo
curl -s --noproxy '*' ${LBFQDN}/foo
echo "**********************"

echo ${LBFQDN}/bar
curl -s --noproxy '*' ${LBFQDN}/bar
echo "**********************"

echo ${LBFQDN}/whoami
curl -s --noproxy '*' ${LBFQDN}/whoami
echo "**********************"

echo https://${LBFQDN}/whoami
curl -s --noproxy '*' https://${LBFQDN}/whoami
echo "**********************"

echo https://${LBFQDN}/echo
curl -s --noproxy '*' https://${LBFQDN}/echo
echo "**********************"

echo https://${LBFQDN}/echo2
curl -s --noproxy '*' https://${LBFQDN}/echo2
echo "**********************"

echo https://${LBFQDN}/echo3
curl -s --noproxy '*' https://${LBFQDN}/echo3
echo "**********************"

exit

#LBFQDN="demo.192.168.56.101.nip.io"
#LBFQDN="echo.192.168.56.101.nip.io"
#LBFQDN="localhost"
#Verbose call 
curl -sv --noproxy '*' ${LBFQDN}/foo
curl -sv --noproxy '*' ${LBFQDN}/bar
curl -sv --noproxy '*' ${LBFQDN}/whoami
curl -sv --noproxy '*' ${LBFQDN}/echo
curl -sv --noproxy '*' -k https://${LBFQDN}/echo
curl -sv --noproxy '*' https://${LBFQDN}/echo
curl -sv --noproxy '*' ${LBFQDN}/echo2
curl -sv --noproxy '*' -k https://${LBFQDN}/echo2
curl -sv --noproxy '*' https://${LBFQDN}/echo2
curl -sv --noproxy '*' -k https://${LBFQDN}/echo3
curl -sv --noproxy '*' https://${LBFQDN}/echo3
