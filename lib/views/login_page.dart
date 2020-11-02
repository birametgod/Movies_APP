import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_app/widgets/tmdb_form_field.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController;
  TextEditingController passwordController;
  String email;
  String password;
  FocusNode _node;
  FocusNode _emailFocusNode;
  FocusNode _passwordNode;
  bool _focused = false;
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _node = FocusNode();
    _passwordNode = FocusNode();
    _emailFocusNode = FocusNode();
    _node.addListener(_handleFocusChange);

  }

  void _handleFocusChange() {
    print(_node.hasFocus);
    if (_node.hasFocus != _focused) {
      setState(() {
        _focused = _node.hasFocus;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    _emailFocusNode.dispose();
    passwordController.dispose();
    _passwordNode.dispose();
    _node.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          key: _formKey,
          child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/original/SnXUdLT7AyZWoeaINVGYJ0xg5U.jpg'),
                fit: BoxFit.cover)),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.black.withAlpha(0),
                Color(0xFF2C2C2C),
                Color(0xFF2C2C2C),
              ])),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.transparent),
                ),
                Column(
                  children: [
                    Hero(
                      tag: 'logo',
                      child: Container(
                          child: Image.asset('assets/images/logo.png'),
                          height: 200.0
                      ),
                    ),
                    TmdbFormField(
                        controller: emailController,
                        hintText: 'Test',
                        inputAction: TextInputAction.next,
                        focusNode: _emailFocusNode,
                        isEmail: true,
                        validator: (String value) {
                          emailController.text = value;
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = new RegExp(pattern);
                          if (!regex.hasMatch(value))
                            return 'Enter Valid Email';
                          else
                            return null;
                        },
                      fieldSubmit: (_) {
                          FocusScope.of(context).requestFocus(_passwordNode);
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TmdbFormField(
                      controller: passwordController,
                      hintText: 'Password',
                      inputAction: TextInputAction.next,
                      focusNode: _passwordNode,
                      isPassword: true,
                      validator: (value) {
                        passwordController.text = value;
                        if(value.isEmpty){
                          return 'Please enter some text';
                        } else if (value.length > 6) {
                          return '6 characters';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    if( _formKey.currentState.validate() ){
                      email = emailController.text;
                      password = passwordController.text;
                      try{
                        final userLogin = await _auth.signInWithEmailAndPassword(email: email, password: password);
                        if(userLogin != null) {
                          Navigator.pushNamed(context, '/home');
                        }
                      } catch(e) {
                        print(e);
                        print('email or password invalid');
                      }
                    }
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.orange[200],
                      ),
                      child: Text(
                        "LOGIN",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: Colors.black),
                      )),
                ),
              ],
            ),
          ),
      ),
    ),
        ));
  }

}
