import 'package:flutter/material.dart';
import 'package:semara_app/utils.dart';
import 'package:semara_app/view/homapagecaregiver.dart';
import 'package:semara_app/view/loginpage.dart';

class RegisterSucceed extends StatefulWidget {
  const RegisterSucceed({super.key});

  @override
  State<RegisterSucceed> createState() => _RegisterSucceedState();
}

class _RegisterSucceedState extends State<RegisterSucceed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: turbo300,
      body: Column(
        children: [
          const SizedBox(
            height: 261,
          ),
          Expanded(
            child: SizedBox(
              height: 621,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50), // Adjust the radius as needed
                  topRight: Radius.circular(50),
                ),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 74,
                      ),
                      Center(
                        child: Image.asset(
                          "assets/icons/berhasil.png",
                          width: 106,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "BERHASIL",
                        style: mobileH1.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Selamat! anda telah berhasil terautentikasi",
                        style: bodyText16.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 109,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: SizedBox(
                          width: 385,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Loginpage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                backgroundColor: turbo950),
                            child: Text(
                              "Lanjut",
                              style: bodyText16.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
