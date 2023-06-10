curl -L https://github.com/kubernetes/kompose/releases/download/v1.28.0/kompose-linux-amd64 -o kompose
chmod +x kompose
sudo mv ./kompose /usr/local/bin/kompose
kompose version
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
helm version
cd k8s
helm create petclinic_chart
rm -r petclinic_chart/templates/*
kompose convert -f docker-compose.yml -o petclinic_chart/templates
aws s3api create-bucket --bucket petclinic-helm-charts-ibe-petclinic --region us-east-1
aws s3api put-object --bucket petclinic-helm-charts-ibe-petclinic --key stable/myapp/
helm plugin install https://github.com/hypnoglow/helm-s3.git
sudo su -s /bin/bash jenkins
export PATH=$PATH:/usr/local/bin
helm version
helm plugin install https://github.com/hypnoglow/helm-s3.git
exit
AWS_REGION=us-east-1 helm s3 init s3://petclinic-helm-charts-ibe-petclinic/stable/myapp 
aws s3 ls s3://petclinic-helm-charts-ibe-petclinic/stable/myapp/
helm repo ls
AWS_REGION=us-east-1 helm repo add stable-petclinicapp s3://petclinic-helm-charts-ibe-petclinic/stable/myapp/
cd k8s
helm package petclinic_chart/ 
HELM_S3_MODE=3 AWS_REGION=us-east-1 helm s3 push ./petclinic_chart-0.0.1.tgz stable-petclinicapp
helm search repo stable-petclinicapp
helm package petclinic_chart/
HELM_S3_MODE=3 AWS_REGION=us-east-1 helm s3 push ./petclinic_chart-0.0.2.tgz stable-petclinicapp
helm repo update
helm search repo stable-petclinicapp
helm search repo stable-petclinicapp --versions