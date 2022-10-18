import 'package:ambev_flutter/app/modules/login/widgets/already_have_account.dart';
import 'package:ambev_flutter/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: appThemeData.primaryColor,
            onSaved: (email) {},
            decoration: InputDecoration(
              fillColor: appThemeData.primaryColor,
              hintText: "Nome de Usuário",
              prefixIcon: Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(Icons.person),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: appThemeData.primaryColor,
              decoration: InputDecoration(
                hintText: "Senha",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SplashScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
