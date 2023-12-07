import 'dart:convert';

import 'package:crona_virus/Model/world_states_model.dart';
import 'package:crona_virus/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices{
  Future<WorldStatesModel> fetchWorldStatesRecord() async{

    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body.toString());
      return WorldStatesModel.fromJson(data);
    }else{
      throw Exception("Error");
    }
  }
}