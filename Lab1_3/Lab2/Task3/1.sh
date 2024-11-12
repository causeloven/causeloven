#!/bin/bash

PRIGNAME=$(basename $0)
TITLE="System Information Report For $HOSTNAME"
CURRENT_TIME=$(date +"%x %r %z")
TIME_STAMP="Generated $CURRENT_TIME, BY $USER"
HTML_FILE="./html.html"


report_uptime () {
echo "<H2>System Uptime</H2>" >> "$HTML_FILE"
echo "<PRE>$(uptime)</PRE>" >> "$HTML_FILE"
}

report_disk_space (){
echo "<H2>Disk Space Utilization</H2>" >> "$HTML_FILE"
echo "<PRE>$(df -h)</PRE>" >> "$HTML_FILE"
}


report_hpme_space () {
if [[ $(id iu) -eq 0 ]]; then
echo "<H2>Home Space Utilization (All Users)</H2>" >> "$HTML_FILE"
echo "<PRE>$(du -sh /home/*)</PRE>" >> "$HTML_FILE"
else
echo "<H2>Home Space Utilization ($USER)</H2>" >> "$HTML_FILE"
echo "<PRE>$(du -sh $HOME)</PRE>" >> "$HTML_FILE"
fi
}



write_html_page () {
cat <<- _EOF_ > "$HTML_FILE"
<HTML>
<HEAD>
<TITLE>$TITLE</TITLE>
</HEAD>
<BODY>
<H1>$TITLE</H1>
<P>$TIME_STAMP</P>
_EOF_

if [[ $1 == "uptime" ]]; then
report_uptime
elif [[ $1 == "disk_space" ]]; then
report_disk_space
elif [[ $1 == "home_space" ]]; then
report_home_space
elif [[ $1 == "all" ]]; then
report_uptime
report_disk_space
report_home_space
fi

cat <<- _EOF_ >> "$HTML_FILE"
</BODY>
</HTML>
_EOF_

xdg-open "$HTML_FILE"
}

choice=$(zenity --list --title="System Information Report" \
--column="Choose action" \
--text="Выберите элементы из списка" \
"Report uptime" \
"Report a disk space" \
"Report home space" \
"View all the information" \
"EXIT")

case $choice in
"Report uptime")
write_html_page "uptime"
;;
"Report a disk space")
write_html_page "disk_space"
;;
"Report home space")
write_html_page "home_space"
;;
"View all the information")
write_html_page "all"
;;
"EXIT")
echo "Exiting program"
exit 0
;;
*)
echo "Invalid option. Exiting"
exit 1
;;
esac





