#!/bin/bash
if zenity --question --text="Вы хотите продолжить?";
then
if zenity --question --text="Вы уверены?";
then
zenity --info --text="Вы выбрали да дважды!"
else
zenity --info --text="Вы выбрали нет на втором диалоге"
fi
else
zenity --info --text="Вы выбрали нет на первом диалоге"
fi
