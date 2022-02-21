#!/bin/bash
#LBFQDN="demo.192.168.56.101.nip.io"
LBFQDN="localhost"

curl -sv --noproxy '*' ${LBFQDN}/foo
curl -sv --noproxy '*' ${LBFQDN}/bar
curl -sv --noproxy '*' ${LBFQDN}/whoami
curl -sv --noproxy '*' ${LBFQDN}/echo
curl -sv --noproxy '*' -k https://${LBFQDN}/echo
