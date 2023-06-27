import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:planets_app/Planets_Screen/Controller/planet_controller.dart';
import 'package:planets_app/Planets_Screen/Model/planet_model.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  PlanetController controller = Get.put(PlanetController());

  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    animationController!.repeat();
    animationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              height: 8.h,
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.sp),
                      bottomRight: Radius.circular(10.sp)),
                  color: Colors.blue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    size: 18.sp,
                    color: Colors.white,
                  ),
                  Text(
                    'Galaxy Planets',
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                  Icon(
                    Icons.search,
                    size: 18.sp,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      InkWell(
                        onTap: () {

                         PlanetModel p = PlanetModel(
                            info: '${controller.list[index].info}',
                            img: '${controller.list[index].img}',
                            s: '${controller.list[index].s}',
                            d: '${controller.list[index].d}',
                            name: '${controller.list[index].name}',
                            dis: '${controller.list[index].dis}',
                            dis1: '${controller.list[index].dis1}',
                            index: index
                          );
                          Get.toNamed('view',arguments: p);
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: 25.h,
                          width: 100.w,
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 55.sp),
                            height: 25.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.sp),
                                color: Colors.indigo.shade300),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${controller.list[index].name}',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Milkyway Galaxy',
                                      style: TextStyle(
                                          fontSize: 10.sp, color: Colors.white),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.location_on_rounded,
                                      color: Colors.white60,
                                      size: 15.sp,
                                    ),
                                    Text(
                                      "${controller.list[index].d}",
                                      style: TextStyle(
                                          fontSize: 10.sp, color: Colors.white60),
                                    ),
                                    SizedBox(
                                      width: 0.5.w,
                                    ),
                                    Icon(
                                      Icons.speed,
                                      color: Colors.white60,
                                      size: 15.sp,
                                    ),
                                    Text(
                                      "${controller.list[index].s}",
                                      style: TextStyle(
                                          fontSize: 10.sp, color: Colors.white60),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.7.sp, 0),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 35.sp),
                          child: AnimatedBuilder(
                            animation: animationController!,
                            builder: (context, child) {
                              return Transform.rotate(angle: animationController!.value*pi*2,child: child,);
                            },
                            child: Container(
                              height: 120,
                              width: 120,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ), child: Image.asset(
                                '${controller.list[index].img}',
                               fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: controller.list.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
