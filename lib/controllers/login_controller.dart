import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<bool> authDriver(String login, String pass) async {
    final drivers = await supabase.from('condutor').select('login, senha');

    return checkCredentials(login, pass, drivers);
  }
  
  Future<bool> authAdm(String login, String pass) async {
    final drivers = await supabase.from('adm').select('login, senha');

    return checkCredentials(login, pass, drivers);
  }

  bool checkCredentials(String login, String pass, var drivers) {
    for (int i = 0; i < drivers.length; i++) {
      if (drivers[i]['login'] == login && drivers[i]['senha'] == pass) {
        return true;
      }
    }
    return false;
  }
}
