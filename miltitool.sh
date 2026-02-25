echo "Hallo!"
echo "1> смена мак адреса"
echo "2> переводчик в base64"
echo "3> nmap разведка"
echo "4> пробив по ip"
echo "5> пробив по домену"
echo "6> подделать exif данные фото"
echo "7> прочитать exif данные фото"
echo "8> очистить историю"
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
read -p "введите путь к фотке (пример: /home/photo/my_sister.jpg/)> " photo
exiftool -Make="Apple" \
-Model="iPhone 17 Pro" \
-Software="iOS 19.2" \
-DateTimeOriginal="2026:02:24 23:15:04" \
-CreateDate="2026:02:24 23:15:04" \
-ModifyDate="2026:02:24 23:15:04" \
-GPSLatitude="55.7512" -GPSLatitudeRef="N" \
-GPSLongitude="37.6184" -GPSLongitudeRef="E" \
-overwrite_original '$photo'
read -p "нажмите ENTER что бы выйти . . . "
;;
7)
read -p "введите путь к фото (пример: /home/photo/my_sister.jpg/)> " photoone
exiftool '$photoone'
read -p "нажмите ENTER что бы выйти . . . "
;;
8)
history -c && history -c
read -p "нажмите ENTER что бы выйти . . . "
;;
*)
echo "я вас не понял"
read -p "нажмите ENTER что бы выйти . . . "
;;
esac
