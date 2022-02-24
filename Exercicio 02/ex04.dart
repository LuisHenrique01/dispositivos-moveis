import 'dart:math';

int elevacao(int base, int expo) {
  return pow(base, expo) as int;
}

var elevacaoArrow = (int base, int expo) => pow(base, expo) as int;

void main(List<String> args) {
  print(elevacao(4, 4));
  print(elevacaoArrow(4, 4));
}
