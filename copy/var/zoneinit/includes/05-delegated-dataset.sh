#!/bin/bash

if DDS=$(/opt/core/bin/dds); then
	zfs create "${DDS}/soju" || true
	zfs set mountpoint=/var/lib/soju "${DDS}/soju"

	# znapzend for backup
	znapzendzetup create --recursive --tsformat='%Y-%m-%d-%H%M%S' --donotask \
		SRC '7day=>8hour,30day=>1day,1year=>1week,10year=>1month' "${DDS}"
	/usr/sbin/svcadm enable svc:/pkgsrc/znapzend:default
else
	# Everything will be created by the package automatically
	true
fi

# update permissions for git usage
chown soju:soju \
	/var/lib/soju
