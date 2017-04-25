#docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh

mkdir -p /var/lib/kubelet
mount --bind /var/lib/kubelet /var/lib/kubelet
#!/bin/bashps aux


mount --make-shared /var/lib/kubelet

export K8S_VERSION=v1.5.6
export ARCH=amd64
docker run \
    --volume=/sys:/sys:rw \
    --volume=/var/lib/docker/:/var/lib/docker:rw \
    --volume=/var/lib/kubelet/:/var/lib/kubelet:rw,shared \
    --volume=/var/run:/var/run:rw \
    --net=host \
    --pid=host \
    --privileged \
    --name=kubelet \
    gcr.io/google_containers/hyperkube-${ARCH}:${K8S_VERSION} \
    /hyperkube kubelet \
        --hostname-override=127.0.0.1 \
        --api-servers=http://localhost:8080 \
        --config=/etc/kubernetes/manifests \
        --cluster-dns=10.0.0.10 \
        --cluster-domain=cluster.local \
        --allow-privileged --v=2
        
#https://github.com/kubernetes/community/blob/master/contributors/devel/local-cluster/docker.md

#docker rm -f kubelet

#docker rm -f `docker ps | grep k8s | awk '{print $1}'`