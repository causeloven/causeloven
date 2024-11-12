#!/bin/bash
curriencies=("USD" "EUR" "BYN")
while true; do
chosen_currency=$(zenity --list --title="Выбор валюты" \
--column="Валюта" "${curriencies[@]}" "exit" \
--height=250 --width=300 --ok-label="Выбрать")
if [ "$chosen_currency" == "exit" ] || [ -z "$chosen_currency" ]; then
zenity --info --text="Вы не выбрали валюту"
break
fi
case "$chosen_currency" in
"USD")
rate="75.50"
;;
"EUR")
rate="90.25"
;;
"BYN")
rate="1.00"
;;
*)
zenity --error --text="Неизвестная валюта"
exit 1
;;
esac
zenity --info --text="Котировка для валюты $chosen_currency: $rate"
done
