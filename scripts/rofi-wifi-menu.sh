#!/usr/bin/env bash

notify-send "Getting list of available Wi-Fi networks..."
# Get a list of available wifi connections and morph it into a nice-looking list
wifi_list=$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed 's/  */ /g' | sed -E "s/WPA*.?\S/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d")

connected=$(nmcli -fields WIFI g)
if [[ "$connected" =~ "enabled" ]]; then
	toggle="󰖪  Disable Wi-Fi"
elif [[ "$connected" =~ "disabled" ]]; then
	toggle="󰖩  Enable Wi-Fi"
fi

# Additional option for removing a connection
delete_option="  Delete Connection"

# Use rofi to select wifi network or the delete option
chosen_network=$(echo -e "$toggle\n$wifi_list\n$delete_option" | uniq -u | rofi -theme ~/.config/rofi/networkmenu.rasi -dmenu -i -selected-row 1 -p "Wi-Fi SSID: ")

# Get name of connection
chosen_id=$(echo "${chosen_network:3}" | xargs)

if [ "$chosen_network" = "" ]; then
	exit
elif [ "$chosen_network" = "󰖩  Enable Wi-Fi" ]; then
	nmcli radio wifi on
elif [ "$chosen_network" = "󰖪  Disable Wi-Fi" ]; then
	nmcli radio wifi off
elif [ "$chosen_network" = "$delete_option" ]; then
	# Get list of existing connections
	connection_list=$(nmcli -t -f NAME connection show)
	# Use rofi to select a connection to delete
	chosen_connection=$(echo "$connection_list" | rofi -theme ~/.config/rofi/networkmenu.rasi -dmenu -i -p "Select a connection to delete: ")

	# Delete the chosen connection
	if [ -n "$chosen_connection" ]; then
		nmcli connection delete "$chosen_connection" | grep "successfully" && notify-send "Connection Deleted" "Connection \"$chosen_connection\" has been deleted."
	fi
else

	# Message to show when connection is activated successfully
	success_message="You are now connected to the Wi-Fi network \"$chosen_id\"."
	# Get saved connections
	saved_connections=$(nmcli -g NAME connection)
	if [[ $(echo "$saved_connections" | grep -w "$chosen_id") = "$chosen_id" ]]; then
		nmcli connection up id "$chosen_id" | grep "successfully" && notify-send "Connection Established" "$success_message"
	else
		if [[ "$chosen_network" =~ " " ]]; then
			nmcli device wifi connect "$chosen_id" | grep "successfully" && notify-send "Connection Established" "$success_message"
		fi
		if [[ "$chosen_network" =~ "" ]]; then
			wifi_password=""
			while [[ -z "$wifi_password" ]]; do
				wifi_password=$(rofi -theme ~/.config/rofi/password.rasi -dmenu -p "Password: ")
				if [[ -n "$wifi_password" ]]; then
					nmcli device wifi connect "$chosen_id" password "$wifi_password" | grep "successfully" && notify-send "Connection Established" "$success_message"
					if [[ $? -ne 0 ]]; then
						notify-send "Connection Failed" "Failed to connect to Wi-Fi network. Please check your password and try again."
						wifi_password=""
					fi
				else
					exit
				fi
			done
		fi
	fi
fi
