import 'package:http/http.dart' as http; // Alias
import 'dart:convert';
class AccountAPI {
  Future<bool> login(String email, String password) async{
    final  http.Response response = await http.post("https://reqres.in/api/login",
        body: {"email": email, "password": password});
    if(response.statusCode==200) {
      final dynamic parsed = jsonDecode(response.body);
      print("Login OK ${parsed["token"]}");
      return true;
    }
    /*}else{
      //print("StatusCode is ${response.statusCode}");
    }*/
    return false;
  }
}
