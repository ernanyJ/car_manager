class Driver {
  late int id;
  late String login;
  late String password;
  late String nome;
  late String cargo;
  late int idSecretary;

  Driver(
      {required this.id,
      required this.login,
      required this.password,
      required this.nome,
      required this.cargo,
      required this.idSecretary});

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    password = json['password'];
    nome = json['nome'];
    cargo = json['cargo'];
    idSecretary = json['id_sec'];
  }
}
