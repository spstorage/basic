import boto3

ec2= boto3.resource('ec2',region_name='ap-south-1')
instances= ec2.create_instances(
    ImageId= "ami-0xxx1212xx",
    InstanceType= "t2.micro",
    MaxCount=1,
    MinCount=1
)
for instance in instances:
    print("New Ec2 ID:",instance.id)
