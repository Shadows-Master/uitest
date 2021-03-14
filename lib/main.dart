import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/balance_widget.dart';
import 'components/details_card.dart';
import 'components/tab_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.montserrat().fontFamily
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController _mTabController;
  final List<String> _months = ['January', 'February', 'March', 'April'];
  final List<String> _mTabMenus = ['Day', 'Week', 'Month', '3 Months'];
  final List<double> data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  String date;
  int index = 0;

  @override
  void initState() {
    _mTabController = TabController(length: _mTabMenus.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              monthWidget(size),
              TabChart(size: size, mTabController: _mTabController, mTabMenus: _mTabMenus, data: data),
              BalanceWidget(),
              Container(
                height: 500,
                margin: EdgeInsets.symmetric(vertical: 15),
                child: GridView.count(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  crossAxisCount: 3,
                  childAspectRatio: .8,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: [
                    DetailsCard(title: 'Shopping', amount: '12727', percent: '18.2',),
                    DetailsCard(title: 'Food&Drinks', amount: '1987', percent: '2.8', icon: FontAwesomeIcons.hamburger, iconColor: Colors.amber,),
                    DetailsCard(
                      title: 'Travel', amount: '24502',
                      icon: Icons.airplanemode_active, iconColor: Colors.lightBlue,
                      containerColor: Colors.lightBlue, percent: '34.9',
                    ),
                    DetailsCard(
                      title: 'Fuel', amount: '2310',
                      iconColor: Colors.green, icon: FontAwesomeIcons.gasPump,
                      containerColor: Colors.green, percent: '3.3',
                    ),
                    DetailsCard(
                      title: 'EMI', amount: '25754',
                      iconColor: Colors.pink, icon: Icons.bar_chart,
                      containerColor: Colors.pink, percent: '36.7',
                    ),
                    DetailsCard(
                      title: 'Others', amount: '2830',
                      iconColor: Colors.indigo, icon: Icons.layers,
                      containerColor: Colors.indigo, percent: '4.0',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Container monthWidget(Size size) {
    return Container(
      margin: EdgeInsets.only(top: size.height * .05, left: size.width*.03),
      width: size.width * .48,
      child: DropdownButtonFormField(
        value: date,
        decoration: InputDecoration(
            border: UnderlineInputBorder(
                borderSide: BorderSide(width: 0, color: Colors.transparent),
                borderRadius: BorderRadius.circular(5))),
        items: _months.map((month) => DropdownMenuItem(
          value: month,
          child: Text(
            month,
            style: TextStyle(
                fontFamily: GoogleFonts.raleway().fontFamily,
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Colors.black
            ),
          ),
        )
        ).toList(),
        hint: Text(
          'Select the month',
          style: TextStyle(
              fontSize: 16,
              fontFamily: GoogleFonts.raleway().fontFamily,
              color: Colors.grey
          ),
        ),
        onChanged: (String value){
          setState(() {
            date = value;
          });
        },
      )
    );
  }
}
