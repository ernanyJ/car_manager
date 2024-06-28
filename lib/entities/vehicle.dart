class Vehicle {
  late int id;
  late String marca;
  late String modelo;
  late String placa;
  late String disponivel;
  late String secretaria;
  late String? img;
  late int quilometragem;

  Vehicle(
      {required this.id,
      required this.modelo,
      required this.placa,
      required this.disponivel,
      required this.secretaria,
      // this.img,
      required this.quilometragem});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['carro_id'];
    marca = json['marca'];
    modelo = json['modelo'];
    placa = json['placa'];
    quilometragem = json['km'];
    img = json['img'];
    disponivel = json['disponibilidade'];
    secretaria = json['sec'];
  }
}
