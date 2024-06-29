import 'package:flutter/material.dart';
import 'package:semara_app/constant/image_string.dart';
import 'package:semara_app/constant/menu_model.dart';
import 'package:semara_app/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:semara_app/view/dailyroutines.dart';
import 'package:semara_app/view/foodpage.dart';
import 'package:semara_app/view/hobbies.dart';

class HomepageCaregiver extends StatefulWidget {
  const HomepageCaregiver({super.key});

  @override
  State<HomepageCaregiver> createState() => _HomepageCaregiverState();
}

class _HomepageCaregiverState extends State<HomepageCaregiver> {
  final Map<String, Widget Function(BuildContext context)> _pageMap = {
    'Rutinitas': (context) => const DailyRoutines(),
    'hobi': (context) => const HobbiesPage(),
    'Makanan &\nNutrisi': (context) => const FoodNutritions(),
  };

  List<SemaraService> _semaraServiceList = [];

  @override
  void initState() {
    super.initState();

    _semaraServiceList.add(SemaraService(
      image: "assets/images/rutinitas.png",
      title: "Rutinitas",
    ));
    _semaraServiceList.add(SemaraService(
      image: "assets/images/hobi.png",
      title: "hobi",
    ));
    _semaraServiceList.add(SemaraService(
      image: "assets/images/food.png",
      title: "Makanan &\nNutrisi",
    ));
    _semaraServiceList.add(SemaraService(
      image: "assets/images/live.png",
      title: "Live Location",
    ));
    _semaraServiceList.add(SemaraService(
      image: "assets/images/forum.png",
      title: "Forum Diskusi",
    ));
    _semaraServiceList.add(SemaraService(
      image: "assets/images/lainnya.png",
      title: "Lainnya",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: turbo300,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            // --- ** GREETINGS ** --- //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Selamat Siang, \nSarina!",
                  style: mobileH3,
                ),
                Image.asset(
                  "assets/images/avatar.png",
                  width: 80,
                ),
              ],
            ),
            // --- ** MENU WIDGET ** --- //
            const SizedBox(
              height: 31,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              color: Colors.white,
              child: _buildSemaraServiceMenu(),
            ),
            const SizedBox(
              height: 36,
            ),
            SizedBox(
              width: 350,
              height: 118,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Text(
                              "SEMARA (Senja Emas Rahayu)",
                              style: bodyText14.copyWith(
                                  fontWeight: FontWeight.w800, color: turbo950),
                            ),
                            const SizedBox(
                              height: 11,
                            ),
                            Text(
                              "Aplikasi pendamping untuk meningkatkan\n kualitas hidup para lansia secara\n menyeluruh dengan semangat kepedulian\n dan kemanusiaan.",
                              style: bodyText10.copyWith(color: turbo950),
                            )
                          ],
                        ),
                      ),
                      Image.asset(
                        "assets/icons/demensia.png",
                        width: 105,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 21,
            ),
            SizedBox(
              width: 350,
              height: 118,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              "Panggil Bantuan Darurat\ndengan Sekali Sentuh",
                              style: bodyText14.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black),
                            ),
                            Text(
                              "Kemudahan dan kecepatan untuk\nmeminta bantuan darurat kepada orang\n terdekat dengan cepat hanya dengan\nsekali sentuhan.",
                              style: bodyText10.copyWith(color: turbo950),
                            )
                          ],
                        ),
                      ),
                      Image.asset(
                        "assets/icons/emergency-call.png",
                        width: 105,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // --- ** BottomAppBar ** -- //
          ],
        ),
      )),
    );
  }

  Widget _buildSemaraServiceMenu() {
    return Column(
      children: [
        GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _semaraServiceList.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 1.1),
            itemBuilder: (context, index) {
              SemaraService semaraService = _semaraServiceList[index];
              return GestureDetector(
                onTap: () {
                  final targetPage = _pageMap[semaraService.title];
                  if (targetPage != null) {
                    Navigator.push(
                        context, MaterialPageRoute(builder: targetPage));
                  }
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Center(
                        child: Image.asset(
                          semaraService.image,
                          width: 65,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      semaraService.title,
                      style: bodyText10.copyWith(fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              );
            }),
      ],
    );
  }
}
