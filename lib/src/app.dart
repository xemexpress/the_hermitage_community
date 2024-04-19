import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_hermitage_community/src/features/resonation/resonation.dart';
import 'package:the_hermitage_community/src/features/tutorials/auth/authentication/bloc/authentication_bloc.dart';
import 'package:the_hermitage_community/src/features/tutorials/tutorials.dart';
import 'package:the_hermitage_community/src/themes/themes.dart';
import 'package:user_repository/user_repository.dart';
import 'package:weather_repository/weather_repository.dart';

// Flutter Bloc Weather App
class TheHermitageCommunity extends StatelessWidget {
  const TheHermitageCommunity(
      {required WeatherRepository weatherRepository, super.key})
      : _weatherRepository = weatherRepository;

  final WeatherRepository _weatherRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _weatherRepository,
      child: BlocProvider(
        create: (_) => ThemeCubit(),
        child: const WeatherAppView(),
      ),
    );
  }
}

class WeatherAppView extends StatelessWidget {
  const WeatherAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, Color>(
      builder: (context, color) {
        return MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: color),
            textTheme: GoogleFonts.rajdhaniTextTheme(),
          ),
          // theme: AppTheme.currentTheme(),
          debugShowCheckedModeBanner: false,
          home: const WeatherPage(),
        );
      },
    );
  }
}

// Flutter Bloc Authentication App
// class TheHermitageCommunity extends StatefulWidget {
//   const TheHermitageCommunity({super.key});

//   @override
//   State<TheHermitageCommunity> createState() => _TheHermitageCommunityState();
// }

// class _TheHermitageCommunityState extends State<TheHermitageCommunity> {
//   late final AuthenticationRepository _authenticationRepository;
//   late final UserRepository _userRepository;

//   @override
//   void initState() {
//     super.initState();

//     _authenticationRepository = AuthenticationRepository();
//     _userRepository = UserRepository();
//   }

//   @override
//   void dispose() {
//     _authenticationRepository.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider.value(
//       value: _authenticationRepository,
//       child: BlocProvider(
//         create: (_) => AuthenticationBloc(
//           authenticationRepository: _authenticationRepository,
//           userRepository: _userRepository,
//         ),
//         child: const AppView(),
//       ),
//     );
//   }
// }

// class AppView extends StatefulWidget {
//   const AppView({super.key});

//   @override
//   State<AppView> createState() => _AppViewState();
// }

// class _AppViewState extends State<AppView> {
//   final _navigatorKey = GlobalKey<NavigatorState>();

//   NavigatorState get _navigator => _navigatorKey.currentState!;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       navigatorKey: _navigatorKey,
//       builder: (context, child) {
//         return BlocListener<AuthenticationBloc, AuthenticationState>(
//           listener: (context, state) {
//             switch (state.status) {
//               case AuthenticationStatus.authenticated:
//                 _navigator.pushAndRemoveUntil(
//                     HomePage.route(), (route) => false);
//                 break;
//               case AuthenticationStatus.unauthenticated:
//                 _navigator.pushAndRemoveUntil(
//                     LoginPage.route(), (route) => false);
//               case AuthenticationStatus.unknown:
//                 break;
//             }
//           },
//           child: child,
//         );
//       },
//       onGenerateRoute: (_) => SplashPage.route(),
//     );
//   }
// }


// Flutter Original THC App
// class TheHermitageCommunity extends MaterialApp {
//   TheHermitageCommunity({super.key})
//       : super(
//           // home: const PostsPage(),
//           // home: const TimerPage(),
//           home: const IntroPage(),
//           theme: AppTheme.currentTheme(),
//           debugShowCheckedModeBanner: false,
//         );
// }
