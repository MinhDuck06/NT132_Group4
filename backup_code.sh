#!/bin/bash

# --- CẤU HÌNH BIẾN ---
SOURCE_DIR="/opt/netdevops_project/NT132_Group4"
BACKUP_DIR="/opt/netdevops_project/backups"
TIME=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="NT132_Group4_backup_$TIME.tar.gz"

# --- THỰC THI ---
echo ">>> Đang bắt đầu quy trình sao lưu mã nguồn..."

# 1. Tạo thư mục backup nếu chưa tồn tại
if [ ! d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    echo "Đã tạo thư mục lưu trữ: $BACKUP_DIR"
fi

# 2. Thực hiện nén dữ liệu (loại bỏ thư mục venv hoặc các file log lớn nếu cần)
tar -czvf "$BACKUP_DIR/$BACKUP_NAME" \
    --exclude="$SOURCE_DIR/.git" \
    --exclude="$SOURCE_DIR/python/__pycache__" \
    "$SOURCE_DIR"

# 3. Kiểm tra kết quả
if [ $? -eq 0 ]; then
    echo "--------------------------------------------------"
    echo "✅ SAO LƯU THÀNH CÔNG!"
    echo "Tên file: $BACKUP_NAME"
    echo "Vị trí: $BACKUP_DIR"
    echo "Dung lượng: $(du -h "$BACKUP_DIR/$BACKUP_NAME" | cut -f1)"
    echo "--------------------------------------------------"
else
    echo "❌ LỖI: Quy trình sao lưu thất bại."
fi