This post describes general idea about NFS server that uses underlying FoundationDB layer.

Client (NFS) <-> NFS Server FoundationDb Layer <-> FoundationDB 

Both NFS Server Foundation DB Layer and Foundation DB can be run reliably by K8S, even better, FoundationDB comes with it's own helm  chart / operator.

Since FoundationDB is transactional, then it should be possible to implement stateless NFSv3 wrapper around FoundationDB concepts and given stateless nature of NFSv3 protocol it might be possible to implement NFS Server autoscaling and load-balancing per request.

[It is of greate help that FoundationDB provides hierarchical namespacing API which easily maps into File System Presentation](https://godoc.org/github.com/apple/foundationdb/bindings/go/src/fdb/directory)

