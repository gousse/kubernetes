#VERSION="stable"
#VERSION="1.14.1"
VERSION="1.14.2"
sudo -E \
  http_proxy=http://192.168.56.103:3128 \
  https_proxy=http://192.168.56.103:3128 \
  no_proxy=localhost,127.0.0.1,10.0.2.15,192.168.56.103,172.17.0.1,172.18.0.1,10.96.0.0/12,10.32.0.0/12 \
  kubeadm init \
   --ignore-preflight-errors=all \
   --apiserver-advertise-address 10.0.2.15 \
   --pod-network-cidr 10.32.0.0/12 \
   --kubernetes-version $VERSION \
   --apiserver-cert-extra-sans "kubernetes"

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
