int soma(List<int> lista) {
  int sum = 0;
  lista.forEach((element) {
    sum += element;
  });
  return sum;
}

void main() {
  List<int> lista = [1, 2, 3, 4, 5];
  print(soma(lista));
}
