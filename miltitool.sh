# created by farion
echo "Hallo!"
echo "1> смена мак адреса"
echo "2> переводчик в base64"
echo "3> nmap разведка"
echo "4> пробив по ip"
echo "5> пробив по домену"
echo "6> подделать exif данные фото"
echo "7> прочитать exif данные фото"
echo "8> очистить историю"
echo "9> генератор карт"
echo "10> генератор личностей"
read -p "выбирай> " user
case $user in 
1)
bash 'MAC-addr.sh'
;;
2)
read -p "введите что перевести> " basa
echo "$basa" | base64
read -p "нажмите ENTER что бы выйти . . . "
;;
3)
read -p "введите IP адрес> " ipaddr
nmap -O -T4 $ipaddr
read -p "нажмите ENTER что бы выйти . . . "
;;
4)
read -p "введите ip> " ipaddres
curl ipinfo.io/$ipaddres
read -p "нажмите ENTER что бы выйти . . . "
;;
5)
read -p "введите домен> " domen
whois $domen
read -p "нажмите ENTER что бы выйти . . . "
;;
6)
read -p "введите путь к фотке: " photo
exiftool -Make="Apple" \
-Model="iPhone 17 Pro" \
-Software="iOS 19.2" \
-DateTimeOriginal="2026:02:24 23:15:04" \
-CreateDate="2026:02:24 23:15:04" \
-ModifyDate="2026:02:24 23:15:04" \
-GPSLatitude="55.7512" -GPSLatitudeRef="N" \
-GPSLongitude="37.6184" -GPSLongitudeRef="E" \
-overwrite_original "$photo"
read -p "нажмите ENTER что бы выйти . . . "
;;
7)
read -p "введите путь к фото: " photoone
exiftool "$photoone"
read -p "нажмите ENTER что бы выйти . . . "
;;
8)
history -c && history -w
echo "история очищена"
read -p "нажмите ENTER что бы выйти . . . "
;;
9)
bin=$((510000 + RANDOM % 90000))
part1=$((1000 + RANDOM % 9000))
part2=$((1000 + RANDOM % 9000))
part3=$((1000 + RANDOM % 9000))
mm=$((1 + RANDOM % 12))
yy=$((26 + RANDOM % 5))
cvv=$((100 + RANDOM % 899))
echo "Карта: $bin$part1$part2$part3"
echo "Срок: $mm/$yy"
echo "CVV: $cvv"
read -p "нажмите ENTER что бы выйти . . . "
;;
10)
read -p "какой пол? м/ж: " pol
names_m=("Иван" "Дмитрий" "Олег" "Виктор" "Илья" "Елисей" "Никита")
names_f=("Анна" "Мария" "Елена" "Ольга" "Ирина" "Татьяна")
surnames=("Иванов" "Петров" "Сидоров" "Кузнецов" "Смирнов" "Попов")
patros_m=("Иванович" "Дмитриевич" "Олегович" "Викторович" "Ильич" "Елисеевич" "Никитич")
patros_f=("Ивановна" "Дмитриевна" "Олеговна" "Викторовна" "Ильинична" "Елисеевна" "Никитична")

case $pol in
м|М)
echo "${surnames[$RANDOM % 6]} ${names_m[$RANDOM % 7]} ${patros_m[$RANDOM % 7]}"
;;
ж|Ж)
echo "${surnames[$RANDOM % 6]}а ${names_f[$RANDOM % 6]} ${patros_f[$RANDOM % 6]}"
;;
esac
read -p "нажмите ENTER что бы выйти . . . "
;;
*)
echo "я вас не понял"
read -p "нажмите ENTER что бы выйти . . . "
;;
esac
