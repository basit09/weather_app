// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:promo_sphere/infrastructure/commons/exports/common_exports.dart';
// import 'package:promo_sphere/ui/screens/chat_screen/chat_screen.dart';
// import 'package:promo_sphere/ui/screens/contract_screen/contract_screen.dart';
// import 'package:promo_sphere/ui/screens/home_screen/home_screen.dart';
// import 'package:promo_sphere/ui/screens/offer_screen/offer_screen.dart';
// import 'package:promo_sphere/ui/screens/saved_screen/saved_screen.dart';
// import 'package:weather_app_task/infrastructure/commons/constants/color_constants.dart';
// import 'package:weather_app_task/ui/screens/search_screen.dart';
//
// import 'home_screen.dart';
//
// TabController? tabController;
//
// class DashboardScreen extends ConsumerStatefulWidget {
//   const DashboardScreen({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   ConsumerState createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends ConsumerState<DashboardScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // tabController = TabController(
//     //   length: 4,
//     //   initialIndex: 0,
//     //   vsync: this,
//     // );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final dashboardProviderWatch = ref.watch(dashboardProvider);
//     final dashboardProviderRead = ref.read(dashboardProvider);
//     return DefaultTabController(
//       length: 5,
//       initialIndex: dashboardProviderWatch.selectedIndex,
//       child: SafeArea(
//         child: Scaffold(
//           body: IndexedStack(
//             index: dashboardProviderWatch.selectedIndex,
//             children: const [
//               HomeScreen(),
//               SearchScreen(),
//             ],
//           ),
//           bottomNavigationBar: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
//                   color: ColorConstants.whiteColor,
//                   boxShadow: [
//                     BoxShadow(
//                       color: ColorConstants.blackColor.withOpacity(0.1),
//                       spreadRadius: 1,
//                       blurRadius: 10,
//                       offset: const Offset(0, 0),
//                     ),
//                   ],
//                 ),
//                 child: TabBar(
//                   dividerHeight: 0.0,
//                   controller: tabController,
//                   labelColor: ColorConstants.navLabelColor,
//                   physics: const NeverScrollableScrollPhysics(),
//                   dragStartBehavior: DragStartBehavior.down,
//                   onTap: (index) {
//                     dashboardProviderRead.changeTab(value: index, isEndEvent: true);
//                   },
//                   indicatorColor: ColorConstants.transparentColor,
//                   indicatorSize: TabBarIndicatorSize.tab,
//                   labelStyle: const TextStyle(
//                     fontSize: 13.0,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   // indicator: BoxDecoration(
//                   //   color: ColorConstants.primaryColor.withOpacity(0.2),
//                   //   shape: BoxShape.circle,
//                   // ),
//                   tabs: <Widget>[
//                     Tab(text: 'Home', icon: Image.asset(ImageConstants.homeIcon)),
//                     Tab(text: 'Contract', icon: Image.asset(ImageConstants.contractIcon)),
//                     Tab(text: 'Add Offer', icon: Image.asset(ImageConstants.offerIcon)),
//                     Tab(text: 'Chat', icon: Image.asset(ImageConstants.chatIcon)),
//                     Tab(text: 'Saved', icon: Image.asset(ImageConstants.savedIcon)),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
