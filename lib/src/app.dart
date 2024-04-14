import 'package:flutter/material.dart';
import 'package:the_hermitage_community/src/features/resonation/resonation.dart';
import 'package:the_hermitage_community/src/themes/themes.dart';

class TheHermitageCommunity extends MaterialApp {
  TheHermitageCommunity({super.key})
      : super(
          home: const IntroPage(),
          theme: AppTheme.currentTheme(),
          debugShowCheckedModeBanner: false,
        );
}
