#!/bin/bash

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
echo '░░░░░░░░░░░░░░░ДОБРО ПОЖАЛОВАТЬ ░░░░░░░░░░░░░░'
echo '●▬▬▬▬▬▬▬▬▬▬▬▬▬ஜ۩۞۩ஜ▬▬▬▬▬▬▬▬▬▬▬▬▬●'
echo "[1] сменить на конкретный MAC-адрес"
echo "[2] сменить на случайный MAC-адрес"
echo "[3] сменить на случайный правдоподобный MAC-адрес"
echo "[4] сменить на случайный MAC-адрес в цикле"
echo "[5] сменить на правдоподобный MAC-адрес в цикле"
echo "[6] Показать текущий MAC"
echo "[7] Подделать имя пользователя"
echo "[8] Подделать MAC аддрес вай фай адаптера на конкретный"
read -p "Выбор -> " user_input

case $user_input in
    1)
        read -p "Введите MAC-адрес (XX:XX:XX:XX:XX:XX)> " mac
        sudo macchanger -m $mac $INTERFACE
        ;;
    2)
        sudo macchanger -r $INTERFACE
        read -p "MAC-адрес успешно сменился! Нажмите ENTER для продолжения..."
        ;;
    3)
        sudo macchanger -a $INTERFACE
        read -p "MAC-адрес успешно сменился! Нажмите ENTER для продолжения..."
        ;;
    4)
        read -p "Введите интервал (в секундах)> " whosleep
        trap 'echo -e "\nВыход из цикла"; exit 0' INT  # Обработка Ctrl+C
        while true; do
            clear
            echo "[Цикл] Смена MAC на случайный..."
            sudo macchanger -r $INTERFACE
            sleep $whosleep
        done
        ;;
    5)
        read -p "Введите интервал (в секундах)> " whosleep1
        trap 'echo -e "\nВыход из цикла"; exit 0' INT
        while true; do
            clear
            echo "[Цикл] Смена MAC на правдоподобный..."
            sudo macchanger -a $INTERFACE
            sleep $whosleep1
        done
        ;;
    6)
        echo "Текущий MAC:"
        ip link show $INTERFACE | grep ether
        ;;
7)
    read -p "Введите имя для Wi-Fi: " name
    sudo hostname "$name"
    echo "Имя хоста изменено на: $name"
    echo "Запомните: также смените MAC-адрес"
    read -p "Нажмите ENTER чтобы выйти> . . . "
    ;;
8)
read -p "Введите mac аддрес устроиства> " adddr
sudo ip link set dev wlx8c86dd47bdbc down
sudo ip link set dev wlx8c86dd47bdbc address $adddr
sudo ip link set dev wlx8c86dd47bdbc up
read -p "Нажмите ENTER чтобы выйти> . . . "
;;
    *)
        echo "Неверный выбор!"
        ;;
esac
