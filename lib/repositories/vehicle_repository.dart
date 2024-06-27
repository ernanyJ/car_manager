import 'package:car_manager/entities/driver.dart';
import 'package:car_manager/entities/vehicle.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VehicleRepository {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>?> getVehicleById(int id) async {
    try {
      List<Map<String, dynamic>> vehicle =
          await supabase.from('carro').select().eq('id', id);
          return vehicle;
    } on Exception {
      print('error');
    }
    return null;
  }
}
