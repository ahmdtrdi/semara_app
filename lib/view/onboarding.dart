import 'package:semara_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:semara_app/view/registerpage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late PageController _controller;
  int _pageIndex = 0;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: onboard_data.length,
            onPageChanged: (index) => setState(() => _pageIndex = index),
            itemBuilder: (context, index) => OnboardingContent(
              image: onboard_data[index].image,
              title: onboard_data[index].title,
              description: onboard_data[index].description,
            ),
          ),

          //star now button

          //dot Indicator
          Container(
              alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //skip
                  Positioned(
                    top: 20.0,
                    right: 10.0,
                    child: TextButton(
                      onPressed: () =>
                          _controller.jumpToPage(onboard_data.length - 1),
                      child: Text(
                        "Skip",
                        style: bodyText16.copyWith(color: turbo950),
                      ),
                    ),
                  ),

                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 6,
                      dotColor: neutral200,
                      activeDotColor: turbo950,
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      if (_pageIndex == onboard_data.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Registerpage()),
                        );
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: Text(
                      "Next",
                      style: bodyText16.copyWith(color: turbo950),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class Onboard {
  final String title, image, description;
  Onboard(
      {required this.title, required this.image, required this.description});
}

final List<Onboard> onboard_data = [
  Onboard(
    title: 'Kesehatan yang Berkualitas & Perawatan yang Peduli',
    image: 'assets/images/bro.png',
    description:
        'SEMARA adalah aplikasi yang bertujuan untuk\n menjadi mitra yang dapat diandalkan bagi lansia\n dalam perjalanan mereka menuju kesehatan,\n kemandirian, dan kesejahteraan yang optimal.',
  ),
  Onboard(
      title: 'Kesehatan Emas untuk Hidup yang Berkilau',
      image: 'assets/images/bro-2.png',
      description:
          'SEMARA hadir untuk memberikan layanan yang\n memperhatikan kesehatan fisik, mental, serta\n kesejahteraan  bagi para lansia, layaknya matahari\n senja yang memancarkan kehangatan,\n ketenangan, dan keindahan'),
  Onboard(
    title: 'Peduli Lebih Dekat, Menginspirasi Kehidupan',
    image: 'assets/images/bro-3.png',
    description:
        'SEMARA mendukung pengasuh dan keluarga\n untuk merasa lebih dekat, termotivasi, dan siap\n memberikan perawatan yang penuh perhatian\n dan terbaik untuk orang yang mereka sayangi.',
  ),
];

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.title,
    required this.image,
    required this.description,
  });

  final String title, image, description;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: turbo100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 143,
          ),
          Image.asset(
            image,
            width: 250,
          ),
          const SizedBox(
            height: 62,
          ),
          Positioned(
            left: 25,
            child: Text(
              title,
              style: mobileH4.copyWith(color: turbo950),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            style: bodyText16.copyWith(color: turbo950),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
