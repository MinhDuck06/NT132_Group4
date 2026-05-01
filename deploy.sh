#!/bin/bash
cd /opt/netdevops_project/NT132_Group4/

# 1. Kéo code mới nhất từ GitHub
git pull origin main

# 2. Chạy Ansible để cấu hình Web và Network
sudo ansible-playbook -i ansible/hosts ansible/deploy_web.yml

# 3. Chạy Python Test SSH và lưu Log
source /home/minhduc/venv/bin/activate
python3 python/test_ssh_router.py >> python/ssh_history.log