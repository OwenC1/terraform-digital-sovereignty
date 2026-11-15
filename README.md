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
| Sovereignty | Restricts planned AWS infrastructure to the Ireland region (`eu-west-1`). |
| Instance Type | Checks that approved EC2 instance types are used. |
| Encryption | Requires encryption for EC2 storage. |
| Metadata | Requires IMDSv2 for EC2 instances. |
| Network | Checks security group rules to reduce unnecessary network exposure, including unrestricted SSH access. |
| Provider Security | Restricts Terraform providers to approved sources and versions. |
| Module Security | Checks that Terraform modules use trusted and version-pinned sources. |

These policies demonstrate how security and compliance requirements can be checked automatically rather than relying entirely on manual reviews.

## Design Decisions and Digital Sovereignty

The AWS Ireland region (`eu-west-1`) was selected to support the organisation's digital sovereignty requirements. Restricting infrastructure to an approved region helps organisations maintain control over where their systems and data are hosted.

However, using an Irish AWS region does not guarantee complete data sovereignty. Sensitive information could still leave Ireland through backups, replication, external services or administrative access from other countries. A production environment would require additional controls to manage these risks.

Policy-as-Code is useful because it allows security requirements to be checked consistently before infrastructure is deployed. It also helps identify potential compliance issues earlier in the development process.

## IaC Supply Chain Security

Terraform uses external providers and modules, which can introduce security risks if their sources or versions are not properly controlled.

The provider and module security policies were developed to restrict dependencies to approved sources and versions. The Terraform dependency lock file (`.terraform.lock.hcl`) also supports provider version and checksum verification.

However, Sentinel alone cannot guarantee that providers or modules are free from vulnerabilities or malicious code. Additional measures such as dependency scanning, reviewing module sources and monitoring security updates would be needed in a production environment.

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

## Limitations and Recommendations

This project demonstrates a basic Policy-as-Code framework rather than a complete production security solution.

All seven policies were tested locally, but only the sovereignty policy was enforced through HCP Terraform. The infrastructure was not deployed to AWS.

Sentinel evaluates Terraform configuration and plan data but cannot guarantee that infrastructure remains compliant after deployment. Changes made outside Terraform may also introduce security risks.

Cloud environments and security requirements change regularly, so policies need ongoing maintenance and testing. In a production environment, this framework should be supported by continuous monitoring, access controls, vulnerability scanning and regular policy reviews.

## AI Assistance

ChatGPT (OpenAI, GPT-6) was used to support learning, explain Terraform and Sentinel concepts, assist with troubleshooting and review code and documentation.

All configuration changes and test results were reviewed during development. Representative prompts and further details are provided in `documentation/ai-usage.md`.