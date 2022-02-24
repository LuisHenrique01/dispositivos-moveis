int multiplicacao(List<int> lista) {
  int multi = 1;
  lista.forEach((element) {
    multi *= element;
  });
  return multi;
}

void main() {
  List<int> lista = [1, 2, 3, 4, 5];
  print(multiplicacao(lista));
}
