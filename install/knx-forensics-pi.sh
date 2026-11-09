#!/bin/sh
# KNX Forensics Collector auf einem Raspberry Pi (Pi 4/5, 64-Bit Raspberry Pi OS) oder einem anderen Linux-Rechner einrichten.
# Aufruf auf dem Pi:  sh install-pi.sh
# Installiert Docker aus den Paketquellen (falls nötig) und startet den Collector dauerhaft (auch nach Neustart).
set -e
IMAGE=ghcr.io/wagramio/knx-forensics-collector:latest
DATA=/var/lib/knx-forensics
if ! command -v docker >/dev/null 2>&1; then
  echo "Docker wird installiert …"
  sudo apt-get update && sudo apt-get install -y docker.io
fi
sudo mkdir -p "$DATA"
sudo docker pull "$IMAGE"
sudo docker rm -f knx-forensics >/dev/null 2>&1 || true
sudo docker run -d --name knx-forensics --restart unless-stopped --network host \
  -v "$DATA:/data" -e TZ="$(cat /etc/timezone 2>/dev/null || echo Europe/Vienna)" "$IMAGE"
IP=$(hostname -I | awk '{print $1}')
echo ""
echo "KNX Forensics läuft. Im Browser öffnen:  http://$IP:8780"
echo "Aktualisieren: dieses Skript erneut ausführen."
