import 'package:car_manager/entities/driver.dart';
import 'package:car_manager/entities/vehicle.dart';
import 'package:car_manager/repositories/secretary_repository.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VehicleRepository {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> getCars() async {
    final data = await supabase.from('card').select();
    return data;
  }

  Future<Vehicle?> getCarById(var id) async {
    if (id.runtimeType == int) {
      final data = await supabase.from('card').select().eq('carro_id', id);
      final car = Vehicle.fromJson(data[0]);
      return car;
    }
  }

  Future<List<String>> getBrandsAsList() async {
    final brands = await supabase.from('marca').select();
    List<String> nomes = [];
    for (final map in brands) {
      String nome = map['nome'];

      nomes.add(nome);
    }

    // Retorna a lista de nomes
    return nomes;
  }

  addModel(int modelId, int brandId, String placa, String secretariaId,
      String quilometragem) async {
    final repo = SecretaryRepository();
    final secretary = await repo.getSecretaryByName(secretariaId);
    await supabase.from('carro').insert({
      'modelo_id': modelId,
      'placa': placa,
      'secretaria_id': secretary,
      'quilometragem': quilometragem,
      'consumo_medio': 12.3
    });
  }
}
