import 'package:supabase_flutter/supabase_flutter.dart';

class VehicleController {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> getCars() async {
    final data = await supabase.from('card').select();
    return data;
  }
}
