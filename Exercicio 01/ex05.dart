void main(List<String> args) {
  var a = null;
  var b = 12;
  var res = a ?? b;
  print(res);
  // 12 porque o ?? é um operador ternario que opta pelo valor não nulo.
}
