int soma(List<int> lista) {
  int sum = 0;
  lista.forEach((element) {
    sum += element;
  });
  return sum;
}

int multiplicacao(List<int> lista) {
  int multi = 1;
  lista.forEach((element) {
    multi *= element;
  });
  return multi;
}

int execute(List<int> lista, Function(List<int>) funcao) {
  return funcao(lista);
}

void main() {
  List<int> lista = [1, 2, 3, 4, 5];
  print(execute(lista, soma));
  print(execute(lista, multiplicacao));
}
