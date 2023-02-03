#!/bin/bash
echo "Bienvenido al juego de los puñitos."
echo "==================================="

echo "Comenzaremos con LAS NORMAS e INSTRUCCIONES:"
echo "1. Se intentará descubrir el numero de piedras al menos de un jugador."
echo "2. Habrá 5 intentos, si se acierta superior a 3 intentos se gana y menos de 3 intentos pierdes."
echo "3. Habrá 20 piedras como máximo"

read -p "¿Deseas jugar (S/N)?: " comienzo
while [ $comienzo=='S' ] || [ $comienzo=='N' ];
do
if [ $comienzo=='S' ]
    then
    echo "Has aceptado jugar."
    jugar=true
while [ $jugar==true ];
do 
    read -p " Introduce un número de jugadores (máximo 5): " jugadores

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
    for(( i=1; i<=$jugadores; i++ ));
    do 
        random=$((RANDOM % $piedras +1))
        numJugador[$i]=$random
        sum=$((sum + random))
    done

echo "Adivina los números individuales de los jugadores:"
correcto=0
for(( i=1; i<=$jugadores; i++ ));
do
    read -p "Jugador $i: " adivinar 
    if [ $adivinar -eq ${numJugador[$i]} ];
        then
            correcto=$((correcto+1))
    fi
done

if [ $correcto -gt $((jugadores%2)) ]; 
    then
        echo "¡Felicidades has ganado!"
    else 
        echo "Lo siento, has perdido."
fi
 
read -p "Adivina la suma de los números:" adivinar_suma

if [ $adivinar_suma -eq $sum ];
    then
        echo "¡Felicidades has ganado!"
    else 
        echo "Lo siento, has perdido."
fi


read -p "¿Quieres volver a jugar?(S/N):" jugar_otra_vez

# Bucle de volver a jugar.
while [ $jugar_otra_vez=='S' ] || [ $jugar_otra_vez=='N' ];
do
 if [ $jugar_otra_vez=='S' ]
    then
    echo "Has aceptado volver a jugar."
    $comienzo

 elif [ $jugar_otra_vez=='N' ]
    then
    echo "No has aceptado volver a jugar. Vuelve pronto!"
    exit
 fi
done
    echo "Error, debes introducir (S / N). Gracias."
    exit   

done
# Bucle de Fin y No de jugar.
elif [ $comienzo=='N' ]
then
    echo "No has aceptado a jugar. Vuelve pronto!"
    exit
fi
done
    echo "Error, debes introducir (S / N). Gracias."
    exit