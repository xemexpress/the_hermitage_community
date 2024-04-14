import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_hermitage_community/src/features/resonation/cubit/cubit.dart';
import 'package:the_hermitage_community/src/features/resonation/view/intro_view.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClapCounterCubit(),
      child: const IntroView(),
    );
  }
}
