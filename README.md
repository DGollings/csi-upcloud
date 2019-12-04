Heavily inspired by Digital Ocean and Ceph CSI drivers

This driver allows for persistent volumes on a Kubernetes cluster using transparantly mapped and attached MaxIOPS Upcloud volumes. Basically, wherever your pod(s) go, your associated volumes go. High available, high performance persistent applications or distributed  cloud native databases like Cockroachdb.  

Current minimum size at Upcloud is 10GB  

Alpha status software, works for me but not thoroughly tested yet.

Basic usage:  
Have a running Kubernetes cluster then:  
Open the following file:  
`deploy/kubernetes/secret/upcloud_secret.yaml`  
enter your Upcloud username/password and apply:  
`kubectl apply -f deploy/kubernetes/secret/upcloud_secret.yaml`  

Next, apply the CSI driver and all its components:  
`kubectl apply -f deploy/kubernetes/releases/csi-upcloud-v0.0.1.yaml`  
Optional, check if everything is running:  
`kubectl get pods -A`

Finally, create a persistent volume claim and a pod that uses that claim:  
`kubectl apply -f deploy/kubernetes/tests/pvctest.yaml`  
`kubectl apply -f deploy/kubernetes/tests/claimtest.yaml`  

In the Upcloud web interface you should see a volume be created and attached to whatever node the test pod happened to be created on. Feel free to exec in, create a test file, delete that pod and watch it be magically transported elsewhere :)

