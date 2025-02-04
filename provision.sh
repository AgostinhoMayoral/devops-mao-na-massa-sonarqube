##/usr/bin/bash
apt update
apt install wget unzip openjdk-17-jdk openjdk-17-jre -y
apt install wget unzip -y
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-10.7.0.96327.zip
unzip sonarqube-10.7.0.96327.zip -d /opt/
mv /opt/sonarqube-10.7.0.96327 /opt/sonarqube
groupadd sonar
useradd -g sonar -d /opt/sonarqube -s /bin/false sonar
chown -R sonar:sonar /opt/sonarqube
touch /etc/systemd/system/sonar.service
echo > /etc/systemd/system/sonar.service
cat <<EOT >> /etc/systemd/system/sonar.service
[Unit]
Description=Sonarqube service
After=syslog.target network.target
[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonar
Group=sonar
Restart=always
[Install]
WantedBy=multi-user.target
EOT
service sonar start

#instalar sonar scanner

wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-6.2.1.4610-linux-x64.zip
unzip sonar-scanner-cli-6.2.1.4610-linux-x64.zip -d /opt/
sudo mv /opt/sonar-scanner-6.2.1.4610-linux-x64 /opt/sonar-scanner
groupadd sonar
useradd -g sonar -d /opt/sonar-scanner -s /bin/false sonar
chown -R sonar:sonar /opt/sonar-scanner
echo 'export PATH=$PATH:/opt/sonar-scanner/bin' | sudo tee -a /etc/profile
sudo apt update
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
sudo apt install nodejs -y
node -v




#token sonarqube gerado 30dias sqp_7ffe073ba38ec425d0146c345117046d14a59295



#sqp_b58fe1f0bb07e7e07e6917bc85f92b6fa34422b7


#sonar-scanner \
#  -Dsonar.projectKey=node-app \
#  -Dsonar.sources=. \
#  -Dsonar.host.url=http://localhost:9000 \
#  -Dsonar.token=sqp_b58fe1f0bb07e7e07e6917bc85f92b6fa34422b7