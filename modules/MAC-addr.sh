#!/bin/bash
#soft by farion
# Проверка наличия macchanger
if ! command -v macchanger &> /dev/null; then
    echo "Установите macchanger: sudo apt install macchanger"
    exit 1
fi

# Проверка интерфейса
INTERFACE="enp3s0"  # У тебя проводной интерфейс
if ! ip link show $INTERFACE &> /dev/null; then
    echo "Интерфейс $INTERFACE не найден!"
    exit 1
fi
echo '●▬▬▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬●'
echo '░░░░░░░░░░░░░░░Hello! ░░░░░░░░░░░░░░'
echo '●▬▬▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬●'
echo "[1] redacted Mac-addr of you"
echo "[2] redacted Mac-addr of random"
echo "[3] redacted Mac-addr of random-real"
echo "[4] redacted Mac-addr of change in a cycle"
echo "[4] redacted Mac-addr of real-random, change in a cycle"
echo "[6] chow current MAC"
echo "[7] redacted hostname"
echo "[8] redacted Mac-addr on wifi-adapter"
read -p "Выбор -> " user_input

case $user_input in
    1)
        read -p "Введите MAC-адрес (XX:XX:XX:XX:XX:XX)> " mac
        sudo macchanger -m $mac $INTERFACE
        read -p "mac addr successfully redacted! Press ENTER to exit . . ."
        ;;
    2)
        sudo macchanger -r $INTERFACE
        read -p "mac addr successfully redacted! Press ENTER to exit . . ."
        ;;
    3)
        sudo macchanger -a $INTERFACE
	read -p "mac addr successfully redacted! Press ENTER to exit . . ."
        ;;
    4)
        read -p "input interval (on second)> " whosleep
        trap 'echo -e "\n exit to cycle"; exit 0' INT  # Обработка Ctrl+C
        while true; do
            clear
            echo "[cycle] redacted mac-addr of random..."
            sudo macchanger -r $INTERFACE
            sleep $whosleep
        done
        ;;
    5)
        read -p "input interval (on second)> " whosleep1
        trap 'echo -e "\nexit to cycle"; exit 0' INT
        while true; do
            clear
            echo "[cycle] redacted mac-addr of random-real..."
            sudo macchanger -a $INTERFACE
            sleep $whosleep1
        done
        ;;
    6)
        echo "current MAC:"
        ip link show $INTERFACE | grep ether
        ;;
7)
    read -p "input name of hostname: " name
    sudo hostname "$name"
    echo "hostname redacted on: $name"
    read -p "Press ENTER to exit . . ."
    ;;
8)
read -p "input mac-addr> " adddr
read -p "input name you WI-FI adapter (of ip a)> " nameobject
sudo ip link set dev $nameobject down
sudo ip link set dev $nameobject address $adddr
sudo ip link set dev $nameobject up
read -p "Press ENTER to exit . . ."
;;
    *)
        echo "not true input!"
        ;;
esac
