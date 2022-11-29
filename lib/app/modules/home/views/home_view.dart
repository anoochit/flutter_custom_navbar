import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('หน้าหลัก'),
            centerTitle: true,
          ),
          body: IndexedStack(
            index: controller.navIndex.value,
            children: const [
              Center(
                child: Text("home"),
              ),
              Center(
                child: Text("wallet"),
              ),
              Center(
                child: Text("noti"),
              ),
              Center(
                child: Text("more"),
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: CustomFloatingActionButton(
            onTap: () {
              // open some page
            },
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            colors: [
              Colors.amber.shade200,
              Colors.amber.shade700,
            ],
            items: [
              CustomNavigationBarItem(
                icon: Icons.home,
                label: 'หน้าหลัก',
                color: (controller.navIndex.value == 0) ? Colors.red : Colors.black,
                onTap: () {
                  controller.setNavIndex(0);
                },
              ),
              CustomNavigationBarItem(
                icon: Icons.wallet,
                label: 'กระเป๋า',
                color: (controller.navIndex.value == 1) ? Colors.red : Colors.black,
                onTap: () {
                  controller.setNavIndex(1);
                },
              ),
              // mock menu do not remove this one
              const SizedBox(
                width: 48,
              ),
              CustomNavigationBarItem(
                icon: Icons.notifications,
                label: 'แจ้งเตือน',
                color: (controller.navIndex.value == 2) ? Colors.red : Colors.black,
                noti: true,
                onTap: () {
                  controller.setNavIndex(2);
                },
              ),
              CustomNavigationBarItem(
                icon: Icons.menu,
                label: 'เพิ่มเติม',
                color: (controller.navIndex.value == 3) ? Colors.red : Colors.black,
                onTap: () {
                  controller.setNavIndex(3);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.items,
    required this.colors,
  }) : super(key: key);

  final List<Widget> items;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3.0,
          ),
        ],
      ),
      child: SizedBox(
        height: 64.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items,
        ),
      ),
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48.0),
      child: Container(
        width: 68,
        height: 68,
        decoration: BoxDecoration(
            color: Colors.red.shade400,
            borderRadius: BorderRadius.circular(
              64.0,
            ),
            border: Border.all(color: Colors.amber.shade50, width: 3.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3.0,
              )
            ]),
        child: InkWell(
          onTap: () => onTap(),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // icon
                const Icon(
                  Icons.qr_code_scanner,
                  size: 32.0,
                  color: Colors.white,
                ),
                // text
                Text(
                  "สแกน",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomNavigationBarItem extends StatelessWidget {
  const CustomNavigationBarItem({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
    required this.color,
    this.noti,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final Color color;
  final bool? noti;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // notification icon dot
          Stack(
            children: [
              Icon(
                icon,
                color: color,
              ),
              ((noti != null) && (noti == true))
                  ? const Positioned(
                      top: 2,
                      right: 2,
                      child: Icon(
                        Icons.circle,
                        size: 8.0,
                        color: Colors.red,
                      ),
                    )
                  : Container()
            ],
          ),
          // text
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
