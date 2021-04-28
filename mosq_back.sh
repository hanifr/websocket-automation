#!/bin/bash
    echo "[*] Starting mosquitto systemd service"
    sudo setfacl -R -m u:mosquitto:rX /etc/letsencrypt/{live,archive}
    sudo systemctl daemon-reload
    sudo systemctl reload mosquitto
    echo
    echo "Please restart the MQTT service \"systemctl restart mosquitto\" when new settings are applied"