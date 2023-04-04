#!/bin/
LBFQDN="localhost"

kubectl wait deploy/whoami-deployment --for condition=available --timeout=-1s

echo ${LBFQDN}/foo
curl -s --noproxy '*' ${LBFQDN}/foo

echo ${LBFQDN}/bar
curl -s --noproxy '*' ${LBFQDN}/bar

echo ${LBFQDN}/whoami
curl -s --noproxy '*' ${LBFQDN}/whoami

echo https://${LBFQDN}/whoami
curl -s --noproxy '*' https://${LBFQDN}/whoami

exit

#LBFQDN="demo.192.168.56.101.nip.io"
LBFQDN="echo.192.168.56.101.nip.io"
#LBFQDN="localhost"

curl -sv --noproxy '*' ${LBFQDN}/foo
curl -sv --noproxy '*' ${LBFQDN}/bar
curl -sv --noproxy '*' ${LBFQDN}/whoami
curl -sv --noproxy '*' ${LBFQDN}/echo
curl -sv --noproxy '*' -k https://${LBFQDN}/echo
curl -sv --noproxy '*' https://${LBFQDN}/echo
