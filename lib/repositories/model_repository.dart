import 'package:supabase_flutter/supabase_flutter.dart';

class ModelRepository {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List> getModels() async {
    return await supabase.from('modelo').select();
  }
}
