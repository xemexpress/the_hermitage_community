import 'package:flutter_bloc/flutter_bloc.dart';

class THCObserver extends BlocObserver {
  const THCObserver();

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    print('onTransition: ${bloc.runtimeType} $transition');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);

    print('onChange: ${bloc.runtimeType} $change');
  }
}
