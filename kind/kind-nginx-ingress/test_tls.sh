#!/bin/bash
#LBFQDN="demo.192.168.56.101.nip.io"
LBFQDN="tls.192.168.56.101.nip.io"
#LBFQDN="localhost"

#OPTIONS="-sv --noproxy '*'"
OPTIONS="-s --noproxy '*'"

#HTTP
curl ${OPTIONS} ${LBFQDN}/echo

#HTTPS 
curl ${OPTIONS} -k https://${LBFQDN}/tls
curl ${OPTIONS}    https://${LBFQDN}/tls

echo curl ${OPTIONS}    https://${LBFQDN}/tls

