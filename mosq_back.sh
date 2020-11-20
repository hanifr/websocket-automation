#!/bin/bash
    echo "[*] Starting mosquitto systemd service"
    sudo systemctl daemon-reload
    sudo systemctl reload mosquitto
    echo
    echo "Please restart the MQTT service \"systemctl restart mosquitto\" when new settings are applied"