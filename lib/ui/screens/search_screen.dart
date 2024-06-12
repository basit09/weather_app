import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_task/infrastructure/commons/constants/color_constants.dart';
import 'package:weather_app_task/infrastructure/provider/provider_registration.dart';
import 'package:weather_app_task/ui/screens/common_widgets/common_background_widget.dart';
import 'package:weather_app_task/ui/screens/home_screen.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherServiceProviderRead = ref.read(weatherServiceProvider);
    final weatherServiceProviderWatch = ref.watch(weatherServiceProvider);
    return Scaffold(
      body: CommonBackgroundContainer(
        childWidget: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
              child: TextField(
                onSubmitted: (value) async {
                  await weatherServiceProviderRead
                      .getWeatherDataAPI(
                          name: searchController.text.toLowerCase(), context)
                      .then(
                    (value) {
                      if (value == null) {
                        return ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Server not found')));
                      } else {
                        return Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      }
                    },
                  );
                  searchController.clear();
                },
                controller: searchController,
                style: const TextStyle(color: ColorConstants.whiteColor),
                decoration: InputDecoration(
                  hintText: 'Search your city',
                  hintStyle: const TextStyle(color: ColorConstants.whiteColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
