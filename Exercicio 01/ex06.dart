void main(List<String> args) {
  int nota1 = 8;
  int nota2 = 4;
  int nota3 = 6;
  var media = (nota3 + nota2 + nota1) / 3;
  if (media >= 7) {
    print('Aprovado');
  }
  if (media < 4) {
    print('Reprovado');
  }
  if (media >= 4 && media < 7) {
    print('Prova final');
  }
}
