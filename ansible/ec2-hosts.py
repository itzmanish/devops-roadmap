#!/usr/bin/python3

import sys
import json

try:
    import boto3
except Exception as e:
    print(e)
    print("Please do pip install boto3 then again run this script.")
    sys.exit(1)


def get_private_ips(ec2_ob, fv):
    f = {"Name": "tag:Type", "Values": [fv]}
    hosts = []
    for instance in ec2_ob.instances.filter(Filters=[f]):
        hosts.append(instance.private_ip_address)

    return hosts


def get_public_ips(ec2_ob, fv):
    f = {"Name": "tag:Type", "Values": [fv]}
    hosts = []
    for instance in ec2_ob.instances.filter(Filters=[f]):
        hosts.append(instance.public_ip_address)

    return hosts


def main():
    ec2_obj = boto3.resource('ec2', 'ap-south-1')
    service_group = get_private_ips(ec2_obj, "service")
    bastion_group = get_public_ips(ec2_obj, "bastion")
    all_hosts = {"bastion": bastion_group, "service": service_group}
    print(json.dumps(all_hosts))
    return None


if __name__ == "__main__":
    main()
