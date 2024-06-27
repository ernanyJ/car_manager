class Vehicle {
  late int id;
  late int modelo_id;
  late String placa;
  late bool disponivel;
  late int secretaria_id;
  //late String? img;
  late double quilometragem;

  Vehicle(
      {required this.id,
      required this.modelo_id,
      required this.placa,
      required this.disponivel,
      required this.secretaria_id,
     // this.img,
      required this.quilometragem});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelo_id = json['modelo_id'];
    placa = json['placa'];
    disponivel = json['disponivel'];
    secretaria_id = json['secretaria_id'];
    // if (img != null) {
    //   img = json['img'];
    // }

    quilometragem = json['quilometragem'];
  }
}
