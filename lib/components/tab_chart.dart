import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:google_fonts/google_fonts.dart';

class TabChart extends StatelessWidget {
  const TabChart({
    Key key,
    @required this.size,
    @required TabController mTabController,
    @required List<String> mTabMenus,
    @required this.data,
  }) : _mTabController = mTabController, _mTabMenus = mTabMenus, super(key: key);

  final Size size;
  final TabController _mTabController;
  final List<String> _mTabMenus;
  final List<double> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height*.25,
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(top: size.height * .05),
      child: Column(
        children: [
          TabBar(
            controller: _mTabController,
            tabs: _mTabMenus.map((menu ) => Tab(text: menu,)).toList(),
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black87,
            labelPadding: EdgeInsets.only(right: 2, left: 2),
            labelStyle: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontSize: 15),
            indicator: BubbleTabIndicator(
                indicatorColor: Colors.green.withOpacity(.3),
                indicatorHeight: size.height*.039,
                tabBarIndicatorSize: TabBarIndicatorSize.tab
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _mTabController,
              children: _mTabMenus.map((content) => Container(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Sparkline(
                    data: data,
                    lineColor: Colors.green,
                  ),
                ),
              )).toList(),
            ),
          )
        ],
      ),
    );
  }
}