import 'package:flutter/material.dart';
import 'package:semara_app/utils.dart';
import 'package:semara_app/view/loginpage.dart';
import 'package:semara_app/view/role.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: turbo100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/welcomelogo.png"),
              ],
            ),
          ),
          Positioned(
            top: 554,
            left: 45,
            bottom: 131,
            child: Text(
              "Selamat Datang!",
              style: mobileH1.copyWith(color: turbo950),
            ),
          ),
          Positioned(
            top: 615,
            left: 140,
            bottom: 131,
            child: Text(
              "Sahabat Senja",
              style: bodyText20.copyWith(
                  color: turbo950, fontWeight: FontWeight.w700),
            ),
          ),
          Positioned(
            // Position the button below "Sahabat Senja" with some padding
            top: 615 + 90.0, // Adjust spacing as needed
            left: MediaQuery.of(context).size.width / 2 -
                195, // Center horizontally
            child: SizedBox(
              width: 385, // Adjust button width as needed
              height: 50, // Adjust button height as needed
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RolePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Adjust corner radius
                    ),
                    backgroundColor: turbo950 // Adjust button color
                    ),
                child: Text(
                  "Mendaftar", // Replace with your button text
                  style: bodyText16.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600), // Adjust text color
                ),
              ),
            ),
          ),
          Positioned(
            top: 615 + 160,
            left: MediaQuery.of(context).size.width / 2 - 150,
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
                      MaterialPageRoute(builder: (context) => Loginpage()),
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
    );
  }
}
