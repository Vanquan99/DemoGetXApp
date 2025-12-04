import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/data_controller.dart';
import '../routes/route_names.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  void loadingData(DataController controller) {
    Future.delayed(const Duration(seconds: 2), () {
      controller.isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final DataController controller = Get.put(DataController());

    loadingData(controller);
    final double width = MediaQuery.of(context).size.width;

    return Obx(
      () => controller.isLoading
          ? const Scaffold(body: Center(child: CircularProgressIndicator()))
          : Scaffold(
              appBar: AppBar(
                backgroundColor: const Color(0xFFc5e5f3),
              ),
              body: ColoredBox(
                // padding: const EdgeInsets.only(top: 70),
                color: const Color(0xFFc5e5f3),
                child: Column(
                  children: [
                    //james smith
                    Container(
                      width: width,
                      height: 100,
                      margin: const EdgeInsets.only(left: 25, right: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFebf8fd),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage('img/background.jpg'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.dataList[0].name,
                                  style: const TextStyle(
                                      color: Color(0xFF3b3f42),
                                      fontSize: 18,
                                      decoration: TextDecoration.none),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Top Level',
                                  style: TextStyle(
                                      color: Color(0xFFfdebb2),
                                      fontSize: 12,
                                      decoration: TextDecoration.none),
                                ),
                              ],
                            ),
                            Expanded(child: Container()),
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFf3fafc)),
                              child: const Center(
                                child: Icon(
                                  Icons.notifications,
                                  color: Color(0xFF69c5df),
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //popular contest
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Row(
                        children: [
                          const Text(
                            'Popular Contest',
                            style: TextStyle(
                                color: Color(0xFF1f2326),
                                fontSize: 20,
                                decoration: TextDecoration.none),
                          ),
                          Expanded(child: Container()),
                          const Text(
                            'Show all',
                            style: TextStyle(
                                color: Color(0xFFcfd5b3),
                                fontSize: 15,
                                decoration: TextDecoration.none),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFFfdc33c)),
                            child: GestureDetector(),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //list
                    SizedBox(
                      height: 250,
                      child: PageView.builder(
                          controller: PageController(viewportFraction: 0.88),
                          itemCount: controller.dataList.length,
                          itemBuilder: (_, i) {
                            return GestureDetector(
                              onTap: () {
                                // Get.to(() => DetailPage());
                                // Get.toNamed('/detail');
                                Get.toNamed<dynamic>(RouteNames.getDetailPage(i),
                                    arguments: controller.dataList[i]);
                              },
                              child: Container(
                                padding: const EdgeInsets.only(left: 20, top: 20),
                                height: 220,
                                width: MediaQuery.of(context).size.width - 20,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: i.isEven
                                        ? const Color(0xFF69c5df)
                                        : const Color(0xFF9294cc)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          controller.dataList[i].title,
                                          style: const TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                        Expanded(child: Container())
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: width,
                                      child: Text(
                                        controller.dataList[i].text,
                                        style: const TextStyle(fontSize: 20, color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Divider(
                                      thickness: 1.0,
                                    ),

                                    SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            image: DecorationImage(
                                                image: AssetImage(controller.dataList[i].img),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    // Row(children: [
                                    //   for (int i = 0; i < 4; i++)
                                    //     Container(
                                    //       width: 50,
                                    //       height: 50,
                                    //       child: Container(
                                    //         decoration: BoxDecoration(
                                    //             borderRadius: BorderRadius.circular(25),
                                    //             image: DecorationImage(
                                    //                 image: AssetImage(_controller.dataList[i].img),
                                    //                 fit: BoxFit.cover)),
                                    //       ),
                                    //     )
                                    // ]),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //recent contests
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Row(
                        children: [
                          const Text(
                            'Recent Contests',
                            style: TextStyle(
                                color: Color(0xFF1f2326),
                                fontSize: 20,
                                decoration: TextDecoration.none),
                          ),
                          Expanded(child: Container()),
                          const Text(
                            'Show all',
                            style: TextStyle(
                                color: Color(0xFFcfd5b3),
                                fontSize: 15,
                                decoration: TextDecoration.none),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFFfdc33c)),
                            child: GestureDetector(),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.dataList.length,
                          itemBuilder: (_, i) {
                            return GestureDetector(
                              onTap: () {
                                controller.updateTempList(i);
                                Get.toNamed<dynamic>(RouteNames.getDetailPage(i),
                                    arguments: controller.dataList[i]);
                              },
                              child: Container(
                                width: width,
                                height: 100,
                                margin: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xFFebf8fd),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage(controller.dataList[i].img),
                                      ),
                                      // SizedBox(
                                      //   width: 10,
                                      // ),
                                      Expanded(child: Container()),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Status',
                                            style: TextStyle(
                                                color: Color(0xFFfdebb2),
                                                fontSize: 12,
                                                decoration: TextDecoration.none),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          SizedBox(
                                            width: 170,
                                            height: 50,
                                            child: Text(
                                              controller.dataList[i].name,
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                  color: Color(0xFF3b3f42),
                                                  fontSize: 18,
                                                  decoration: TextDecoration.none),
                                            ),
                                          )
                                        ],
                                      ),
                                      Expanded(child: Container()),
                                      SizedBox(
                                        width: 70,
                                        height: 70,
                                        child: Text(
                                          controller.dataList[i].time,
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.none,
                                              color: Color(0xFFb2b8bb)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
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
