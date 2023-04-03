import 'package:flutter/material.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';

import '../../misc/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    size: 30,
                  ),
                  Expanded(child: Container()),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            AppLargeText(text: "Discover"),
            SizedBox(height: 20,),
            Container(
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                tabs: [
                  Tab(text: "Places",),
                  Tab(text: "Inspiration",),
                  Tab(text: "Emotions",),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 300,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Text("Hi"),
                  Text("There"),
                  Text("Bye"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;

    Offset _circleOffset = Offset(configuration.size!.width/2 - radius / 2, configuration.size!.height - radius);

    canvas.drawCircle(offset + _circleOffset, radius, _paint);
  }

}