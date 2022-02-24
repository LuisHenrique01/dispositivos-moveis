int elevacao(int base, int expo) {
  int total = 1;
  for (var i = 0; i < expo; i++) {
    total *= base;
  }
  return total;
}

void main(List<String> args) {
  print(elevacao(4, 4));
}
