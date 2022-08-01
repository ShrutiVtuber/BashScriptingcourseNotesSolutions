#!/bin/bash
function print_menu_selection(){
echo "Select one of the following: "
echo "1: Disk Usage"
echo "2: System Uptime"
echo "3: Active Users"
read -p "Which command should I run: (Enter q to quit.)" MENU_SELECTION
}
while [[ ${MENU_SELECTION} != "q" ]]
do
print_menu_selection	
case ${MENU_SELECTION} in
	1)
		# df command
		echo "Disk Usage:"
		df
		echo ""
	;;
	2)
		# uptime command
		echo "System Uptime:"
		uptime
		echo ""
	;;
	3)
		# who command
		echo "Number of Active Users:"
		who
		echo ""
	;;
	"q")
		# quit command
		echo "Goodbye!"
		echo ""
		exit 0
	;;
	*)
		echo "Invalid Option"
	;;
esac
done
