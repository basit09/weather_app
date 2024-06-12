import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_task/infrastructure/commons/constants/color_constants.dart';
import 'package:weather_app_task/infrastructure/commons/constants/image_constants.dart';
import 'package:weather_app_task/infrastructure/commons/extensions/ui_extensions/size_extension.dart';
import 'package:weather_app_task/infrastructure/provider/provider_registration.dart';
import 'package:weather_app_task/ui/screens/common_widgets/common_background_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  // initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
  //     await ref.read(weatherServiceProvider).getWeatherDataAPI(name: 'India');
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    const String degreeSymbol = '\u00B0';
    final weatherServiceProviderRead = ref.read(weatherServiceProvider);
    final weatherServiceProviderWatch = ref.watch(weatherServiceProvider);
    return Scaffold(
      body: CommonBackgroundContainer(
        childWidget: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              30.0.spaceY,
              Stack(
                children: [
                  InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: ColorConstants.whiteColor,
                      )),
                  Center(
                    child: Text(
                      weatherServiceProviderWatch.weatherResponseData?.name ??
                          'General',
                      style: const TextStyle(
                          color: ColorConstants.whiteColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
              30.0.spaceY,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageConstants.sunCloudImage,
                        width: 150,
                        height: 150,
                      ),
                      Text(
                        weatherServiceProviderWatch
                                .weatherResponseData?.weather?[0].description
                                ?.toUpperCase() ??
                            '',
                        style: const TextStyle(
                            fontSize: 20, color: ColorConstants.whiteColor),
                      ),
                      Row(
                        children: [
                          Text(
                            "H:${weatherServiceProviderWatch.weatherResponseData?.main?.tempMax?.toStringAsFixed(0)}$degreeSymbol" ??
                                '',
                            style: const TextStyle(
                                fontSize: 14, color: ColorConstants.whiteColor),
                          ),
                          10.0.spaceX,
                          Text(
                            "L:${weatherServiceProviderWatch.weatherResponseData?.main?.tempMin?.toStringAsFixed(0)}$degreeSymbol" ??
                                '',
                            style: const TextStyle(
                                fontSize: 14, color: ColorConstants.whiteColor),
                          )
                        ],
                      )
                    ],
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text:
                            "${weatherServiceProviderWatch.weatherResponseData?.main?.temp?.toStringAsFixed(0)}$degreeSymbol",
                        style: const TextStyle(
                            fontSize: 80, color: ColorConstants.whiteColor),
                      ),
                      WidgetSpan(
                        child: Transform.translate(
                          offset: const Offset(1, -28),
                          child: const Text(
                            'C',
                            style: TextStyle(
                                fontSize: 30, color: ColorConstants.whiteColor),
                            textScaleFactor: 1,
                          ),
                        ),
                      )
                    ]),
                  )
                ],
              ),
              20.0.spaceY,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildContainer(
                    assetName: ImageConstants.windImage,
                    value:
                        "${weatherServiceProviderWatch.weatherResponseData?.wind?.speed?.toStringAsFixed(0)} Km/h" ??
                            '',
                    valueName: 'Wind',
                  ),
                  buildContainer(
                    assetName: ImageConstants.humidityImage,
                    value:
                        "${weatherServiceProviderWatch.weatherResponseData?.main?.humidity?.toStringAsFixed(0)} %",
                    valueName: 'Humidity',
                  ),
                ],
              ),
              10.0.spaceY,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildContainer(
                    assetName: ImageConstants.aqiImage,
                    value:
                        "${weatherServiceProviderWatch.weatherResponseData?.main?.humidity?.toStringAsFixed(0)}",
                    valueName: 'AQI',
                  ),
                  buildContainer(
                    assetName: ImageConstants.rainImage,
                    value:
                        "${weatherServiceProviderWatch.weatherResponseData?.main?.humidity?.toStringAsFixed(0)} %",
                    valueName: 'Rain',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainer(
      {required String assetName,
      required String value,
      required String valueName}) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 50,
      width: 154,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorConstants.containerColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset(assetName)),
          10.0.spaceX,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                    color: ColorConstants.whiteColor, fontSize: 15),
              ),
              Text(
                valueName,
                style: const TextStyle(
                    color: ColorConstants.whiteColor, fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}
