curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws version
aws --version
vim .bashrc
source .bashrc
# Download the latest stable release
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# Make it executable
chmod +x kubectl
# Move it to your system path
sudo mv kubectl /usr/local/bin/
# Verify installation
kubectl version --client
# Download the latest release
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
# Move the binary to your system path
sudo mv /tmp/eksctl /usr/local/bin
# Verify installation
eksctl version
aws s3 ls
eksctl create cluster --name EKS-1 --region=us-east-1 --zones=us-east-1a,us-east-1b --without-nodegroup
eksctl utils associate-iam-oidc-provider --region us-east-1 --cluster EKS-1 --approve
eksctl create nodegroup --cluster=EKS-1 --region=us-east-1 --name=node2 --node-type=t3.medium --nodes=3 -nodes-min=2 --nodes-max=4 --node-volume-size=20 --ssh-access --ssh-public-key=kopskey -managed --asg-access --external-dns-access --full-ecr-access --appmesh-access --alb-ingress-access
eksctl create nodegroup --cluster=EKS-1 --region=us-east-1 --name=node2 --node-type=t3.medium --nodes=3 -nodes-min=2 --nodes-max=4 --node-volume-size=20 --ssh-access --ssh-public-key=kopskey --managed --asg-access --external-dns-access --full-ecr-access --appmesh-access --alb-ingress-access
eksctl create nodegroup --cluster=EKS-1 --region=us-east-1 --name=node2 --node-type=t3.medium --nodes=3 --nodes-min=2 --nodes-max=4 --node-volume-size=20 --ssh-access --ssh-public-key=kopskey --managed --asg-access --external-dns-access --full-ecr-access --appmesh-access --alb-ingress-access
ll
kubectl get po
kubectl get role -n webappeksctl utils associate-iam-oidc-provider --region ap-south-1 --cluster EKS-1 --approve

eksctl create cluster --name EKS1pamu --region=us-east-1 --zones=us-east-1a,us-east-1b --without-nodegroup
ll
eksctl utils associate-iam-oidc-provider --region ap-south-1 --cluster EKS-1 --approve
eksctl utils associate-iam-oidc-provider --region us-east-1 --cluster EKS1pamu --approve
eksctl create nodegroup --cluster=EKS1pamu --region=us-east-1 --name=node2 --node-type=t3.micro --nodes=3 --nodes-min=2 --nodes-max=4 --node-volume-size=20 --ssh-access --ssh-public-key=kopskey --managed --asg-access --external-dns-access --full-ecr-access --appmesh-access --alb-ingress-access
kubectl get no
vim pod.yml
kubectl create -f pod.yml 
kubectl get containers
kubectl describe pod myppod
kubectl describe pod mypod
yum install git -y
git --version
git init
vim pod.yml 
kubectl create -f pod.yml 
vim pod.yml 
kubectl create -f pod.yml 
vim pod.yml 
kubectl create -f pod.yml 
vim service.yml
vim myservice.yml
vim pod.yml 
vim myservice.yml 
kubectl create -f myservice.yml 
vim myservice.yml 
kubectl create -f myservice.yml 
vim pod.yml 
kubectl create -f pod.yml 
vim pod.yml 
kubectl create -f pod.yml 
kubectl get po
kubectl get po --show=labels
kubectl get po --show-labels
vim myservice.yml 
kubectl create -f myservice.yml 
vim myservice.yml 
kubectl create -f myservice.yml 
vim myservice.yml 
kubectl create -f myservice.yml 
vim myservice.yml 
kubectl create -f myservice.yml 
kubectl get svc
mv myservice.yml clusteripservice
ll
cp clusteripservice nodeportvc
ll
vim nodeportvc

cp clusteripservice nodeportvc.yml
mv nodeportvc nodeportvc.yml
vim nodeportvc.yml 
kubectl create -f nodeportvc.yml 
mv clusteripservice clusteripservice.yml
vim clusteripservice.yml 
kubectl get svc
vim nodeportvc.yml 
ll
vim nodeportvc.yml lbsvc.yml
ll
cp nodeportvc.yml lbsvc.yml
ll
vim lbsvc.yml 
kubectl create -f lbsvc.yml 
vim lbsvc.yml 
kubectl create -f lbsvc.yml 
vim lbsvc.yml 
kubectl create -f lbsvc.yml 
vim lbsvc.yml 
kubectl create -f lbsvc.yml 
vim lbsvc.yml 
kubectl create -f lbsvc.yml 
kubectl get svc
history
kubectl get svc
ll
vim replicacontroller.yml
kubectl create -f replicacontroller.yml 
kubectl get p[o
kubectl get po
kubectl get po --show-lables
kubectl get po --show-lable
kubectl get po --show-labels
kubectl delete pod myrc-bj84w
kubectl get po --show-labels
cp replicacontroller.yml replicaset.yml
vim replicaset.yml 
kubectl create -f replicaset.yml 
vim replicaset.yml 
kubectl create -f replicaset.yml 
vim replicaset.yml 
kubectl create -f replicaset.yml 
kuibectl get po
kubectl get po
kubectl describe rc
kubectl get rs
kubectl get rs -o wide
kubectl get rs all
kubectl get all
kubectl scale rs myrs --replicas 10
kubectl get rs
kubectl scale rs myrs --replicas 2
vim deployment.yml
kubectl create -f deployment.yml 
vim deployment.yml
kubectl create -f deployment.yml 
vim deployment.yml
kubectl create -f deployment.yml 
vim deployment.yml
kubectl create -f deployment.yml 
vim deployment.yml
kubectl create -f deployment.yml 
vim deployment.yml
kubectl create -f deployment.yml 
kubectl apply -f deployment.yml 
kubectl get deployment
kubectl get svc
kubectl ghet rs
kubectl get rs
kubectl set image deployment 
kubectl get deployment
kubectl set image deployment/mydeployment depcont=apache
kubectl set image deployment/mydeployment depcont=mysql
kubectl set image deployment/mydeployment depcont=ggole
kubectl rollout history deployment/mydeployment
kubectl get rs
kubectl rollout history deployment/mydeployment
kubectl rollout undo deploymen/mydeployment --to-revision=2
kubectl rollout undo deployment/mydeployment --to-revision=2
kubectl rollout undo deployment/mydeployment --to-revision=1
kubectl rollout undo deployment/mydeployment --to-revision=4
kubectl rollout status deployment/mydeployment
vim daemon.yml
kubectl create -f daemon.yml 
vim daemon.yml
kubectl create -f daemon.yml 
kubectl get po
kubectl get po -n daemonset
vim daemon.yml
kubectl describe ds mydset
kubectl get ns
kubectl create ns proddev
kubectl config set-context --current --namespace=proddev
kubectl config view --minify | gerp proddev
kubectl config view --minify | gerp namespace
kubectl config view --minify | grep namespace
kubectl create namespace dev
kubectl create namespace qa
kubectl config set-contect --current --namepace=dev
kubectl config set-contex\t --current --namepace=dev
kubectl config set-context --current --namespace=dev
kubectl config view --minify | grep namespace
netstat -an
kubectl config set-context --current --namespace=default
kubectl config view --minify | grep namespace
vim emptydirvol.yml
kubectl create -f emptydirvol.yml 
vim emptydirvol.yml
kubectl create -f emptydirvol.yml 
vim emptydirvol.yml
kubectl create -f emptydirvol.yml 
kubectl get volumes
kubectl get volume
kubectl exec -it --container 
vim emptydirvol.yml
kubectl exec -it --container volcont1 --bash
kubectl exec -it --container volcont1 --/bin/bash/
kubectl exec -it devops --container volcont1 --/bin/bash/
kubectl exec -it devops --container volcont1 -- bash
kubectl get po
kubectl exec -it mydepforvol --container volcont1 -- bash
kubectl exec -it mydepforvol-6b9bd89cb-h14t4 --container volcont1 -- bash
kubectl get rs
kubectl get po -n rs
kubectl get po -rs 
cp emptydirvol.yml hostpathvol.yml
vim hostpathvol.yml 
kubectl create -f hostpathvol.yml 
vim hostpathvol.yml 
kubectl create -f hostpathvol.yml 
vim hostpathvol.yml 
kubectl create -f hostpathvol.yml 
