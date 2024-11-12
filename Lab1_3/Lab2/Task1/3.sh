#!/bin/bash
curriencies=("USD" "EUR" "BYN")
chosen_currency=$(zenity --list --title="Выбор валюты" \
--column="Валюта" "${curriencies[@]}" \
--height=250 --width=300 \
--text="Выберите валюту для получения кодировки")
if [ -z "$chosen_currency" ]; then
zenity --error --text="Вы не выбрали валюту"
exit 1
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
exit 1
;;
esac
zenity --info --text="Котировка для валюты $chosen_currency: $rate"
