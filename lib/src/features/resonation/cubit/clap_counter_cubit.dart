import 'package:hydrated_bloc/hydrated_bloc.dart';

class ClapCounterCubit extends HydratedCubit<int> {
  ClapCounterCubit() : super(0);

  void increment() => emit(state + 1);

  @override
  int fromJson(Map<String, dynamic> json) => json['clapCount'] as int;

  @override
  Map<String, dynamic>? toJson(int state) => {'clapCount': state};
}
