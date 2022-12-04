double suma(a, b) {
  return a + b;
}

double restar(a, b) {
  return a - b;
}

double multiplicar(a, b) {
  return a * b;
}

double dividir(a, b) {
  return a * b;
}

List dividir_texto(String a) {
  List lista = [];

  String cadena = "";
  a.runes.forEach((int rune) {
    var character = new String.fromCharCode(rune);
    if (rune >= 42 && rune <= 47) {
      lista.add(int.parse(cadena));
      lista.add(character);
      cadena = "";
    } else {
      cadena += character;
    }
  });
  lista.add(int.parse(cadena));

  return lista;
}
