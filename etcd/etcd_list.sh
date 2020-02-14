sudo etcdctl --endpoints https://localhost:2379 --ca-file /etc/kubernetes/pki/etcd/ca.crt --cert-file /etc/kubernetes/pki/etcd/server.crt --key-file /etc/kubernetes/pki/etcd/server.key member list

