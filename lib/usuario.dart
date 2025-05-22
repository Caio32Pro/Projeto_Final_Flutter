class Usuario {
  late String nome;
  late String email;
  late String senha;

  Usuario({required this.nome, required this.email, required this.senha});

  get getNome => nome;
  get getEmail => email;
  get getSenha => senha;

  set setNome(String nome) => this.nome = nome;
  set setEmail(String email) => this.email = email;
  set setSenha(String senha) => this.senha = senha;
}