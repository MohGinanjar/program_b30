import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:program_b30/app/modules/home/views/echart.dart';
import 'package:program_b30/app/modules/home/views/line_area_point.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("BIODIESEL (BXX)",style: TextStyle(color: Colors.grey),),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: controller.page,
            // onDisplayModeChanged: (mode) {
            //   print(mode);
            // },
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedColor: Color.fromARGB(255, 235, 214, 32),
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
              // backgroundColor: Colors.blueGrey[700]
            ),
            title: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
                  ),
                  child: Image.asset(
                    'assets/logob20_120x59.png',
                  ),
                ),
                const Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'b30',
                style: TextStyle(fontSize: 15),
              ),
            ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'Dashboard (BXX)',
                onTap: () {
                 controller. page.jumpToPage(0);
                },
                icon: const Icon(Icons.home),
                badgeContent: const Text(
                  '3',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SideMenuItem(
                priority: 1,
                title: 'Penagihan',
                onTap: () {
                 controller. page.jumpToPage(1);
                },
                icon: const Icon(Icons.attach_money_outlined),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Pembayaran',
                onTap: () {
                 controller.page.jumpToPage(2);
                },
                icon: const Icon(Icons.attach_money_outlined),
              ),
              SideMenuItem(
                priority: 3,
                title: 'Exit',
                onTap: () {
               controller.   page.jumpToPage(3);
                },
                icon: const Icon(Icons.exit_to_app),
              ),
              
            ],
          ),
          Expanded(
            child: PageView(
              controller: controller. page,
              children: [
                Container(
                  color: Colors.white,
                  child:  ListView(
                    shrinkWrap: true,
                    children:[
                       Container(
                        height: Get.height /2.5,
                        child: EchartsPage()),
                        Container(
                        height: Get.height /2.2,
                        child: LineAreaPointPage())
                        
                    ,
               ] ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Penagihan',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Pembayaran',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Exit',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
