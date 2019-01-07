#! /bin/sh

BOLD="\e[1m"
NOBOLD="\e[21m"
LIGHT_GREEN="\e[92m"
NC="\e[39m"

echo -e "${BOLD}${LIGHT_GREEN}"
echo "================================================="
echo "Installing stuff..."
echo "================================================="
echo -e "${NOBOLD}${NC}"

pacman -S --noconfirm docker ubridge
systemctl start docker
pip install gns3-gui gns3-server SIP pyqt5

echo
echo
echo -e "${BOLD}${LIGHT_GREEN}"
echo "All done! You ca now run gns3 to start!"
echo -e "${NOBOLD}${NC}"
