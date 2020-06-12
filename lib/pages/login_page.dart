
import 'package:fluteter_app_prueba/utils/dialogs.dart';
import 'package:fluteter_app_prueba/widget/my_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static final routeName = 'login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode _focusNodePassword = FocusNode();
  GlobalKey<FormState> _formKey = GlobalKey();

  String _email = ' ', _password = ' ';


  _submit() async {
    final bool isValid = _formKey.currentState.validate();
    if(isValid && _email == 'matias@gmail.com' && _password == '123456') {
      // una llamada a un servicio de rest  para consumir un servicio de autenticacion
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("wasLogin", true);
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }else{
      await Dialogs.alert(context, title: "Error", body: "El email o contraseña es incorrecto");
    }
  }

  String _validateEmail(String email){
    if(email.isNotEmpty && email.contains("@")){
      _email= email;
      print(_email);
      return null;
    }
    return "Invalid Email";
  }

  String _validatePassword(String password){
    if(password.isNotEmpty && password.length >5){
      _password = password;
      print(_password);
      return null;
    }
    return "Invalid Password";
  }
  @override
  void dispose() {
    _focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(body: SafeArea(child: Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(child: Container(
        height: 900,
        child:  Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 300, minWidth: 200,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Image.network('https://placeholder.com/wp-content/uploads/2018/10/placeholder.com-logo4.png'),
                    SizedBox(height: 40,),
                    // es mas facil describir la logica textFormField que textFied
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "example@gmail.com",
                        labelText: "E-mail",
                        prefixIcon: Container(
                          width: 70,
                          height: 40,
                          padding: EdgeInsets.all(10),
                          child: SvgPicture.asset('assets/icons/gmail.svg'),
                        ),
                        /*prefixIcon: Icon(Icons.email)*//*, errorText: _errorEmail*/),
                      keyboardType: TextInputType.emailAddress,
                      keyboardAppearance: Brightness.light,
                      textInputAction: TextInputAction.next,
                      /*onChanged: (String text){
                      _email = text;
                    },*/
                      validator: _validateEmail,
                      onFieldSubmitted: (String text){ //Se usa en vez onSubmitted
                        _focusNodePassword.nextFocus();
                      },
                    ),
                    /*TextField(
                    decoration: InputDecoration(hintText: "example@gmail.com", labelText: "E-mail", errorText: _errorEmail),
                    keyboardType: TextInputType.emailAddress,
                    keyboardAppearance: Brightness.light,
                    textInputAction: TextInputAction.next,
                    onChanged: (String text){
                      _email = text;
                    },
                    onSubmitted: (String text){
                      _focusNodePassword.nextFocus();
                    },
                  ),*/
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "*******",
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))/*, errorText: _errorPassword*/),
                      obscureText: true,
                      textInputAction: TextInputAction.send,
                      focusNode: _focusNodePassword,
                      /*onChanged: (String text){
                      _password = text;
                    },*/
                      validator: _validatePassword,
                      onFieldSubmitted: (String text){
                        _submit();
                      },
                    ),
//                  TextField(
//                    decoration: InputDecoration(hintText: "*******", labelText: "Password", errorText: _errorPassword),
//                    obscureText: true,
//                    textInputAction: TextInputAction.send,
//                    focusNode: _focusNodePassword,
//                    onChanged: (String text){
//                      _password = text;
//                    },
//                    onSubmitted: (String text){
//                      _submit();
//                    },
//                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: Text("Recuperar Contraseña"),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(width: 1, color: Colors.blue)),
                            ),),
                          onPressed: (){},
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    MyBtn(
                      fullWidth: true,
                      label: "Ingresar",
                      onPressed: _submit,
                      backgroundColor: Color(0xff6A1B9A),
                      textColor: Colors.white,
                    ),
                    SizedBox(height: 30,),
                    Text("O inicia con"),
                    SizedBox(height: 10,),
                    Row(children: <Widget>[
                      Expanded(child:  MyBtn(
                        fullWidth: true,
                        label: "Facebook",
                        onPressed: (){},
                        backgroundColor: Color(0xff0D47A1),
                        textColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                      ),),
                      SizedBox(width: 10,),
                      Expanded(child:  MyBtn(
                        fullWidth: true,
                        label: "Google",
                        onPressed: (){},
                        backgroundColor: Color(0xffF50057),
                        textColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                      ),),
                    ],),
                  ],
                ),
              )
          ),
          SizedBox(height: 30,)
        ],
      ),)),

    )),);
  }
}
