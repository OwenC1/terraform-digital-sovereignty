# Technical Report – Terraform Digital Sovereignty

## 1. Introduction

This project was developed to demonstrate how Policy-as-Code can help an organisation enforce digital sovereignty and infrastructure security requirements. Terraform was used to define AWS infrastructure, while HashiCorp Sentinel was used to check whether the proposed infrastructure met specific policies before deployment.

The main objective was to demonstrate that non-compliant infrastructure could be identified and blocked automatically.

## 2. Design and Implementation

The Terraform configuration defines an AWS EC2 instance and a security group. The AWS Ireland region (`eu-west-1`) was selected to support the organisation's digital sovereignty requirements.

Seven Sentinel policies were developed to cover different security and compliance requirements. The sovereignty policy restricts AWS infrastructure to the Ireland region, while the instance type policy allows only approved EC2 instance types. The encryption policy checks that storage is encrypted, and the metadata policy requires IMDSv2 for improved EC2 security. The network policy checks security group rules to prevent unnecessary exposure. Finally, the provider and module security policies help protect the infrastructure supply chain by checking approved providers, trusted module sources and version restrictions.

GitHub was used for version control, with changes developed on separate branches and merged through pull requests. HCP Terraform was connected to the GitHub repository to run Terraform plans and evaluate the sovereignty policy.

## 3. Testing and Results

All seven Sentinel policies were tested locally using mock data. Each policy included compliant and non-compliant test scenarios to verify that acceptable configurations passed and unacceptable configurations failed.

The sovereignty policy was also tested through HCP Terraform using two different AWS regions.

The first test used `eu-west-1` (Ireland). Terraform successfully generated a plan to create two resources, and the Sentinel policy passed.

For the second test, the AWS region was overridden to `us-east-1` (United States). Terraform generated the plan, but Sentinel returned a hard-mandatory policy failure, preventing the infrastructure from being applied.

These results demonstrated that the framework could automatically enforce the selected regional restriction before deployment. Screenshots and test outputs were saved in the `documentation/evidence/` folder.

## 4. Limitations and Conclusion

This project demonstrates a basic Policy-as-Code framework rather than a complete production security solution. Although all seven policies were tested locally, only the sovereignty policy was evaluated through HCP Terraform.

The infrastructure was not deployed to AWS, so testing focused on Terraform plans and Sentinel policy evaluation rather than live infrastructure.

Overall, the project demonstrated how Terraform, Sentinel, GitHub and HCP Terraform can work together to identify non-compliant infrastructure early in the deployment process. It also highlighted the importance of testing policies against actual Terraform plan data rather than relying only on configuration defaults.