import 'package:car_manager/entities/driver.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepository{
  
    final SupabaseClient supabase = Supabase.instance.client;

  Future<Driver?> getUserByLogin(String login) async {
    
    List<Map<String, dynamic>> drivers = await supabase.from('condutor').select().eq('login', login);

    for(int i = 0; i < drivers.length; i++){
      if(drivers[i]['login'] == login){
        return Driver.fromJson(drivers[i]);
      }
    }
    return null;
  }

}