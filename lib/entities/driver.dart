import 'package:car_manager/controllers/vehicle_controller.dart';
import 'package:car_manager/entities/vehicle.dart';
import 'package:car_manager/repositories/vehicle_repository.dart';

class Driver {
  late int id;
  late String login;
  late String password;
  late String nome;
  String? cargo;
  int? veiculo;
  late int idSecretary;
  late bool disponivel;

  Driver({
    required this.id,
    required this.login,
    required this.password,
    required this.nome,
    this.cargo,
    //  this.veiculoAtribuido,
    required this.idSecretary,
    required this.disponivel,
  });

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    password = json['senha'];
    nome = json['nome'];
    cargo = json['cargo'];
    veiculo = json['veiculo_atribuido'];
    disponivel = json['disponivel'];
    idSecretary = json['sec_id'];
  }


 
}
