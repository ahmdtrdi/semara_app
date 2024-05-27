import 'package:flutter/material.dart';
import 'package:semara_app/utils.dart';
import 'package:semara_app/view/registercaregiver.dart';

class RolePage extends StatelessWidget {
  const RolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: turbo100,
        child: Column(
          children: [
            const SizedBox(
              height: 145,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Pilih peran anda dalam\n mendampingi Lansia",
                  style: mobileH4.copyWith(
                      color: turbo950, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterCaregiver()),
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
                  "Sebagai Pengasuh", // Replace with your button text
                  style: bodyText16.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600), // Adjust text color
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //  context,
                  //  MaterialPageRoute(builder: (context) => //),
                  // );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Adjust corner radius
                    ),
                    backgroundColor: turbo950 // Adjust button color
                    ),
                child: Text(
                  "Sebagai Dokter", // Replace with your button text
                  style: bodyText16.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600), // Adjust text color
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //  context,
                  //  MaterialPageRoute(builder: (context) => //),
                  // );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Adjust corner radius
                    ),
                    backgroundColor: turbo950 // Adjust button color
                    ),
                child: Text(
                  "Sebagai Lansia", // Replace with your button text
                  style: bodyText16.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600), // Adjust text color
                ),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            Image.asset(
              "assets/images/dekor.png",
              width: 370,
            )
          ],
        ),
      ),
    );
  }
}
