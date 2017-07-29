#!/bin/bash

set -e

mounts="${@}"

echo "#NFS Exports" > /etc/exports

echo -n /exports >> /etc/exports

for ipaddr in "${mounts[@]}"; do
	echo -n " ${ipaddr}($NFS_OPTS,fsid=0)" >> /etc/exports
done

echo >> /etc/exports

for mnt in /exports/*; do
	echo -n $mnt >> /etc/exports
	for ipaddr in "${mounts[@]}"; do
		echo -n " ${ipaddr}($NFS_OPTS)" >> /etc/exports
	done

	echo >> /etc/exports
done

exec runsvdir /etc/sv
