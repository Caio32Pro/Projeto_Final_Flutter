class Aparelho{
  late String nome;
  late int codAparelho;
  late String tipoMusculo;
  late String dificuldade;

  Aparelho({
    required this.nome,
    required this.codAparelho,
    required this.tipoMusculo,
    required this.dificuldade,
  });

  get getNome => nome;
  get getCodAparelho => codAparelho;
  get getTipoMusculo => tipoMusculo;
  get getDificldade => dificuldade;

  set setNome(String nome) => this.nome = nome;
  set setCodAparelho(int codAparelho) => this.codAparelho = codAparelho;
  set setTipoMusculo(String tipoMusculo) => this.tipoMusculo = tipoMusculo;
  set setDificldade(String dificldade) => this.dificuldade = dificldade;

}