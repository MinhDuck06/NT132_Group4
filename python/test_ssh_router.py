from netmiko import ConnectHandler

gateway_device = {
    'device_type': 'linux',
    'host': '192.168.224.10',  # IP quản trị trên card ens33
    'username': 'minhduc',       # Tên user 
    'password': 'minhduc', # Mật khẩu 
}

try:
    print(f"--- Đang kết nối SSH tới Gateway ({gateway_device['host']})... ---")
    connection = ConnectHandler(**gateway_device)
    output = connection.send_command("ip -br addr show")
    
    print("--- Kết nối thành công! Trạng thái các cổng Router: ---")
    print(output)
    connection.disconnect()

except Exception as e:
    print(f"--- Lỗi kết nối: {e} ---")