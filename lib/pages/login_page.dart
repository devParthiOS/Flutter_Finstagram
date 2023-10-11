import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late double _deviceWidth;
  late double _deviceHeight;
  String? _email;
  String? _password;

  GlobalKey<FormState> _loginState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: uiBuilder(),
      ),
    );
  }

  Widget uiBuilder() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _deviceHeight * 0.05),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          // Childrens of column.
          children: [
            titleWidget(),
            formFieldsWidget(),
            loginButton(),
            registerPageLink()
          ],
        ),
      ),
    );
  }

  Widget titleWidget() {
    return const Text(
      "Finstagram",
      style: TextStyle(
        fontSize: 30,
      ),
    );
  }

  Widget formFieldsWidget() {
    return Form(
        key: _loginState,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _emailFormField(),
            _passwordFormField(),
          ],
        ));
  }

  Widget _emailFormField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "Email"),
      onSaved: (value) {
        setState(() {
          _email = value;
        });
      },
      validator: (value) {
        var regex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
        bool isValid = value!.contains(RegExp(regex));

        return isValid ? null : "Please enter valid email.";
      },
    );
  }

  Widget _passwordFormField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(hintText: "Password"),
      onSaved: (value) {
        setState(() {
          _password = value;
        });
      },
      validator: (value) => value!.length > 6
          ? null
          : "please enter password greater than 6 char",
    );
  }

  Widget registerPageLink() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "register");
      },
      child: const Text(
        "Don't have an account?",
        style: TextStyle(
          fontWeight: FontWeight.w200,
          fontSize: 15,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget loginButton() {
    return MaterialButton(
      onPressed: () {
        _loginUser();
      },
      minWidth: _deviceWidth * 0.70,
      height: _deviceHeight * 0.06,
      color: Colors.red,
      child: const Text(
        "Login",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  void _loginUser() {
    debugPrint("${_loginState.currentState!.validate()}");
    if (_loginState.currentState!.validate()) {
      _loginState.currentState!.save();
    }
  }
}
