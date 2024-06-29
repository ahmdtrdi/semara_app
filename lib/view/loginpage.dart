import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:semara_app/components/mytextfield.dart';
import 'package:semara_app/utils.dart';
import 'package:semara_app/view/homapagecaregiver.dart';
import 'package:semara_app/view/role.dart';
import 'package:semara_app/services/auth_service.dart';
import 'package:semara_app/services/globals.dart';
import 'package:http/http.dart' as http;

class Loginpage extends StatefulWidget {
  Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final numberController = TextEditingController();

  final passwordController = TextEditingController();

  loginPressed() async {
    String phoneNumber = numberController.text;
    String password = passwordController.text;

    if (phoneNumber.isNotEmpty && password.isNotEmpty) {
      http.Response response = await AuthServices.login(phoneNumber, password);
      Map responseMap = json.decode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomepageCaregiver(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'enter all required fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: turbo300,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 05.0,
              right: 05.0,
              bottom: MediaQuery.of(context)
                  .viewInsets
                  .bottom, // Adjusts for keyboard
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 105,
                ),
                Text(
                  "Selamat Datang",
                  style: bodyText20.copyWith(
                      color: turbo950, fontWeight: FontWeight.w800),
                ),
                Text(
                  "Masuk",
                  style: mobileH2.copyWith(color: turbo950),
                ),
                Image.asset(
                  "assets/images/login-logo.png",
                  width: 173,
                ),
                const SizedBox(
                  height: 5,
                ),

                /* --FORM SECTION-- */
                const SizedBox(height: 40.0),
                // * --Username Field
                MyTextFiled(
                  controller: numberController,
                  hintText: 'Nama Lengkap',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                //-- *Passwords Field
                MyTextFiled(
                  controller: passwordController,
                  hintText: 'Kata Sandi',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Lupa Kata Sandi?",
                        style: bodyText14.copyWith(
                            color: turbo900, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  width: 385,
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          await loginPressed();
                        } catch (e) {
                          errorSnackBar(context, "An error occurred: $e");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: turbo950),
                      child: Text(
                        "Masuk",
                        style: bodyText16.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 98),
                  child: Row(
                    children: [
                      Text(
                        "Tidak memiliki akun?",
                        style: bodyText14.copyWith(
                          color: neutral600,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RolePage()),
                          );
                        },
                        child: Text(
                          "Daftar",
                          style: bodyText14.copyWith(
                              color: turbo950), // Adjust text color
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
