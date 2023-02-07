#!/bin/bash

# Reglas del juego.
echo "Bienvenido al juego de los puñitos."
echo "==================================="

echo "Menu:"
echo "1. Se intentará descubrir el numero de piedras al menos de un jugador."
echo "2. Habrá 2 intentos para adivinar."
echo "3. Habrá 20 piedras como máximo."
echo "4. Se puede elegir un máximo de 5 jugadores."
echo "==================================="
# Entrada al juego.
read -p "¿Deseas jugar (S/N)?: " comienzo

while [ $comienzo == 'S' ] || [ $comienzo == 'N' ];
do
if [ $comienzo == 'S' ]
    then
    echo "Has aceptado jugar."
    jugar=true

while [ $jugar == true ];
do 
    read -p "Introduce un número de jugadores (máximo 5): " jugadores

    if [ $jugadores -gt 5 ]; 
        then
            echo "El numero de jugadores debe ser menor o igual a 5."
            exit 1
    fi

    read -p "Introduce un número límite de piedras (mín. 1 / máx. 20): " piedras

    if [ $piedras -lt 1 ] || [ $piedras -gt 20 ];
        then 
            echo "El número mínimo debe ser entre 1 y 20"
            exit 1
    fi

    sum=0
    for(( i = 1; i <= $jugadores; i++ ));
    do 
        random=$((RANDOM % $piedras +1))
        numJugador[$i]=$random
        sum=$((sum + random))
    done
echo "================"
echo " Primer Intento "
echo "================"
echo "Adivina los números individuales de los jugadores: "
correcto=0

for(( i = 1; i <= $jugadores; i++ ));
do
    read -p "Jugador $i: " adivinar 
    if [ $adivinar -eq ${numJugador[$i]} ];
        then
            correcto=$((correcto+1))
    fi
done

if [ $correcto -gt $((jugadores % 2)) ]; 
    then
        echo "¡Felicidades has ganado!"
    else 
        echo "Lo siento, has perdido."
fi
echo "================="
echo " Segundo Intento "
echo "================="
read -p "Adivina la suma de los números: " adivinar_suma

if [ $adivinar_suma -eq $sum ];
    then
        echo "¡Felicidades! Has acertado la suma de los números."
    else 
        echo "Lo siento, has perdido en el segundo intento."
fi


read -p "¿Quieres volver a jugar?(S/N):" comienzo

 if [ $comienzo == 'S' ]
    then
    echo "Has aceptado volver a jugar."
 elif [ $comienzo == 'N' ]
    then
    echo "No has aceptado volver a jugar. Vuelve pronto!"
    exit
fi
   
while [ $comienzo != 'S' ] && [ $comienzo != 'N' ]
do
    echo "Error, debes introducir (S / N). Gracias."
    read -p "¿Deseas jugar (S/N)?: " comienzo
done

done

elif [ $comienzo == 'N' ]
then
    echo "No has aceptado a jugar. Vuelve pronto!"
    exit
fi
done