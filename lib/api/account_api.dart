import 'package:http/http.dart' as http; // Alias

class AccountAPI {
  login(String email, String password) async{
    final  http.Response response = await http.post("https://reqres.in/api/login",
        body: {"email": email, "password": password});
    if(response.statusCode==200){
      print("Login OK");
    }else{
      print("StatusCode is ${response.statusCode}");
    }
  }
}
