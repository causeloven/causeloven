#!/bin/bash
curriencies=("USD" "EUR" "RUB")
while true; do
chosen_currency=$(zenity --entry --title="Выбор валюты" \
--text="Выберите валюту для получения кодировки или exit для выхода" \
--width=300)
if [ "$chosen_currency" == "exit" ] ; then
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
"RUB")
rate="1.00"
;;
*)
zenity --error --text="Неизвестная валюта"
continue
;;
esac
zenity --info --text="Котировка для валюты $chosen_currency: $rate"
done

