import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakib/screen/tasbih/tasbih_calculation.dart';
import 'package:sakib/utility/app_colors.dart';
import 'package:sakib/widget/option_app_bar.dart';

class Tasbih extends StatefulWidget {
  const Tasbih({super.key});

  @override
  State<Tasbih> createState() => _TasbihState();
}

class _TasbihState extends State<Tasbih> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: optionAppBar('Tasbih'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                  color: AppColors.primaryBackgroundColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 5),
                        color: Colors.white,
                        spreadRadius: 5,
                        blurRadius: 5)
                  ]),
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: GetBuilder<CounterController>(
                      builder: (counterController) {
                    return Text(
                      counterController.count.toString(),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                    );
                  }),
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -40),
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(20, 30, 40, 20),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 5),
                        color: Colors.white,
                        spreadRadius: 2,
                        blurRadius: 5)
                  ],
                ),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: Get.find<CounterController>().incrementCount,
                      style: ElevatedButton.styleFrom(
                          maximumSize: const Size(80, 80)),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(10, 20, 30, 10),
                            shape: BoxShape.circle),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: Get.find<CounterController>().resetCount,
                      style:
                          ElevatedButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text("Reset"),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
