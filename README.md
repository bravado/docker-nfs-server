Docker NFS Server
=================

Usage
----

Mount the volumes to be exported on '/exports' and run a `privileged` 
container passing a list of allowed ip addresses

```bash
docker run -d --name nfs --privileged -v /path1:/exports/dir -v /path2:/exports/otherdir bravado/nfs-server 10.0.0.0/8 192.168.0.0/24 ...
```

Test with

```bash
docker run -d --name nfs-client --privileged --link nfs:nfs cpuguy83/nfs-client /path/on/nfs/server:/path/on/client
```

Environment Variables

```
ENV NFS_OPTS rw,sync,no_subtree_check,no_root_squash
```

More Info
=========

See https://container42.com/2014/03/29/docker-quicktip-4-remote-volumes/
