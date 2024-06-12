import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_task/infrastructure/provider/weather_service_provider.dart';

final weatherServiceProvider = ChangeNotifierProvider<WeatherServiceProvider>((ref) => WeatherServiceProvider(ref));
/*
final dashboardScreenProvider =
ChangeNotifierProvider.autoDispose<DashboardScreenProvider>((_) => DashboardScreenProvider());*/
