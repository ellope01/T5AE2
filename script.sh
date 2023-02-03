#!/bin/bash
echo "Bienvenido al juego de los puñitos."
echo "==================================="

echo "Comenzaremos con LAS NORMAS e INSTRUCCIONES:"
echo "1. Se intentará descubrir el numero de piedras al menos de un jugador."
echo "2. Habrá 5 intentos, si se acierta superior a 3 intentos se gana y menos de 3 intentos pierdes."
echo "3. Habrá 20 piedras como máximo"

read -p "¿Deseas jugar (S/N)?: " comienzo
if [ $comienzo = 'S' ]
then
echo ""
 jugar_de_nuevo=true

while [$jugar_de_nuevo==true];do 
echo " Introduce el número de jugadores (máximo 5): "
read jugadores

if [ $jugadores -gt 5 ]; then
echo "El numero de jugadores debe ser menor o igual a 5."
exit 1
fi
echo "Introduce el número límite de piedras/(entre 1 y 20):"
read piedras

if [$piedras -lt 1]||[$piedras -gt 20];
then 
echo "El número minimo debe ser entre 1 y 20"
exit 1
fi

sum=0
for((i=1;i<=$jugadores;i++));do 
random=$((RANDOM%limit +1))
numero_jugador[$i]=$random
sum=$((sum + random))
done

echo "Adivina los números individuales de los jugadores:"
correcto=0
for((i=1;i<=$jugadores;i++));do
echo "Jugador $i:"
read adivinar 
if [$adivinar -eq ${numero_jugador[$i]}];then
correcto=$((correcto+1))
fi
done

if [$correcto -gt $((jugadores%2))]; then
echo "Has ganado"
else 
echo "Perdiste"
fi
 
echo "Adivina la suma de los números:"
read adivinar_suma

if [$adivinar_suma -eq $sum];then
echo "Has ganado"
else 
echo "Has perdido"
fi
echo "¿Quieres volver a jugar?(S/N):"
read jugar_otra_vez

if [$jugar_otra_vez == "S"];
then 
jugar_de_nuevo=true
else 
jugar_de_nuevo=false
echo "¡Gracias por jugar! Por favor, ejecuta el programa otra vez para volver a jugar."
done 
fi