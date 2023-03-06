@cloudshell:~ (kpmg-tests)$ python metadata_pull.py --data_key zone
zone  Val:  projects/539412752171/zones/asia-southeast1-a

All available keys for instance:
dict_keys(['attributes', 'cpuPlatform', 'description', 'disks', 'guestAttributes', 'hostname', 'id', 'image', 'licenses', 'machineType', 'maintenanceEvent', 'name', 'networkInterfaces', 'preempted', 'remainingCpuTime', 'scheduling', 'serviceAccounts', 'tags', 'virtualClock', 'zone'])



@cloudshell:~ (kpmg-tests)$ python metadata_pull.py --data_key hostname
hostname  Val:  boost-cf46t.c.k3a175a5f60fae8ea-tp.internal

All available keys for instance:
dict_keys(['attributes', 'cpuPlatform', 'description', 'disks', 'guestAttributes', 'hostname', 'id', 'image', 'licenses', 'machineType', 'maintenanceEvent', 'name', 'networkInterfaces', 'preempted', 'remainingCpuTime', 'scheduling', 'serviceAccounts', 'tags', 'virtualClock', 'zone'])



@cloudshell:~ (kpmg-tests)$ python metadata_pull.py --data_key machineType
machineType  Val:  projects/539412752171/machineTypes/e2-standard-4

All available keys for instance:
dict_keys(['attributes', 'cpuPlatform', 'description', 'disks', 'guestAttributes', 'hostname', 'id', 'image', 'licenses', 'machineType', 'maintenanceEvent', 'name', 'networkInterfaces', 'preempted', 'remainingCpuTime', 'scheduling', 'serviceAccounts', 'tags', 'virtualClock', 'zone'])






