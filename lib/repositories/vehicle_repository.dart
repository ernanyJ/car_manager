import 'package:car_manager/entities/driver.dart';
import 'package:car_manager/entities/vehicle.dart';
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
}
