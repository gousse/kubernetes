#!/bin/bash
bash 0_create_cluster.sh
bash 2_deploy_traefik.sh
bash 90_deploy_test.sh
bash 91_test_ingress.sh
bash 99_delete_test.sh
