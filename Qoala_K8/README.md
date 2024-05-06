# Kubernetes Steps

Step 1: Set Up Kubernetes Cluster
Ensure you have a Kubernetes cluster running. This could be on a local development environment (e.g., Minikube) or a cloud-based Kubernetes service.

Step 2: Create nginx Deployment YAML
Create a YAML file (deployment.yaml) to define the nginx Deployment with the desired replicas and update strategy.

Step 3: Deploy the nginx Deployment
Apply the nginx Deployment YAML to your Kubernetes cluster:

kubectl apply -f nginx-deployment.yaml

Step 4: Check Deployment Status
Verify that the Deployment and associated Pods are running:

kubectl get deployments
kubectl get pods

Step 5: Implement Rolling Updates
To perform rolling updates, you'll update the nginx container image version in the Deployment YAML. For example, update image: nginx:latest to image: nginx:1.21.3 in deployment.yaml

kubectl apply -f nginx-deployment.yaml --record=true


Step 6: Monitor Rolling Update Progress
Monitor the progress of the rolling update:

kubectl rollout status deployment/nginx-deployment



To deploy a sample application like nginx on a Kubernetes cluster with high availability and implement rolling updates, follow these steps:

Step 1: Set Up Kubernetes Cluster
Ensure you have a Kubernetes cluster running. I have used minikube.


Step 2: Create nginx Deployment YAML
Create a YAML file (deployment.yaml) to define the nginx Deployment with the desired replicas and update strategy.



Step 3: Deploy the nginx Deployment
Apply the nginx Deployment YAML to your Kubernetes cluster:

kubectl apply -f nginx-deployment.yaml



Step 4: Check Deployment Status
Verify that the Deployment and associated Pods are running:

kubectl get deployments
kubectl get pods


Step 5: Implement Rolling Updates
To perform rolling updates, you'll update the nginx container image version in the Deployment YAML. For example, update image: nginx:latest to image: nginx:1.21.3 in nginx-deployment.yaml.

Apply the updated Deployment YAML to trigger a rolling update:

kubectl apply -f nginx-deployment.yaml --record=true


Step 6: Monitor Rolling Update Progress
Monitor the progress of the rolling update:

kubectl rollout status deployment/nginx-deployment



Step 7: Rollback 
If the update encounters issues, rollback to the previous version:

kubectl rollout undo deployment/nginx-deployment