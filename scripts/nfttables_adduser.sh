#!/bin/bash

# Создание пользователя damask с домашней директорией, если он не существует
if ! id "damask" &>/dev/null; then
    sudo useradd -m -s /bin/bash damask
    echo "Пользователь damask создан с домашней директорией"
else
    echo "Пользователь damask уже существует"
fi
# Создание группы damask, если она не существует
if ! getent group "damask" &>/dev/null; then
    sudo groupadd damask
    echo "Группа damask создана"
else
    echo "Группа damask уже существует"
fi
# Добавление пользователя damask в группу damask
sudo usermod -aG damask damask
echo "Пользователь damask добавлен в группу damask"
# Настройка директории .ssh для пользователя damask
sudo mkdir -p /home/damask/.ssh
sudo chown damask:damask /home/damask/.ssh
sudo chmod 700 /home/damask/.ssh
echo "Настройка пользователя damask завершена"
# Очистка текущих правил
sudo iptables -F
# Разрешение локального трафика
sudo iptables -A INPUT -i lo -j ACCEPT
# Разрешение SSH, HTTP и HTTPS трафика
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 2221 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 2220 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
# Разрешение трафика на указанных портах для eth1
#sudo iptables -A INPUT -i eth1 -p tcp -s $eth_ip -m multiport --dports 22,443,8080,80,7,47100,47500,11211,10800 -j ACCEPT
#sudo iptables -A INPUT -i eth1 -p tcp -s $eth_ip -m multiport --dports 2221,2220 -j ACCEPT
# Разрешение трафика на указанных портах для specific_ip
sudo iptables -A INPUT -p tcp -s 127.0.0.1 -m multiport --dports 22,80,443 -j ACCEPT
sudo iptables -A INPUT -p tcp -s 127.0.0.1 -m multiport --dports 2221,2220 -j ACCEPT
# Разрешение установленных соединений
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
# Блокировка всех входящих соединений по умолчанию
sudo iptables -P INPUT DROP
# Блокировка всех пересылаемых соединений по умолчанию
sudo iptables -P FORWARD DROP
echo "Настройка iptables завершена"
