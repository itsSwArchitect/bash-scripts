#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m' # No color

# Clear screen and show main menu
function show_menu() {
    clear
    echo -e "${CYAN}========= ⚙️  System Initialization Menu =========${NC}"
        echo -e "                                                           "
    echo -e "  1) 🖥️  Change Hostname"
        echo -e "                                                           "
    echo -e "  2) 🌐 Set Timezone"
        echo -e "                                                           "
    echo -e "  3) 🈯  Configure Locale"
        echo -e "                                                           "
    echo -e "  4) 🔄 Set APT Mirror"
        echo -e "                                                           "
    echo -e "  5) 🚪 Exit"
        echo -e "                                                           "
    echo -e "${CYAN}===============================================${NC}"
}

# Change hostname
function change_hostname() {


    echo -e "${CYAN}===============================================${NC}"
    echo -e "${RED}YOU CAN CLOSE IT ANY TIME BY PRESSING CONTROL+C"
    echo -e "${CYAN}===============================================${NC}"
    echo -e "${CYAN}===============================================${NC}"
    echo -e "                                                           "
    echo -e "${YELLOW}🖥️  Current hostname: $(hostname)${NC}"
    read -rp "Enter new hostname: " new_hostname
    if [[ -n "$new_hostname" ]]; then
        sudo hostnamectl set-hostname "$new_hostname"
        echo -e "${GREEN}✅ Hostname changed to $new_hostname${NC}"
    else
        echo -e "${RED}❌ Invalid input. Hostname not changed.${NC}"
    fi
    read -rp "Press Enter to continue..."
}

# Set timezone with paging
function set_timezone() {
    local page=0
    local per_page=20
    local total_zones
    mapfile -t zones < <(timedatectl list-timezones)
    total_zones=${#zones[@]}
    total_pages=$(( (total_zones + per_page - 1) / per_page ))

    while true; do
        clear
        current_zone=$(timedatectl show -p Timezone --value)

    echo -e "${CYAN}===============================================${NC}"
    echo -e "${RED}YOU CAN CLOSE IT ANY TIME BY PRESSING CONTROL+C"
    echo -e "${CYAN}===============================================${NC}"
    echo -e "${CYAN}===============================================${NC}"
    echo -e "                                                           "

	echo -e "${CYAN}🌐 Set Timezone${NC}"
        echo -e "📍 Current timezone: ${YELLOW}${current_zone}${NC}\n"
        echo -e "${CYAN}Available Timezones [Page $((page+1))/$total_pages]:${NC}"

        start=$((page * per_page))
        end=$((start + per_page))
        if (( end > total_zones )); then end=$total_zones; fi

        for ((i = start; i < end; i++)); do
            printf " %3d) %s\n" $((i + 1)) "${zones[$i]}"
        done

        echo ""
        read -rp "Select timezone number or press [n]=next, [p]=prev, [q]=quit: " choice

        case "$choice" in
            n|N) ((page < total_pages - 1)) && ((page++)) ;;
            p|P) ((page > 0)) && ((page--)) ;;
            q|Q) break ;;
            ''|*[!0-9]*) echo -e "${RED}❌ Invalid input.${NC}" && sleep 1 ;;
            *)
                index=$((choice - 1))
                if (( index >= 0 && index < total_zones )); then
                    confirm_zone="${zones[$index]}"
                    read -rp "❓ Set timezone to ${confirm_zone}? (y/n): " confirm
                    if [[ "$confirm" =~ ^[Yy]$ ]]; then
                        sudo timedatectl set-timezone "$confirm_zone"
                        echo -e "${GREEN}✅ Timezone set to $confirm_zone${NC}"
                        sleep 1
                        break
                    else
                        echo -e "${YELLOW}⏩ Timezone not changed.${NC}"
                        sleep 1
                    fi
                else
                    echo -e "${RED}❌ Invalid selection.${NC}"
                    sleep 1
                fi
                ;;
        esac
    done
}

# Set locale
function set_locale() {

    echo -e "${CYAN}===============================================${NC}"
    echo -e "${RED}YOU CAN CLOSE IT ANY TIME BY PRESSING CONTROL+C"
    echo -e "${CYAN}===============================================${NC}"
    echo -e "${CYAN}===============================================${NC}"
    echo -e "								"
    echo -e "								"
    echo -e "${CYAN}🈯 Available locales:${NC}"
    locale -a | grep -v "^C$" | grep -v "^POSIX$" | nl -w2 -s") "
    echo ""
    read -rp "Enter locale to set (e.g., en_US.UTF-8): " new_locale
    if locale -a | grep -q "^$new_locale$"; then
        sudo update-locale LANG="$new_locale"
        echo -e "${GREEN}✅ Locale set to $new_locale${NC}"
    else
        echo -e "${RED}❌ Locale not found.${NC}"
    fi
    read -rp "Press Enter to continue..."
}

# Set apt mirror
function set_apt_mirror() {
    echo -e "${CYAN}===============================================${NC}"
    echo -e "${RED}YOU CAN CLOSE IT ANY TIME BY PRESSING CONTROL+C"
    echo -e "${CYAN}===============================================${NC}"
    echo -e "${CYAN}===============================================${NC}"
    echo -e "                                                           "
    	echo -e "${YELLOW}🔄 Current mirror: $(grep '^deb ' /etc/apt/sources.list | head -n 1 | awk '{print $2}')${NC}"
    read -rp "Enter new APT mirror URL (e.g., http://archive.ubuntu.com/ubuntu): " new_mirror

    if [[ -n "$new_mirror" ]]; then
        sudo sed -i "s|http[s]\?://[^ ]*|$new_mirror|g" /etc/apt/sources.list
        echo -e "${GREEN}✅ Mirror updated to $new_mirror${NC}"
        sudo apt update
    else
        echo -e "${RED}❌ Invalid input. Mirror not changed.${NC}"
    fi
    read -rp "Press Enter to continue..."
}

# Main loop
while true; do
    show_menu
    read -rp "Select an option [1-5]: " opt
    case $opt in
        1) change_hostname ;;
        2) set_timezone ;;
        3) set_locale ;;
        4) set_apt_mirror ;;
        5) echo -e "${GREEN}👋 Exiting...${NC}"; exit 0 ;;
        *) echo -e "${RED}❌ Invalid option.${NC}"; sleep 1 ;;
    esac
done
