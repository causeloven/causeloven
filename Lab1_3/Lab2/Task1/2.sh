#!/bin/bash
name=$(zenity --entry --title="Запрос имени" --text="Введите ваше имя:")
if [ $? -eq 1 ]; then
echo "Пользователь отменил ввод"
exit 1
fi
profession=$(zenity --entry --title="Запрос профессии" --text="Введите вашу профессию:")
if [ $? -eq 1 ]; then
echo "Пользователь отменил ввод"
exit 1
fi
zenity --info --title="Результат" --text="Имя: $name\nПрофессия: $profession"
