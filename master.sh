sysctl net.bridge.bridge-nf-call-iptables=1

apt-get -y update && apt-get install -y apt-transport-https && apt-get install -y ubuntu-desktop

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get -y update && apt-get install -y git openjdk-8-jre docker.io kubelet kubeadm kubectl kubernetes-cni


#kubeadm reset && kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=$(ifconfig enp0s9|xargs|awk '{print $7}'|sed -e 's/[a-z]*:/''/') > /vagrant/kube.txt #--skip-preflight-checks 
#sleep 10

# $ mkdir -p /home/ubuntu/.kube && sudo cp /etc/kubernetes/admin.conf /home/ubuntu/.kube/config && sudo chown ubuntu:ubuntu /home/ubuntu/.kube/config
#sleep 3
## сразу после установки зайти и выполнить
# $ kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.8.0/Documentation/kube-flannel.yml
# $ kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.8.0/Documentation/kube-flannel-rbac.yml
# $ kubectl create -f /vagrant/kube-dashboard-rbac.yml
# генерируем приватные ключи
# $ mkdir certs
# $ cd certs
# $ openssl genrsa -des3 -passout pass:x -out dashboard.pass.key 2048
# $ openssl rsa -passin pass:x -in dashboard.pass.key -out dashboard.key
# $ rm dashboard.pass.key
# $ openssl req -new -key dashboard.key -out dashboard.csr ###Отвечаем там на вопросы
# $ openssl x509 -req -sha256 -days 365 -in dashboard.csr -signkey dashboard.key -out dashboard.crt
# $ kubectl create secret generic kubernetes-dashboard-certs --from-file=$HOME/certs -n kube-system
# $ kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
# правим конфиг дашборда
# $ kubectl -n kube-system edit service kubernetes-dashboard
# меняем 
# type: ClusterIP
# на
# type: NodePort
# сохраняем :esc :wq
# смотрим на каком порту крутится теперь сервис dashboard
# $ kubectl -n kube-system get service

#
#kube-dashboard-rbac.yml
#apiVersion: rbac.authorization.k8s.io/v1beta1
#kind: ClusterRoleBinding
#metadata:
#  name: kubernetes-dashboard
#  labels:
#    k8s-app: kubernetes-dashboard
#roleRef:
#  apiGroup: rbac.authorization.k8s.io
#  kind: ClusterRole
#  name: cluster-admin
#subjects:
#- kind: ServiceAccount
#  name: kubernetes-dashboard
#  namespace: kube-system
#
#
#
