import 'package:UpTech/models/user/auth_methods.dart';
import 'package:UpTech/tool/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final birthcontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final confirmcontroller = TextEditingController();

  bool _passVisibility = true;
  bool _confirmVisibility = true;

  String? emailValidate;
  String? nameValidate;
  String? birthValidate;
  String? mobileValidate;
  String? passValidate;
  String? confirmValidate;

  DateTime _chosenDateTime = DateTime(2000, 01, 01);

  void _showDatePicker(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) => Container(
              height: 320,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        minimumYear: 1900,
                        maximumYear: DateTime.now().year - 10,
                        maximumDate: DateTime.now(),
                        initialDateTime: _chosenDateTime,
                        onDateTimeChanged: (val) {
                          setState(() {
                            _chosenDateTime = val;
                          });
                        }),
                  ),
                  CupertinoButton(
                    child: const Text('OK'),
                    onPressed: () => {
                      birthcontroller.text =
                          '${_chosenDateTime.day}/${_chosenDateTime.month}/${_chosenDateTime.year}',
                      Navigator.of(ctx).pop()
                    },
                  )
                ],
              ),
            ));
  }

  void _signUp() async {
    if(namecontroller.text.isEmpty) {
      nameValidate = 'This field is not empty!';
    } else {
      nameValidate = null;
    }

    if(birthcontroller.text.isEmpty) {
      birthValidate = 'This field is not empty!';
    } else {
      birthValidate = null;
    }

    if(mobilecontroller.text.isEmpty) {
      mobileValidate = 'This field is not empty!';
    } else {
      mobileValidate = null;
    }

    if(emailcontroller.text.isEmpty) {
      emailValidate = 'This field is not empty!';
    } else {
      if(!Utils.isEmail(emailcontroller.text)) {
        emailValidate = "Not correct format email";
      } else {
        emailValidate = null;
      }
    }

    if(passcontroller.text.isEmpty) {
      passValidate = 'This field is not empty!';
    } else {
      passValidate = null;
    }

    if (confirmcontroller.text.isEmpty) {
      confirmValidate = 'This field is not empty!';
    } else {
      if(passcontroller.text.isNotEmpty) {
        if(confirmcontroller.text != passcontroller.text) {
          confirmValidate = 'Not match password';
        } else {
          confirmValidate = null;
        }
      } else {
        confirmValidate = null;
      }
    }

    if (nameValidate != null
        || birthValidate != null
        || mobileValidate != null
        || emailValidate != null
        || passValidate != null
        || confirmValidate != null
    ) {
      setState(() {});
    } else {
      setState(() {});
      String result = await AuthMethods().signUpUser(
          name: namecontroller.text,
          email: emailcontroller.text,
          password: passcontroller.text,
          phone: mobilecontroller.text,
          birthDay: _chosenDateTime!.microsecondsSinceEpoch
      );
      SnackBar snackBar = SnackBar(
        content: Text(result.toString()),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      if (result == 'success') {
        Navigator.pop(context);
      }
    }

  }

  OutlineInputBorder borderFocus(){ //return type is OutlineInputBorder
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.red));
  }

  OutlineInputBorder borderEnabled(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.blue));
  }

  OutlineInputBorder borderError(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
            color: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.focused)
                ? Colors.red
                : Colors.blue
            )));
  }

  Widget titleWidget(String title) {
    return Padding(
        padding: EdgeInsets.only(bottom: 8),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          textAlign: TextAlign.start,
        )
    );
  }

  @override
  void initState() {
    birthcontroller.text = '${_chosenDateTime.day}/${_chosenDateTime.month}/${_chosenDateTime.year}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      controller: emailcontroller,
      cursorColor: Colors.red,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          prefixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? Colors.red
                  : Colors.blue),
          filled: true,
          fillColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? Colors.red.withOpacity(0.1)
                  : Colors.blue.withOpacity(0.1)),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email Here",
          errorText: emailValidate,
          errorBorder: borderError(),
          border: borderEnabled(),
          focusedBorder: borderFocus(),
          enabledBorder: borderEnabled()),
    );

    final name = TextField(
      obscureText: false,
      controller: namecontroller,
      cursorColor: Colors.red,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_box),
          prefixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? Colors.red
                  : Colors.blue),
          filled: true,
          fillColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? Colors.red.withOpacity(0.1)
                  : Colors.blue.withOpacity(0.1)),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Name Here",
          errorText: nameValidate,
          errorBorder: borderError(),
          border: borderEnabled(),
          focusedBorder: borderFocus(),
          enabledBorder: borderEnabled()),
    );

    final birthDay = GestureDetector(
      onTap: () => {_showDatePicker(context)},
      child: TextField(
        obscureText: false,
        controller: birthcontroller,
        cursorColor: Colors.red,
        enabled: false,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.date_range),
            prefixIconColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.focused)
                    ? Colors.red
                    : Colors.blue),
            filled: true,
            fillColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.focused)
                    ? Colors.red.withOpacity(0.1)
                    : Colors.blue.withOpacity(0.1)),
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "dd/mm/yyyy",
            errorText: birthValidate,
            errorBorder: borderError(),
            border: borderEnabled(),
            focusedBorder: borderFocus(),
            enabledBorder: borderEnabled()),
      ),
    );

    final mobile = TextField(
      obscureText: false,
      controller: mobilecontroller,
      cursorColor: Colors.red,
      style: TextStyle(color: Colors.black),
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone),
          prefixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? Colors.red
                  : Colors.blue),
          filled: true,
          fillColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? Colors.red.withOpacity(0.1)
                  : Colors.blue.withOpacity(0.1)),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Mobile Here",
          errorText: mobileValidate,
          errorBorder: borderError(),
          border: borderEnabled(),
          focusedBorder: borderFocus(),
          enabledBorder: borderEnabled()),
    );

    final passwordField = TextField(
      obscureText: _passVisibility,
      controller: passcontroller,
      cursorColor: Colors.red,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
          prefixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? Colors.red
                  : Colors.blue),
          suffixIcon: IconButton(
            icon: _passVisibility
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
            onPressed: () {
              _passVisibility = !_passVisibility;
              setState(() {

              });
            },
          ),
          suffixIconColor: MaterialStateColor.resolveWith((states) =>
          states.contains(MaterialState.focused)
              ? Colors.red
              : Colors.blue),
          filled: true,
          fillColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? Colors.red.withOpacity(0.1)
                  : Colors.blue.withOpacity(0.1)),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password Here",
          errorText: passValidate,
          errorBorder: borderError(),
          border: borderEnabled(),
          focusedBorder: borderFocus(),
          enabledBorder: borderEnabled()),
    );

    final confirmPasswordField = TextField(
      obscureText: _confirmVisibility,
      controller: confirmcontroller,
      cursorColor: Colors.red,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.password),
        prefixIconColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.focused) ? Colors.red : Colors.blue),
        suffixIcon: IconButton(
          icon: _confirmVisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
          onPressed: () {
            _confirmVisibility = !_confirmVisibility;
            setState(() {

            });
          },
        ),
        suffixIconColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.focused)
            ? Colors.red
            : Colors.blue),
        filled: true,
        fillColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.focused)
                ? Colors.red.withOpacity(0.1)
                : Colors.blue.withOpacity(0.1)),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Confirm Password",
        errorText: confirmValidate,
          errorBorder: borderError(),
          border: borderEnabled(),
          focusedBorder: borderFocus(),
          enabledBorder: borderEnabled(),
      ),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.red,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
        onPressed: () {
          _signUp();
        },
        child: Text(
          "Submit",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Signup Form")),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 16.0),
                  titleWidget('Your name'),
                  name,
                  SizedBox(height: 16.0),
                  titleWidget('Your birthday'),
                  birthDay,
                  SizedBox(height: 16.0),
                  titleWidget('Your number phone'),
                  mobile,
                  SizedBox(height: 16.0),
                  titleWidget('Your email'),
                  emailField,
                  SizedBox(height: 16.0),
                  titleWidget('Password'),
                  passwordField,
                  SizedBox(height: 16.0),
                  titleWidget('Confirm password'),
                  confirmPasswordField,
                  SizedBox(height: 35.0,),
                  loginButon,
                  SizedBox(height: 20.0,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
