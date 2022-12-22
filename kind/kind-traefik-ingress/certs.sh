#!/bin/bash
# generate a host wildcard cert
IP="192.168.56.101"
mkcert "*.${IP}.nip.io" *.localhost localhost 127.0.0.1 ::1

kubectl -n traefik create secret tls wildcard --cert=./_wildcard.${IP}.nip.io+4.pem --key=./_wildcard.${IP}.nip.io+4-key.pem

#kubectl -n default create secret tls keycloak-${IP}.nip.io-tls --cert=./_wildcard.${IP}.nip.io+4.pem --key=./_wildcard.${IP}.nip.io+4-key.pem

#kubectl -n traefik apply -f default-cert.yaml
