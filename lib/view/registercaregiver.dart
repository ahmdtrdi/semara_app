import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:semara_app/services/auth_service.dart';
import 'package:semara_app/services/globals.dart';
import 'package:semara_app/utils.dart';
import 'package:semara_app/view/loginpage.dart';
import 'package:semara_app/components/mytextfield.dart';
import 'package:semara_app/view/register_succeed.dart';

class RegisterCaregiver extends StatefulWidget {
  RegisterCaregiver({super.key});

  @override
  State<RegisterCaregiver> createState() => _RegisterCaregiverState();
}

class _RegisterCaregiverState extends State<RegisterCaregiver> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final numberController = TextEditingController();

  createAccountPressed() async {
    String name = usernameController.text;
    String phoneNumber = numberController.text;
    String password = passwordController.text;
    http.Response response =
        await AuthServices.register(name, phoneNumber, password);
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Loginpage(),
        ),
      );
    } else {
      Map responseMap = json.decode(response.body);
      errorSnackBar(context, responseMap.values.first[0]);
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
                  height: 65,
                ),
                Center(
                  child: Text(
                    "Halo Sahabat Senja!",
                    style: bodyText20.copyWith(
                        color: turbo950, fontWeight: FontWeight.w800),
                  ),
                ),
                Text(
                  "Mendaftar",
                  style: mobileH2.copyWith(color: turbo950),
                ),
                Image.asset(
                  "assets/icons/caregiver.png",
                  width: 230,
                ),
                const SizedBox(
                  height: 5,
                ),

                /* --FORM SECTION-- */
                const SizedBox(height: 30.0),
                // * --Username Field
                MyTextFiled(
                  controller: usernameController,
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
                  height: 20,
                ),
                MyTextFiled(
                  controller: numberController,
                  hintText: 'Nomor Telepon',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 385,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          await createAccountPressed();
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
                        "Daftar",
                        style: bodyText16.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Row(
                    children: [
                      Text(
                        "Apakah anda sudah memiliki akun?",
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
                                builder: (context) => Loginpage()),
                          );
                        },
                        child: Text(
                          "Masuk",
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
