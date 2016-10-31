fun factorial(numero: Int) -> Int{
  if numero == 1{
    return 1
  } else{
    return numero * factorial(numero-1)
  }
}
