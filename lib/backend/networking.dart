import 'dart:convert';

import 'package:http/http.dart' as http;
class Networking {
  final String uri;
  Networking({required this.uri});
  Future getData()async{
    http.Response response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200){
      String data = response.body;
      //print(data);
      return jsonDecode(data);
    }else{
      print('I am here');
      print(response.statusCode);
    }
  }

}