 import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/AppColors.dart';
import '../core/util/app_consts.dart';
// import '../featurs/homeScreen/data/models/add_profile_model.dart';
 import '../helper/nav.dart';
import '../route/paths.dart';
import 'custom_card.dart';

// class CustomCarousel extends StatelessWidget {
//   final List<Movie> list;
//   final bool isLoading;
//
//   const CustomCarousel({Key? key, required this.list, required this.isLoading});
//
//   @override
//   Widget build(BuildContext context) {
//     if (list.isEmpty || isLoading) {
//       return  Container(
//         height: MediaQuery.of(context).size.height/8,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.center,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0x00000000),
//               AppColors.blackColor,
//             ],
//           ),
//         ),
//         child: const CupertinoActivityIndicator( ),
//       ); // Show a loading indicator
//     } else {
//       return CarouselSlider.builder(
//         itemCount: list.length,
//         itemBuilder: (BuildContext context, int itemIndex, int) {
//           final movies = list.reversed.toList();
//           final movie = movies[itemIndex];
//
//           return GestureDetector(
//             child: Card(
//               color: Colors.transparent,
//
//               elevation: 2,
//               // color:  AppColors.blackColor.withOpacity(0.5),
//               child:   CustomCard(
//                         image: movie.posterUrl,
//
//
//                     ),
//                   // ),
//
//
//             ),
//             onTap: () {
//               // Get.to(DetailPage(movie));
//
//               NavigationHelper.navigateTo(context, AppPaths. detailsScreen,
//                   arguments: movie.toMap());
//             },
//           );
//         },
//         options: CarouselOptions(
//
//           height: 200.0.h,
//           // viewportFraction: .8,
//
//           aspectRatio: 16/9,
//           viewportFraction: 0.8,
//           autoPlay: true,
//            autoPlayCurve: Curves.fastOutSlowIn,
//           enlargeCenterPage: true,
//           enlargeFactor: 0.3,
//         ),
//       );
//     }
//   }
// }

