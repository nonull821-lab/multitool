#!/bin/bash
#created by farion
clear
echo -ne "\e[34m"
echo '''
                         /$$   /$$     /$$         /$$                         /$$
                        | $$  | $$    |__/        | $$                        | $$
 /$$$$$$/$$$$  /$$   /$$| $$ /$$$$$$   /$$       /$$$$$$    /$$$$$$   /$$$$$$ | $$
| $$_  $$_  $$| $$  | $$| $$|_  $$_/  | $$      |_  $$_/   /$$__  $$ /$$__  $$| $$
| $$ \ $$ \ $$| $$  | $$| $$  | $$    | $$        | $$    | $$  \ $$| $$  \ $$| $$
| $$ | $$ | $$| $$  | $$| $$  | $$ /$$| $$        | $$ /$$| $$  | $$| $$  | $$| $$
| $$ | $$ | $$|  $$$$$$/| $$  |  $$$$/| $$        |  $$$$/|  $$$$$$/|  $$$$$$/| $$
|__/ |__/ |__/ \______/ |__/   \___/  |__/         \___/   \______/  \______/ |__/
     
'''
echo -ne "\e[00m"
echo "1> redact mac-addr			11> redacted"
echo "2> translate on base64			12> chmod on file (733)"
echo "3> nmap search    			13> ping-test"
echo "4> search on ip				14> list privacy dns"
echo "5> search on domen			15> generation qr-code"
echo "6> go fake exif info of photo"
echo "7> read exif-info photo"
echo "8> clear history"
echo "9> generation cards"
echo "10> generation"
echo "                                     00>выход"
read -p "choose> " user
case $user in 
00)
echo "goodbye!"
exit
1)
bash 'modules/MAC-addr.sh'
;;
2)
read -p "Enter text to encode to Base64> " basa
echo "$basa" | base64
read -p "press ENTER on exit . . .  "
;;
3)
read -p "input ip addr> " ipaddr
nmap -O -T4 $ipaddr
read -p "press ENTER on exit . . .  "
;;
4)
read -p "input ip> " ipaddres
curl ipinfo.io/$ipaddres
read -p "press ENTER on exit . . .  "
;;
5)
read -p "input domen> " domen
whois $domen
read -p "press ENTER on exit . . .  "
;;
6)
read -p "input path to photo (example: ~/photo/my_sister.jpg)> " photo
exiftool -Make="Apple" \
-Model="iPhone 17 Pro" \
-Software="iOS 19.2" \
-DateTimeOriginal="2026:02:24 23:15:04" \
-CreateDate="2026:02:24 23:15:04" \
-ModifyDate="2026:02:24 23:15:04" \
-GPSLatitude="55.7512" -GPSLatitudeRef="N" \
-GPSLongitude="37.6184" -GPSLongitudeRef="E" \
-overwrite_original "$photo"
read -p "press ENTER on exit . . .  "
;;
7)
read -p "input path to photo (example: ~/photo/my_sister.jpg)> " photoone
exiftool "$photoone"
read -p "press ENTER on exit . . .  "
;;
8)
history -c && history -w
echo "history clean"
read -p "press ENTER on exit . . .  "
;;
9)
bin=$((510000 + RANDOM % 90000))
part1=$((1000 + RANDOM % 9000))
part2=$((1000 + RANDOM % 9000))
part3=$((1000 + RANDOM % 9000))
mm=$((1 + RANDOM % 12))
yy=$((26 + RANDOM % 5))
cvv=$((100 + RANDOM % 899))
echo "Card: $bin$part1$part2$part3"
echo "card date: $mm/$yy"
echo "CVV: $cvv"
read -p "press ENTER on exit . . .  "
;;
10)
read -p "how gender? m/w: " pol
names_m=("Jack" "James" "Oliver" "Victor" "Isaac" "Ethan" "Nick")
names_f=("Anna" "Mary" "Helen" "Olivia" "Irene" "Taylor")
surnames=("Walker" "Pierce" "Stone" "Hunter" "Black" "Ford")
middle_m=("John" "David" "Alex" "Vincenzo" "Lee" "Elliot" "Nathan")
middle_f=("Jane" "Diana" "Rose" "Victoria" "Lynn" "Elizabeth" "Nicole")
#this is soft by farion
case $pol in
m|M)
echo "${surnames[$RANDOM % 6]} ${names_m[$RANDOM % 7]} ${patros_m[$RANDOM % 7]}"
;;
w|W)
echo "${surnames[$RANDOM % 6]}а ${names_f[$RANDOM % 6]} ${patros_f[$RANDOM % 6]}"
;;
esac
    read -p "press ENTER on exit . . .  "
;;
11)
    read -p "input name on hostname: " name
    sudo hostname "$name"
    echo "hostname redacted on: $name"
    read -p "press ENTER on exit . . .  "
    ;;
12)
read -p "input path to file (example: ~/photo/my_sister.sh)> " filechmod
chmod 733 $filechmod
read -p "press ENTER on exit . . .  "
;;
13)
echo "enter to packet on google, maybe take time 1-15 second"
ping -c 4 8.8.8.8 | tail -1 | awk '{print $4}' | cut -d '/' -f 2
echo 'this is your midl ping'
read -p "press ENTER on exit . . .  "
;;
14)
echo "list of dns:"
echo "1) 194.242.2.3 (mullvad dns)"
echo "2) 9.9.9.9 (Quad9 dns)"
echo "3) 1.1.1.1 (cloudfare dns)"
read -p "press ENTER on exit . . .  "
;;
15)
    echo "Input link on site of generation QR-code:"
    read text
    echo "$text" | qrencode -t ANSIUTF8
    echo "save file as PNG? (y/n)"
    read save
    [ "$save" = "y" ] && echo "$text" | qrencode -o "qr_$(date +%s).png" && echo "file save!"
;;
*)
echo "idk you input"
read -p "press ENTER on exit . . .  "
;;
esac
