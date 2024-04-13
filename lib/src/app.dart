import 'package:flutter/material.dart';
import 'package:the_hermitage_community/src/features/intro/view/intro_screen.dart';
import 'package:the_hermitage_community/src/themes/themes.dart';

class TheHermitageCommunity extends StatefulWidget {
  const TheHermitageCommunity({super.key});

  @override
  State<TheHermitageCommunity> createState() => _TheHermitageCommunityState();
}

class _TheHermitageCommunityState extends State<TheHermitageCommunity> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.currentTheme(context: context),
      home: const IntroScreen(),
    );
  }
}
