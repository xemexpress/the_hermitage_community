import 'package:flutter/material.dart';
import 'package:the_hermitage_community/src/themes/themes.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const String title = 'Ever Miss That Important Memo in the Elevator?';
    const String body =
        'Let\'s ditch the old-school board for a digital one! Community news anytime, anywhere.';
    const String buttonText = 'I\'m in!';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'The Hermitage Community',
          style: TextStyle(color: Palettes.onPrimary),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/board.jpg'),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: const Text(
                body,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                buttonText,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Palettes.primary),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
