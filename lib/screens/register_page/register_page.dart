import 'package:examtwo/components/border_radius.dart';
import 'package:examtwo/consts/colors.dart';
import 'package:examtwo/data/user_list.dart';
import 'package:examtwo/models/user_model.dart';
import 'package:examtwo/screens/home/home_page.dart';
import 'package:examtwo/widgets/buttons.dart';
import 'package:examtwo/widgets/icons.dart';
import 'package:examtwo/widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormFieldState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  double? _height;
  double? _width;

  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colorIndigo,
      appBar: _showAppBar(),
      body: _isLogin ? _showLoginPage() : _showRegisterPage(),
    );
  }

  AppBar _showAppBar() => AppBar(
        backgroundColor: colorIndigo,
        centerTitle: true,
        elevation: 0.0,
        title: setSimpleBoldText(
          _isLogin ? "Sign in" : "Sign up",
          color: colorWhite,
          size: 24.0,
        ),
      );

  _showLoginPage() => SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: _height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    emailTextFormField(),
                    const SizedBox(height: 16.0),
                    passwordTextFormField(),
                    const SizedBox(height: 24.0),
                    SizedBox(
                      width: _width,
                      height: 52.0,
                      child: setElevatedButton(_onLoginButtonPressed, "Login"),
                    ),
                    _changePage(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  _showRegisterPage() => SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: _height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    usernameTextFormField(),
                    const SizedBox(height: 16.0),
                    emailTextFormField(),
                    const SizedBox(height: 16.0),
                    passwordTextFormField(),
                    const SizedBox(height: 24.0),
                    SizedBox(
                      width: _width,
                      height: 52.0,
                      child: setElevatedButton(
                          _onRegisterButtonPressed, "Register"),
                    ),
                    _changePage(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  _changePage() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          setSimpleText(_isLogin ? "Don't have account?" : "Have an account?",
              color: colorGrey),
          setTextButton(() {
            setState(() {
              _isLogin = !_isLogin;
            });
          }, _isLogin ? "Register" : "Login"),
        ],
      );

  TextFormField passwordTextFormField() {
    return TextFormField(
      controller: _passwordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: _setInputDecoration(
        "Password",
        Icons.lock_outline,
      ),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: _setInputDecoration(
        "Email",
        Icons.email_outlined,
      ),
    );
  }

  TextFormField usernameTextFormField() {
    return TextFormField(
      controller: _usernameController,
      keyboardType: TextInputType.name,
      decoration: _setInputDecoration(
        "Username",
        Icons.person_outline,
      ),
    );
  }

  InputDecoration _setInputDecoration(
    String hint,
    IconData prefixIcon,
  ) =>
      InputDecoration(
        border: _getBorder(),
        filled: true,
        fillColor: colorWhite,
        hintText: hint,
        prefixIcon: setIcon(prefixIcon),
      );

  OutlineInputBorder _getBorder() => OutlineInputBorder(
        borderRadius: setCircularBorder(12.0),
      );

  void _onLoginButtonPressed() {
    String email = _emailController.text;
    String password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      print("Enter all fields");
    } else {
      bool isValid = false;
      for (User user in UserData.userList) {
        if (user.email == email && user.password == password) {
          UserData.currentUser = user;
          isValid = true;
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => HomePage()));
          break;
        }
      }

      if (!isValid) {
        print("Wrong");
      }
    }
  }

  void _onRegisterButtonPressed() {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    int len = UserData.userList.length + 1;
    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      print("Clicked");
      return;
    }
    User user = User(len, username, email, password, 0, Icons.person_outline);
    UserData.currentUser = user;
    UserData.userList.add(user);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => HomePage()));
  }
}
