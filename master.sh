sysctl net.bridge.bridge-nf-call-iptables=1

apt-get -y update && apt-get install -y apt-transport-https && apt-get install -y ubuntu-desktop

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get -y update && apt-get install -y git openjdk-8-jre docker.io kubelet kubeadm kubectl kubernetes-cni


#kubeadm reset && kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=$(ifconfig enp0s9|xargs|awk '{print $7}'|sed -e 's/[a-z]*:/''/') > /vagrant/kube.txt #--skip-preflight-checks 
#sleep 10

#su - ubuntu | mkdir -p /home/ubuntu/.kube && sudo cp /etc/kubernetes/admin.conf /home/ubuntu/.kube/config && sudo chown ubuntu:ubuntu /home/ubuntu/.kube/config
#sleep 3

# сразу после установки зайти и выполнить
# kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.8.0/Documentation/kube-flannel.yml
#
# kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.8.0/Documentation/kube-flannel-rbac.yml
# перед применением дашборда ввыполняем команду kubectl create -f /vagrant/kube-dashboard-rbac.yml
# потом  kubectl apply -f /vagrant/kube-dashboard-rbac.yml потом применяем дашборд
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/alternative/kubernetes-dashboard.yaml # применяем дашбоард
# kubectl proxy --disable-filter=true --address $(ifconfig enp0s8|xargs|awk '{print $7}'|sed -e 's/[a-z]*:/''/') --port=9090 –accept-hosts='^10.19.12.*$'
#
#
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
