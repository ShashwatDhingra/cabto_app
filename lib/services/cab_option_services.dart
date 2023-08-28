import 'dart:convert';

import 'package:cabto_app/models/cab_option.dart';
import 'package:cabto_app/services/utils/app_url.dart';
import 'package:http/http.dart' as http;

class CabOptionService
{
  Future<List<CabOptionModel>> getCabOptions() async
  {
    try{
      final response = await http.get(Uri.parse(cabOptionUrl)).timeout(Duration(seconds: 10));

      List<CabOptionModel> cabOptions = [];

      if(response.statusCode == 200)
      {
        var data = jsonDecode(response.body.toString());

        for(Map item in data)
        {
          cabOptions.add(CabOptionModel.fromJson(item));
        }
      }

      return cabOptions;
    }
    catch(e)
    {
      throw Exception('Error in Fetch Dat');
    }
  }
}