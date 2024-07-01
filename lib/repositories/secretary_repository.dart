import 'package:supabase_flutter/supabase_flutter.dart';

class SecretaryRepository {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<String>> getAllSecretaries() async {
    final secretaries = await supabase.from('secretaria').select();
    List<String> list = [];

    for (final secretary in secretaries) {
      String sec = secretary['nome'];
      list.add(sec);
    }

    return list;
  }

  Future<String> getSecretaryByName(String name) async {
    final sec = await supabase.from('secretaria').select();
    for (var i in sec) {
      if (i['name'] == name) {
        return i['id'];
      }
    }
    return '';
  }
}
