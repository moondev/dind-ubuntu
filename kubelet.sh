!/bin/bash

KUBELET_KUBECONFIG_ARGS="--kubeconfig=/etc/kubernetes/kubelet.conf --require-kubeconfig=true"
KUBELET_SYSTEM_PODS_ARGS="--pod-manifest-path=/etc/kubernetes/manifests --allow-privileged=true"
KUBELET_NETWORK_ARGS="--network-plugin=cni --cni-conf-dir=/etc/cni/net.d --cni-bin-dir=/opt/cni/bin"
KUBELET_DNS_ARGS="--cluster-dns=10.96.0.10 --cluster-domain=cluster.local"
KUBELET_AUTHZ_ARGS="--authorization-mode=Webhook --client-ca-file=/etc/kubernetes/pki/ca.crt"

/usr/bin/kubelet $KUBELET_KUBECONFIG_ARGS $KUBELET_SYSTEM_PODS_ARGS $KUBELET_NETWORK_ARGS $KUBELET_DNS_ARGS $KUBELET_AUTHZ_ARGS $KUBELET_EXTRA_ARGS