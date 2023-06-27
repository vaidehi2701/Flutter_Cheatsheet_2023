import 'package:flutter/material.dart';
import 'package:widget_utils/utils/data.dart';

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({super.key});

  @override
  State<TabBarDemo> createState() => TabBarDemoState();
}

class TabBarDemoState extends State<TabBarDemo>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            // 1.Default Tabbar with full width tabbar indicator
            TabBar(
              controller: tabController,
              tabs: tabs,
              labelColor: selectedColor,
              indicatorColor: selectedColor,
              unselectedLabelColor: unselectedColor,
              indicatorSize: TabBarIndicatorSize.tab,
            ),

            // 2.Default Tabbar with text and icon
            TabBar(
              controller: tabController,
              tabs: iconTextTabs,
              labelColor: selectedColor,
              indicatorColor: selectedColor,
              unselectedLabelColor: unselectedColor,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
            ),

            // 3. Tabbar with text and images/gif
            Container(
              height: kToolbarHeight - 8.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TabBar(
                controller: tabController,
                tabs: imageTabs,
                labelColor: selectedColor,
                indicatorColor: selectedColor,
                unselectedLabelColor: unselectedColor,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
              ),
            ),

            // 4. Custom Material Design tabbar used in google's products
            TabBar(
              controller: tabController,
              labelColor: selectedColor,
              unselectedLabelColor: unselectedColor,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: const MaterialDesignIndicator(
                  indicatorHeight: 4, indicatorColor: selectedColor),
              tabs: tabs,
            ),

            // 5.Default Tabbar with indicator width of the label
            TabBar(
              controller: tabController,
              tabs: tabs,
              labelColor: selectedColor,
              indicatorColor: selectedColor,
              unselectedLabelColor: unselectedColor,
              indicatorSize: TabBarIndicatorSize.label,
              dividerColor: Colors.transparent,
            ),

            // 6.Custom Tabbar with solid selected bg and transparent tabbar bg
            Container(
              height: kToolbarHeight - 8.0,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TabBar(
                controller: tabController,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: selectedColor),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: tabs,
              ),
            ),

            // 7.Custom Tabbar with solid selected bg and transparent tabbar bg
            Container(
              height: kToolbarHeight + 8.0,
              padding:
                  const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
              decoration: const BoxDecoration(
                color: selectedColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
              ),
              child: TabBar(
                controller: tabController,
                indicator: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0)),
                    color: Colors.white),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: tabs,
              ),
            ),

            // 8.Custom Tabbar with transparent selected bg and solid selected icon
            TabBar(
              controller: tabController,
              tabs: iconTabs,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.black,
              labelColor: selectedColor,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: selectedColor.withOpacity(0.2),
              ),
            ),

            // 9.Custom Tabbar with transparent selected bg and solid selected text
            TabBar(
              controller: tabController,
              tabs: tabs,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.black,
              labelColor: selectedColor,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: selectedColor.withOpacity(0.2),
              ),
            ),

            // 10.Custom Tabbar with transparent selected bg and solid selected text
            TabBar(
              controller: tabController,
              tabs: tabs,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.black,
              labelColor: selectedColor,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.lightBlue.withOpacity(0.6),
                    Colors.greenAccent.withOpacity(0.6)
                  ]),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.redAccent),
            ),
          ]
              .map((item) => Column(
                    /// Added a divider after each item to let the tabbars have room to breathe
                    children: [
                      item,
                      const Divider(
                        color: Colors.transparent,
                      )
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class MaterialDesignIndicator extends Decoration {
  final double indicatorHeight;
  final Color indicatorColor;

  const MaterialDesignIndicator({
    required this.indicatorHeight,
    required this.indicatorColor,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return MaterialDesignIndicatorPainter(
      indicatorHeight: indicatorHeight,
      indicatorColor: indicatorColor,
    );
  }
}

class MaterialDesignIndicatorPainter extends BoxPainter {
  final double indicatorHeight;
  final Color indicatorColor;

  MaterialDesignIndicatorPainter({
    required this.indicatorHeight,
    required this.indicatorColor,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = Offset(
          offset.dx,
          (configuration.size!.height - indicatorHeight) + offset.dy,
        ) &
        Size(configuration.size!.width, indicatorHeight);
    final Paint paint = Paint()..color = indicatorColor;
    canvas.drawRect(rect, paint);
  }
}
