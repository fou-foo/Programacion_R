
frio <- function(x)
{
  # Funcion para el caso en que la adivinanza es muy grande 
  # la agregue para poder extender lo que puede hacer el juego
  print('Frío')
}

caliente <- function(x)
{
  print('Caliente')
}

Hot.Cool <- function(numero, guess)
{
  # Funcion para simular un juego
  if(numero!=guess)
  {
    dif <- abs(numero - guess)
    if(dif > 20)
    {
      res <- mapply(frio, 1:(dif))  #utilice 'mapply' en lugar de 'for' porque el examen es de R
                                    #no de otro lenguaje, en esta linea tengo confucion si se debe de imprimir solo '(numero- adivinanza)' o '((numero- adivinanza)- 20)' como dice el enunciado
    } else{
    res <- mapply(caliente, 1:(dif)) #utilice 'mapply' en lugar de 'for' porque el examen es de R no de otro lenguaje
    }   
  } 
  return(res)
}


main <- function()
{
  # funcion para simular todo el juego 
  while(guess!=numero)
  {
    res <- Hot.Cool(numero, guess)
    res
    print("Adivina el número generado (introduce el número y preciona enter dos veces):")
    guess <- scan()
  }
  print("Felicidades ganaste!")
}

#comienza el juego 
set.seed(0)
numero <- sample(1:100, 1)
print("Adivina el número generado (introduce el número y preciona enter dos veces):")
guess <- scan() #hay que voltear a ver la consola para introducir el numero 
# guess <- 10   para probar el programa
main()
