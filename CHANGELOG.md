# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.0] - 2021-08-26

### Added

- Deployed `v0.2.3` of `infrastructure-modules` to production in the `kumetynas-336258401857` AWS account.
  - The deployment consists of a VPC, Route53 hosted zone and SendGrid verification DNS records in that zone,
  and an EC2 instance running WordPress for the kumetynas.lt website.

### Removed

- `static-website` module deployments.
- GitHub Actions CI/CD workflows as the third party Terragrunt action didn't work as expected.

## [0.1.0] - 2021-02-04

### Added

- Deployed `v0.1.0` of the `static-website` module to production.

[0.2.0]: https://github.com/vytautaskubilius/infrastructure-live/releases/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/vytautaskubilius/infrastructure-live/releases/tag/v0.1.0
