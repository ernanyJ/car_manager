class Driver {
  late int id;
  late String login;
  late String password;
  late String nome;
  String? cargo;
  late int idSecretary;
  late bool disponivel;
  Driver(
      {required this.id,
      required this.login,
      required this.password,
      required this.nome,
      this.cargo,
      required this.idSecretary,
      required this.disponivel
      });

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    password = json['senha'];
    nome = json['nome'];
    if (json['cargo'] != null) {
      this.cargo = json['cargo'];
    }
    disponivel = json['disponivel'];
    idSecretary = json['sec_id'];
    disponivel = json['disponivel'];
  }
}
