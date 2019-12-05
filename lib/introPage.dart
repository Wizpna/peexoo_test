import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:peexoo_test/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntoScreen extends StatefulWidget {
  @override
  _IntoScreenState createState() => _IntoScreenState();
}

class _IntoScreenState extends State<IntoScreen> {
  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.png', width: 240.0),
      alignment: Alignment.bottomCenter,
    );
  }

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
        fontSize: 18.0, color: Colors.black54, fontWeight: FontWeight.w400);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 26.0,
          fontWeight: FontWeight.w700,
          color: Colors.orangeAccent),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Snap the Moment",
            body:
                "Capture every single moment of your life with Tringoo. Show the world how cute you are.",
            image: ClipOval(child: _buildImage('camera')),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Live the Tringoo life",
            body:
                "Make every moments of your life count. Get the best off our world-class photographers.",
            image: _buildImage('stand'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Remember",
            body:
                "Love is in the cloud. Remember your best of moments with Tringoo cloud and share with your loved ones.",
            image: _buildImage('memories'),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => _onIntroEnd(context),
        onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        skip: const Text('Skip',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
        next: const Icon(Icons.arrow_forward),
        done: const Text('Done',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
        dotsDecorator: const DotsDecorator(
          activeColor: Colors.orangeAccent,
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ));
  }
}
