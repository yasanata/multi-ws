# TESTED
✅ Debian 10

# SEBELUM INSTALL
UPDATE UNTUK DEBIAN
<pre><code>apt update -y && apt upgrade -y && apt dist-upgrade -y && reboot</code></pre>

UPDATE UNTUK UBUNTU
<pre><code>apt update && apt upgrade -y && update-grub && sleep 2 && reboot</code></pre>

# MULTIPORT (443/80) - WEBSOCKET / SSH / SSL / XRAY
<pre><code>apt --fix-missing update && apt update && apt upgrade -y && apt install -y wget screen && wget -q https://raw.githubusercontent.com/yasanata/multi-ws/main/setup.sh && chmod +x setup.sh && screen -S setup ./setup.sh</code></pre>
