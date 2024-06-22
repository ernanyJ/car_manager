import 'package:car_manager/constants/auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VehicleController {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> getBrands() async {
    final data = await supabase.from('modelo').select('nome');
    return data;
  }
}
