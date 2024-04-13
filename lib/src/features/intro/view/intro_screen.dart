import 'package:flutter/material.dart';
import 'package:the_hermitage_community/src/common/common.dart';
import 'package:the_hermitage_community/src/themes/themes.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'The Hermitage Community',
          style: TextStyle(color: Palettes.onPrimary),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 500,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(20.0), // Adjust radius as needed
                  image: const DecorationImage(
                    image: AssetImage('assets/images/board.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Welcome to The Hermitage Community. My name is Jason and I live in Tower 8, The Hermiage. When we take the lift to go from 5th floor to UG, we can always see this annoucement board. Would you like us to digitize it as an app or a web like this for our community? If yes, please click the button to make that happen.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Palettes.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                width: 100,
                height: 50,
                child: const Text(
                  'Yes\nLet\'s do it!',
                  style: TextStyle(
                    color: Palettes.onPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      // body: const Center(
      // child: Text(
      //   'Welcome to The Hermitage Community. My name is Jason and I live in Tower 8, The Hermiage. When I am taking the lift to go from our 5 floor to the UG, I can always see this annoucement board. Would you like me to develop an app like this for our community? If yes, please click the button to make that happen.',
      //   textAlign: TextAlign.center,
      // ),
      // ),
    );
  }
}
