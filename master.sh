sysctl net.bridge.bridge-nf-call-iptables=1

apt-get -y update && apt-get install -y apt-transport-https

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get -y update && apt-get install -y git openjdk-8-jre docker.io kubelet kubeadm kubectl kubernetes-cni

kubeadm reset && kubeadm init --apiserver-advertise-address=$(ifconfig enp0s9|xargs|awk '{print $7}'|sed -e 's/[a-z]*:/''/') > /vagrant/kube.txt #--skip-preflight-checks 
sleep 10

su - ubuntu | mkdir -p /home/ubuntu/.kube && sudo cp /etc/kubernetes/admin.conf /home/ubuntu/.kube/config && sudo chown ubuntu:ubuntu /home/ubuntu/.kube/config
sleep 3

# сразу после установки зайти и выполнить
# export kubever=$(kubectl version | base64 | tr -d '\n') && kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/alternative/kubernetes-dashboard.yaml
# kubectl proxy --disable-filter=true --address $(ifconfig enp0s8|xargs|awk '{print $7}'|sed -e 's/[a-z]*:/''/') --port=9090 --accept-hosts='^10.19.12.*$'