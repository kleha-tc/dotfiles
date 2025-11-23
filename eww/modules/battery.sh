#!/bin/sh

# acpiコマンドの出力を取得 (例: "Battery 0: Discharging, 75%, 02:30:00 remaining")
# head -n1 はバッテリーが複数ある場合の対策
ACPI_OUTPUT=$(acpi -b | head -n1)

# 1. ステータスとパーセントの抽出 (awkなどを使用)
# カンマ区切りで抽出。パーセントの "%" を削除。
PERCENT=$(echo "$ACPI_OUTPUT" | grep -oP '\d+%' | tr -d '%')

# ステータス判定 (Chargingが含まれているか)
if [[ "$ACPI_OUTPUT" == *"Charging"* ]]; then
    STATUS="Charging"
else
    STATUS="Discharging"
fi

# 2. アイコン定義 (0-19%, 20-39%, 40-59%, 60-79%, 80-99%, 100%)
ICONS=("󰂎" "󰁻" "󰁽" "󰁿" "󰂁" "󰁹")

# 3. ロジック
if [ "$STATUS" = "Charging" ]; then
    ICON="󰂄"
    CLASS="charging"
else
    # 20で割る計算ロジック（前回と同じ）
    INDEX=$(( PERCENT / 20 ))
    [ "$INDEX" -gt 5 ] && INDEX=5
    ICON=${ICONS[$INDEX]}
    
    if [ "$PERCENT" -le 20 ]; then
        CLASS="critical"
    else
        CLASS="normal"
    fi
fi

# 4. (オマケ) 残り時間の抽出
# "Discharging, 75%, 02:30:00 remaining" -> "02:30:00" を抜き出す
TIME_REMAINING=$(echo "$ACPI_OUTPUT" | awk '{print $5}') 

# 5. JSON出力
# tooltip に残り時間を入れると便利です
echo "{\"icon\": \"$ICON\", \"percent\": \"$PERCENT\", \"class\": \"$CLASS\", \"tooltip\": \"$PERCENT% - $TIME_REMAINING\"}"
