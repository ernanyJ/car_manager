import 'package:supabase_flutter/supabase_flutter.dart';

class BrandRepository{

  final SupabaseClient supabase = Supabase.instance.client;

  Future<int> getBrandIdByName(String name) async {

    final data = await supabase.from('marca').select('id').eq('nome', name);
    return data[0]['id'];
  }


  
}