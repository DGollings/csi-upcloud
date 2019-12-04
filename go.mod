module github.com/dgollings/csi-upcloud

require (
	github.com/UpCloudLtd/upcloud-go-api v0.0.0-20191002121400-278d4fc37f37
	github.com/container-storage-interface/spec v1.2.0
	github.com/golang/protobuf v1.3.1
	github.com/hashicorp/go-cleanhttp v0.5.1 // indirect
	github.com/sirupsen/logrus v1.2.0
	golang.org/x/sync v0.0.0-20190423024810-112230192c58
	golang.org/x/sys v0.0.0-20190616124812-15dcb6c0061f
	google.golang.org/grpc v1.23.0
	k8s.io/kubernetes v1.16.3
)

replace (
	k8s.io/api => k8s.io/api v0.0.0-20190805141119-fdd30b57c827
	k8s.io/apiextensions-apiserver => k8s.io/apiextensions-apiserver v0.0.0-20190805143126-cdb999c96590
	k8s.io/apimachinery => k8s.io/apimachinery v0.0.0-20190612205821-1799e75a0719
	k8s.io/apiserver => k8s.io/apiserver v0.0.0-20190805142138-368b2058237c
	k8s.io/cli-runtime => k8s.io/cli-runtime v0.0.0-20190805143448-a07e59fb081d
	k8s.io/client-go => k8s.io/client-go v0.0.0-20190805141520-2fe0317bcee0
	k8s.io/cloud-provider => k8s.io/cloud-provider v0.0.0-20190805144409-8484242760e7
	k8s.io/cluster-bootstrap => k8s.io/cluster-bootstrap v0.0.0-20190805144246-c01ee70854a1
	k8s.io/code-generator => k8s.io/code-generator v0.0.0-20190612205613-18da4a14b22b
	k8s.io/component-base => k8s.io/component-base v0.0.0-20190805141645-3a5e5ac800ae
	k8s.io/cri-api => k8s.io/cri-api v0.0.0-20190531030430-6117653b35f1
	k8s.io/csi-translation-lib => k8s.io/csi-translation-lib v0.0.0-20190805144531-3985229e1802
	k8s.io/kube-aggregator => k8s.io/kube-aggregator v0.0.0-20190805142416-fd821fbbb94e
	k8s.io/kube-controller-manager => k8s.io/kube-controller-manager v0.0.0-20190805144128-269742da31dd
	k8s.io/kube-proxy => k8s.io/kube-proxy v0.0.0-20190805143734-7f1675b90353
	k8s.io/kube-scheduler => k8s.io/kube-scheduler v0.0.0-20190805144012-2a1ed1f3d8a4
	k8s.io/kubectl => k8s.io/kubectl v0.0.0-20190602132728-7075c07e78bf
	k8s.io/kubelet => k8s.io/kubelet v0.0.0-20190805143852-517ff267f8d1
	k8s.io/legacy-cloud-providers => k8s.io/legacy-cloud-providers v0.0.0-20190805144654-3d5bf3a310c1
	k8s.io/metrics => k8s.io/metrics v0.0.0-20190805143318-16b07057415d
	k8s.io/node-api => k8s.io/node-api v0.0.0-20190805144819-9dd62e4d5327
	k8s.io/sample-apiserver => k8s.io/sample-apiserver v0.0.0-20190805142637-3b65bc4bb24f
	k8s.io/sample-cli-plugin => k8s.io/sample-cli-plugin v0.0.0-20190805143616-1485e5142db3
	k8s.io/sample-controller => k8s.io/sample-controller v0.0.0-20190805142825-b16fad786282
)

go 1.13
