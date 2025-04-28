# AWS Auto Scaling Group with Classic Load Balancer

This Terraform configuration creates an Auto Scaling Group (ASG) with a Classic Load Balancer (ELB) in AWS. The setup includes:

- Launch Template with Amazon Linux 2 AMI
- Auto Scaling Group with configurable capacity
- Classic Load Balancer (ELB)
- Security Groups for both ELB and EC2 instances
- Apache web server installed on instances

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed (version ~> 1.0)
- Basic understanding of AWS services (EC2, ASG, ELB)

## Configuration

The following variables can be configured in `variables.tf` or through terraform.tfvars:

- `aws_region`: AWS region (default: ap-south-1)
- `instance_type`: EC2 instance type (default: t2.micro)
- `asg_min_size`: Minimum number of instances (default: 1)
- `asg_max_size`: Maximum number of instances (default: 3)
- `asg_desired_capacity`: Desired number of instances (default: 2)

## Usage

1. Initialize Terraform:
   ```
   terraform init
   ```

2. Review the planned changes:
   ```
   terraform plan
   ```

3. Apply the configuration:
   ```
   terraform apply
   ```

4. Access the application through the ELB DNS name (available in outputs)

## Outputs

- `elb_dns_name`: DNS name of the Classic Load Balancer
- `asg_name`: Name of the Auto Scaling Group
- `launch_template_id`: ID of the Launch Template

## Cleanup

To destroy all resources:
```
terraform destroy
```