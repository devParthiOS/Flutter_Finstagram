import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late double _deviceWidth;
  late double _deviceHeight;
  GlobalKey<FormState> _registerState = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _password;
  File? _imageFile;

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
      padding: EdgeInsets.symmetric(
        horizontal: _deviceWidth * 0.05,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            titleWidget(),
            profileImageWidget(),
            regiterFormWidget(),
            registerbutton(),
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

  Widget profileImageWidget() {
    var image = _imageFile != null
        ? FileImage(_imageFile!)
        : const NetworkImage("https://i.pravatar.cc/300");
    return GestureDetector(
      onTap: () {
        FilePicker.platform.pickFiles(type: FileType.image).then((result) {
          setState(() {
            if (result != null) {
              _imageFile = File(result.files.first.path!);
            } else {
              // User canceled the picker
            }
          });
        });
      },
      child: Container(
        height: _deviceHeight * 0.15,
        width: _deviceHeight * 0.15,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: image as ImageProvider,
          ),
        ),
      ),
    );
  }

  Widget regiterFormWidget() {
    return Container(
      height: _deviceHeight * 0.30,
      child: Form(
        key: _registerState,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _nameFormField(),
            _emailFormField(),
            _passwordFormField(),
          ],
        ),
      ),
    );
  }

  Widget registerbutton() {
    return MaterialButton(
      onPressed: () {
        _registerUser();
      },
      minWidth: _deviceWidth * 0.70,
      height: _deviceHeight * 0.06,
      color: Colors.red,
      child: const Text(
        "Register",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
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
          : "please enter passwaord greater than 6 char",
    );
  }

  Widget _nameFormField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "Name"),
      onSaved: (value) {
        setState(() {
          _name = value;
        });
      },
      validator: (value) => value!.length > 0 ? null : "please enter name",
    );
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

  void _registerUser() {
    if (_registerState.currentState!.validate() && _imageFile != null) {
      _registerState.currentState?.save;
      print("Success");
    } else {
      print("Faliur");
    }
  }
}
