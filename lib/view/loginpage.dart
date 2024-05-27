import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:semara_app/components/mytextfield.dart';
import 'package:semara_app/utils.dart';
import 'package:semara_app/view/homapagecaregiver.dart';
import 'package:semara_app/view/role.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: turbo300,
        body: Column(
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
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomepageCaregiver()),
                  );
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
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
    );
  }
}
