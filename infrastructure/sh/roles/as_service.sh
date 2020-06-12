echo "\n\nend   #####################################  $(whoami) in $(pwd) --> . ./roles/as_service.sh"

echo """
# service

[Unit]
Description=$MY_PROJECT_NAME
After=docker.service
Requires=docker.service

[Service]
Type=simple
TimeoutStartSec=0
User=master
Restart=always
ExecStartPre=-/usr/bin/docker exec %n stop
ExecStartPre=-/usr/bin/docker rm %n
ExecStart=docker-compose -p MY_PROJECT_NAME -f /home/$MY_USER/$MY_PROJECT_NAME/docker-compose.yml up --build -d
ExecStop=docker-compose -p MY_PROJECT_NAME -f /home/$MY_USER/$MY_PROJECT_NAME/docker-compose.yml down

[Install]
WantedBy=multi-user.target
""" > /etc/systemd/system/$MY_PROJECT_NAME.service

sudo chmod 644 /etc/systemd/system/$MY_PROJECT_NAME.service

echo "\n\nend   #####################################  $(whoami) in $(pwd) --> . ./roles/as_service.sh"
