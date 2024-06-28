import 'package:car_manager/entities/driver.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepository {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<Driver?> getUserByLogin(String login) async {
    List<Map<String, dynamic>> drivers =
        await supabase.from('condutor').select().eq('login', login);
    var car = Driver.fromJson(drivers[0]);
    return car;
  }
}
