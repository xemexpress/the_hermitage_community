import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_hermitage_community/src/core/core.dart';
import 'package:the_hermitage_community/src/themes/themes.dart';
import 'package:transparent_image/transparent_image.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({
    super.key,
  });

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  String title = 'Ever Miss That Important Memo Near Our Elevator?';
  String body =
      'Let\'s ditch the old-school board for a digital one! Community news anytime, anywhere.';
  String supportButtonText = 'I\'m in!';
  String cancelSupportButtonText = 'Change mind? Cancel.';
  String clapButtonText = 'Clap';
  int supporterCount = 0;
  int clapCount = 0;
  bool isSupporting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          appName,
          style: TextStyle(color: Palettes.onPrimary),
        ),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeInImage(
                  imageSemanticLabel:
                      'Remeber the anouncement board near our elevator?',
                  placeholder: MemoryImage(kTransparentImage),
                  image: const AssetImage('assets/images/board.jpg'),
                  imageErrorBuilder: (context, error, stackTrace) => const Text(
                      'Failed to load the image, which is the anouncement board near our elevator.'),
                  fadeInCurve: Easing.legacy,
                ),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    body,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          if (isSupporting) {
                            supporterCount--;
                          } else {
                            supporterCount++;
                          }

                          isSupporting = !isSupporting;
                        });
                      },
                      label: Text(
                        isSupporting
                            ? cancelSupportButtonText
                            : supportButtonText,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Palettes.primary),
                        textAlign: TextAlign.center,
                      ),
                      icon: isSupporting
                          ? const Icon(Icons.clear)
                          : const Icon(Icons.golf_course),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          clapCount++;
                        });
                      },
                      icon: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 100),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: child,
                          );

                          // return FadeTransition(
                          //   opacity: animation,
                          //   child: child,
                          // );

                          // return RotationTransition(
                          //   turns: animation,
                          //   child: child,
                          // );
                        },
                        child: FaIcon(
                          FontAwesomeIcons.handsClapping,
                          key: ValueKey(clapCount),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text(
                    'Our first target is to reach $targetSupporters supporters to kick start the project!',
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text(
                    'Your voice matters! What do you think about this idea?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const TextField(
                  scrollPadding: EdgeInsets.all(50),
                  maxLines: 2,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  textInputAction: TextInputAction.send,
                ),
                IconButton.filled(
                  onPressed: () {},
                  icon: Transform.translate(
                    offset: const Offset(2, 0),
                    child: const Icon(Icons.send_rounded),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            width: double.infinity,
            alignment: Alignment.center,
            color: Palettes.secondary,
            child: Text(
              'Currently $supporterCount supporter${supporterCount == 1 ? '' : 's'} (${targetSupporters - supporterCount} to go), $clapCount claps.',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Palettes.onSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
