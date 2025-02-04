existe um script aqui nessa pasta que precisa ser feito o upload para a maquina vagrant

execute vagrant upload node-app para fazer o upload para a maquina vagrant(claro que depois que todo o servico estiver de pé)

em seguida executar o comando que foi criado no sonarqube
Exemplo:
sonar-scanner \
  -Dsonar.projectKey=node-app \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.token=sqp_b58fe1f0bb07e7e07e6917bc85f92b6fa34422b7

toda vez que desligar e ligar a maquina tem que entrar e iniciar o sonarqube com o comando
sudo su
systemctl status sonar.service
systemctl start sonar.service
ps aux | grep java
