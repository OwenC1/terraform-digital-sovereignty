# Terraform Digital Sovereignty

This project uses Terraform and HashiCorp Sentinel to demonstrate how organisations can enforce digital sovereignty and infrastructure security requirements through Policy-as-Code.

The aim is to check infrastructure against a set of security and compliance rules before it is deployed.

## Project Overview

The project was developed for the fictional organisation ATUL0012345 as part of the DevOps postgraduate programme at ATU.

Terraform is used to define AWS infrastructure, including an EC2 instance and its security group. Sentinel policies are used to check whether the proposed infrastructure meets the organisation's requirements.

The infrastructure is planned and tested without deploying real AWS resources.

## Sentinel Policies

Seven Sentinel policies were developed:

| Policy | Purpose |
|---|---|
| Sovereignty | Restricts AWS infrastructure to the Ireland region (`eu-west-1`). |
| Instance Type | Checks that approved EC2 instance types are used. |
| Encryption | Requires encryption for EC2 storage. |
| Metadata | Requires IMDSv2 for EC2 instances. |
| Network | Checks security group rules to reduce unnecessary network exposure. |
| Provider Security | Restricts Terraform providers to approved sources and versions. |
| Module Security | Checks that Terraform modules use trusted and version-pinned sources. |

These policies help demonstrate how security and compliance requirements can be checked automatically rather than relying entirely on manual reviews.

## Testing and Results

All seven policies were tested locally using Sentinel mock data, with both compliant and non-compliant scenarios.

The sovereignty policy was also tested in HCP Terraform, which is connected to the GitHub repository.

Two HCP Terraform tests were completed:

- **Compliant:** Infrastructure planned in `eu-west-1` passed the Sentinel policy.
- **Non-compliant:** Infrastructure planned in `us-east-1` failed the hard-mandatory Sentinel policy, blocking deployment.

No AWS resources were deployed during testing.

Screenshots, Terraform plan output and Sentinel test results are available in the `documentation/evidence/` folder.

## Tools Used

- **Terraform:** Defines infrastructure using code.
- **HashiCorp Sentinel:** Checks infrastructure against security and compliance policies.
- **HCP Terraform:** Runs Terraform plans and evaluates the sovereignty policy.
- **GitHub:** Stores project files and manages changes through branches and pull requests.
- **AWS:** The cloud platform used in the infrastructure configuration.

## Limitations

This project is a demonstration rather than a production-ready security framework. The policies cover selected security and sovereignty requirements rather than every possible compliance scenario.

All seven policies were tested locally, but only the sovereignty policy was enforced through HCP Terraform. The infrastructure was not deployed to AWS.

## AI Assistance

ChatGPT (OpenAI, GPT-6) was used to support learning, explain Terraform and Sentinel concepts, assist with troubleshooting and review code and documentation. All configuration changes and test results were reviewed during development.