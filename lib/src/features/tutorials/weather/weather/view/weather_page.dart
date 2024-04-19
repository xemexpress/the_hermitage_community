import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_hermitage_community/src/features/tutorials/tutorials.dart';
import 'package:weather_repository/weather_repository.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(
        context.read<WeatherRepository>(),
      ),
      child: const WeatherView(),
    );
  }
}

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push<void>(
                SettingsPage.route(context.read<WeatherCubit>()),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state.status.isSuccess) {
              context.read<ThemeCubit>().updateTheme(state.weather);
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case WeatherStatus.initial:
                return const WeatherEmpty();
              case WeatherStatus.loading:
                return const WeatherLoading();
              case WeatherStatus.success:
                return WeatherPopulated(
                  onRefresh: () {
                    return context.read<WeatherCubit>().refreshWeather();
                  },
                  units: state.temperatureUnits,
                  weather: state.weather,
                );
              // return const Text('WeatherPopulated()');
              case WeatherStatus.failure:
                return const WeatherError();
              // return const Text('WeatherError()');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final city = await Navigator.of(context).push(SearchPage.route());

          if (!context.mounted) return;

          await context.read<WeatherCubit>().fetchWeather(city);
        },
        child: const Icon(Icons.search, semanticLabel: 'Search'),
      ),
    );
  }
}
