import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DriverRepository {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<DropdownMenuItem<Text>>> getAllDrivers() async {
    var data = await supabase.from('condutor').select();

    List<DropdownMenuItem<Text>> li = [];
    for (int i = 0; i < data.length; i++) {
      var b = DropdownMenuItem<Text>(child: Text(data[i]['login']));
      li.add(b);
    }
    if (li.isEmpty) {
      li.add(DropdownMenuItem<Text>(child: Text('vazio')));
      return li;
    }
    return li;
  }
}
