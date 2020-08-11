[![Build Status](https://travis-ci.com/nl2go/ansible-role-clickhouse-backup.svg?branch=master)](https://travis-ci.com/nl2go/ansible-role-clickhouse-backup)
[![Ansible Galaxy](https://img.shields.io/badge/role-nl2go.clickhouse_backup-blue.svg)](https://galaxy.ansible.com/nl2go/clickhouse_backup/)
[![Ansible Galaxy Quality Score](https://img.shields.io/ansible/quality/49618)](https://galaxy.ansible.com/nl2go/clickhouse_backup/)
[![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/nl2go/ansible-role-clickhouse-backup)](https://github.com/nl2go/ansible-role-clickhouse-backup/releases)
[![Ansible Galaxy Downloads](https://img.shields.io/ansible/role/d/49618.svg?color=blue)](https://galaxy.ansible.com/nl2go/clickhouse_backup/)

# Ansible Role: ClickHouse Backup

An Ansible Role that manages installation and configuration of the [ClickHouse backup tool](https://github.com/AlexAkulov/clickhouse-backup).

## Role Variables

Available variables listed and described along with default values in [defaults/main.yml](defaults/main.yml).

## Dependencies

None.

## Example Playbook

    - hosts: all
      roles:
         - { role: nl2go.ansible-role-clickhouse-backup }

## Development

Use [docker-molecule](https://github.com/nl2go/docker-molecule) following the instructions to run [Molecule](https://molecule.readthedocs.io/en/stable/)
or install [Molecule](https://molecule.readthedocs.io/en/stable/) locally (not recommended, version conflicts might appear).

Provide Hetzner Cloud token:

    export HCLOUD_TOKEN=123abc456efg

Provide custom or decrypt existing GCS credentials file:

    export CI_FILE_SECRET=123
    openssl aes-256-cbc -d \
        -in molecule/resources/clickhouse-backup-gcs-credentials.json.enc \
        -out molecule/resources/clickhouse-backup-gcs-credentials.json \
        -md sha256 \
        -k ${CI_FILE_SECRET}

Use following to run tests:

    molecule test --all

## Maintainers

- [dirkaholic](https://github.com/dirkaholic)

## License

See the [LICENSE.md](LICENSE.md) file for details.

## Author Information

This role was created in 2020 by [Newsletter2Go GmbH](https://www.newsletter2go.com/).
