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
         - { role: nl2go.clickhouse_backup }
      vars:
        clickhouse_backup_version: 0.5.2
        clickhouse_backup_general_remote_storage: gcs
        clickhouse_backup_gcs_credentials_json: !vault |
          $ANSIBLE_VAULT;1.2;AES256;production
          1234xxx...
        clickhouse_backup_gcs_bucket: clickhouse-backup-bucket
        clickhouse_backup_gcs_path: "clickhouse"
        clickhouse_backup_clickhouse_host: "{{ ansible_default_ipv4.address }}"
        clickhouse_backup_clickhouse_password: 123SECURE

### Install cronjob for executing backups

The role contains tasks to automatically set up 3 cron jobs that execute the backup on a regular basis. The installation of these cron jobs can be controlled by setting the variable `clickhouse_backup_install_crontab` which defaults to `true`. The default configuration would set up daily, weekly and monthly backups. The number of backups to keep on the remote storage for each kind of backups can be controlled by the variables:

    clickhouse_backup_general_backups_to_keep_remote_daily: 7
    clickhouse_backup_general_backups_to_keep_remote_weekly: 4
    clickhouse_backup_general_backups_to_keep_remote_monthly: 12

The numbers given here are the default values.

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
