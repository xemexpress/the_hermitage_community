import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_hermitage_community/src/core/core.dart';
import 'package:the_hermitage_community/src/features/resonation/cubit/clap_counter_cubit.dart';
import 'package:the_hermitage_community/src/themes/themes.dart';
import 'package:transparent_image/transparent_image.dart';

class IntroView extends StatefulWidget {
  const IntroView({
    super.key,
  });

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  String title = 'Ever Miss That Important Memo Near Our Elevator?';
  String body =
      'Let\'s imagine a world with\ncommunity news anytime, anywhere.';
  String supportButtonText = 'I\'m in!';
  String cancelSupportButtonText = 'Change mind? Cancel.';
  String clapButtonText = 'Clap';
  int supporterCount = 0;
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
                    BlocBuilder<ClapCounterCubit, int>(
                      builder: (context, clapCount) {
                        return IconButton(
                          onPressed: () =>
                              context.read<ClapCounterCubit>().increment(),
                          icon: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 100),
                            transitionBuilder: (child, animation) {
                              return ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            },
                            child: FaIcon(
                              FontAwesomeIcons.handsClapping,
                              key: ValueKey(clapCount),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text(
                    'We, reach $targetSupporters supporters to start the project!',
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
                const SizedBox(
                  height: 10,
                ),
                // const Text('Timer'),
                // const SizedBox(height: 10),

                // const SizedBox(height: 10),
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
            child: BlocBuilder<ClapCounterCubit, int>(
              builder: (context, clapCount) {
                return Text(
                  "Currently $supporterCount supporter${supporterCount == 1 ? '' : 's'} (${targetSupporters - supporterCount} to go), $clapCount clap${clapCount == 1 ? '' : 's'}.",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Palettes.onSecondary),
                );
              },
            ),
            // child: Text(
            //   'Currently $supporterCount supporter${supporterCount == 1 ? '' : 's'} (${targetSupporters - supporterCount} to go), $clapCount claps.',
            //   style: Theme.of(context)
            //       .textTheme
            //       .titleSmall!
            //       .copyWith(color: Palettes.onSecondary),
            // ),
          ),
        ],
      ),
    );
  }
}
