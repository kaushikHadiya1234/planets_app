import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:planets_app/Planets_Screen/Controller/planet_controller.dart';
import 'package:planets_app/Planets_Screen/Model/planet_model.dart';
import 'package:sizer/sizer.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen>
    with SingleTickerProviderStateMixin {
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

  PlanetModel p = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo.shade400,
        body: Center(
          child: Column(
            children: [
              Container(
                height: 35.h,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                        height: 25.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.sp),
                            color: Colors.indigo.shade300),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${p.name}',
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Milkyway Galaxy',
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.white),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/images/icd.png',
                                      height: 3.h,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      "${p.d}",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.white60),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/images/icg.png',
                                      height: 3.h,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      "${p.s}",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.white60),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                          ],
                        )),
                    Align(
                      alignment: Alignment(0, -0.8),
                      child: AnimatedBuilder(
                          animation: animationController!,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: animationController!.value * pi * 2,
                              child: child,
                            );
                          },
                          child: Container(
                              height: 120,
                              width: 120,
                              child: Image.asset(
                                '${p.img}',
                                height: 20.h,
                              ))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                'Over View',
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                height: 25.h,
                width: 90.w,
                child: Text(
                  "${p.info}",
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return BottomSheet(
                        backgroundColor: Colors.indigo.shade300,
                        onClosing: () {},
                        builder: (context) {
                          return Container(
                            height: 350,
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              children: [
                                Container(
                                  height: 60,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      color: Colors.blue),
                                  child: Text(
                                    "Welcome to ${p.name}",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.asset(
                                      '${p.img}',
                                      height: 20.h,
                                    )),
                                SizedBox(height: 10),
                                Text('Distance to sun',style: TextStyle(fontSize: 13.sp,color: Colors.white60),),
                                SizedBox(height: 5),
                                Text('${p.dis}',style: TextStyle(fontSize: 16.sp,color: Colors.white),),
                                SizedBox(height: 10),
                                Text('Distance to sun',style: TextStyle(fontSize: 13.sp,color: Colors.white60),),
                                SizedBox(height: 5),
                                Text('${p.dis1}',style: TextStyle(fontSize: 16.sp,color: Colors.white),)
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                child: Container(
                  height: 8.h,
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.sp),
                          topRight: Radius.circular(15.sp)),
                      color: Colors.blue),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "< Back",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
