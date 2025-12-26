# Linux Server Security Checklist

This checklist provides basic and essential steps to secure a Linux server.
Recommended for VPS, cloud servers and small business environments.

## System Updates
- Update system packages
- Enable automatic security updates
- Remove unused packages

Command example:
   bash
sudo apt update && sudo apt upgrade -y

## User Management
- Create a non-root user
- Disable root SSH login
- Remove unused user accounts
- Enforce strong passwords

## SSH Hardening
- Change default SSH port
- Disable root login
- Enable SSH key authentication
- Disable password authentication (optional)
- Limit SSH access to specific users

File to edit:
/etc/ssh/sshd_config

## Firewall Configuration
- Install UFW
- Allow only necessary ports (SSH, HTTP, HTTPS)
- Enable firewall
- Verify firewall rules

Command example:
sudo ufw allow ssh
sudo ufw enable

## Services & Processes
- Identify running services
- Disable unnecessary services
- Monitor active network ports

Command example:
sudo systemctl list-units --type=service
sudo ss -tulnp

## File Permissions
- Review sensitive file permissions
- Secure /etc/passwd and /etc/shadow
- Remove world-writable files

## Logs & Monitoring
- Enable log monitoring
- Review authentication logs
- Configure log rotation

Log files:
/var/log/auth.log
/var/log/syslog

## Fail2Ban (Optional but Recommended)
- Install Fail2Ban
- Enable SSH protection
- Monitor banned IPs

## Backup & Recovery
- Configure regular backups
- Test restore procedure
- Secure backup storage

## Disclaimer
This checklist is intended for educational and professional hardening purposes.
Always test changes on a non-production server first.
