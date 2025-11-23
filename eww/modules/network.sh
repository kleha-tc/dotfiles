#!/bin/sh

# ▼ 設定: Wi-Fiインターフェース名 (ip link で確認してください。 wlan0 や wlan1 など)
WLAN_IF="wlan0"

# ------------------------------------------
# 1. 有線 (Ethernet) チェック
# ------------------------------------------
# /sys/class/net/e* (enp3s0等) の operstate が "up" か確認
ETH_STATUS=$(cat /sys/class/net/e*/operstate 2>/dev/null)

if [ "$ETH_STATUS" = "up" ]; then
    echo '{"icon": "󰈀", "text": "Ethernet", "class": "ethernet"}'
    exit 0
fi

# ------------------------------------------
# 2. Wi-Fi (iwd) チェック
# ------------------------------------------
# iwctl の出力を変数に格納 (何度もコマンドを叩かないため)
# 出力例:
#   State             connected
#   Connected network MyHomeWiFi
#   RSSI              -54 dBm
raw_output=$(iwctl station "$WLAN_IF" show)

# ステータスの取得
state=$(echo "$raw_output" | grep "State" | awk '{print $2}')

if [ "$state" != "connected" ]; then
    echo '{"icon": "󰌙", "text": "Disconnected", "class": "disconnected"}'
    exit 0
fi

# SSIDの取得 (スペースを含むSSIDに対応)
# awk を使って3番目のフィールドから末尾まで取得し、trim処理
ssid=$(echo "$raw_output" | awk '/Connected network/ {$1=$2=""; print $0}' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

# RSSI (信号強度 dBm) の取得 (-50 とか -80 とか)
rssi=$(echo "$raw_output" | grep "RSSI" | awk '{print $2}' | head -n1)

# ------------------------------------------
# 3. dBm をアイコンに変換するロジック
# ------------------------------------------
# 一般的な目安: -50以上:最強, -60:快適, -70:普通, -80:弱い
# 数値比較のため整数化 (awkが確実)
icon="󰤩"
if [ -z "$rssi" ]; then
    icon="󰤩" # 取得失敗時
else
    # シェルの数値比較は負の数だと面倒なことがあるので awk で判定
    idx=$(awk -v r="$rssi" 'BEGIN {
        if (r >= -50) print 0;
        else if (r >= -60) print 1;
        else if (r >= -70) print 2;
        else if (r >= -80) print 3;
        else print 4;
    }')
    
    # アイコン配列 (Full, High, Mid, Low, Empty)
    icons=("󰤨" "󰤥" "󰤢" "󰤟" "󰤯") 
    
    icon=${icons[$idx]}
fi

echo "{\"icon\": \"$icon\", \"text\": \"$ssid\", \"class\": \"wifi\"}"
