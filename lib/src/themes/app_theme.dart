import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_hermitage_community/src/themes/themes.dart';

class AppTheme {
  static ThemeData currentTheme({
    required BuildContext context,
    Brightness brightness = Brightness.light,
  }) =>
      brightness == Brightness.light
          ? ThemeData.from(
              colorScheme: ColorScheme.fromSeed(
                brightness: Brightness.light,
                seedColor: Palettes.primary,
              ).copyWith(
                primary: Palettes.primary,
                onPrimary: Palettes.onPrimary,
                surfaceVariant: Palettes.surfaceVariant,
              ),
            ).copyWith(
              appBarTheme: const AppBarTheme().copyWith(
                backgroundColor: Palettes.primary,
              ),
              textTheme: GoogleFonts.robotoSlabTextTheme(
                Theme.of(context).textTheme,
              ),
            )
          : ThemeData(
              brightness: Brightness.dark,
            );
}
