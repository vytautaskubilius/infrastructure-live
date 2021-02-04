# Live infrastructure configuration for various personal projects

This repository contains live configuration that implements infrastructure for hosting various personal projects in AWS. 

# Table of Contents

- [Usage](#usage)
- [Development](#development)
- [Examples](#examples)
- [Links](#links)
- [To Do](#to-do)
- [Referenced by](#referenced-by)

## Usage

The easiest way to deploy this infrastructure is via the parent directory of the environment that hosts the environment
into which you are deploying (e.g. `megadodo/eu-north-1/production` for the production environment). Once in there,
make sure you have the correct AWS credentials loaded, and issue the `terragrunt apply-all` command.

## Development

This repository should generally require only minor changes, and those changes should normally be made in the existing
`terragrunt.hcl` files. For example, you might need to increment the module version for one of the environments while
progressing through the dev/staging/production pipeline. Similarly, newer module versions might introduce additional
input variables, which would also need to be added to the `terragrunt.hcl` files.

The repository contains [pre-commit](https://pre-commit.com) configuration file that developers are encouraged to use
to make sure formatting is kept to best practices.

## Examples

- N/A - see existing deployments for reference.

## Links

- [How to use the Gruntwork Infrastructure as Code Library](https://gruntwork.io/guides/foundations/how-to-use-gruntwork-infrastructure-as-code-library/)
- [Terragrunt](https://terragrunt.gruntwork.io)

## To Do

- N/A

## Referenced by

- N/A