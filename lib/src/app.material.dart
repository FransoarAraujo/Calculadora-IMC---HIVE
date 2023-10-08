import 'package:flutter/material.dart';
import 'package:imc_calculator/src/pages/history.dart';
import 'package:imc_calculator/src/pages/home.imc.dart';

class AppMaterial extends StatelessWidget {
  const AppMaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const TabViewPage(),
    );
  }
}

class TabViewPage extends StatefulWidget {
  const TabViewPage({Key? key}) : super(key: key);

  @override
  _TabViewPageState createState() => _TabViewPageState();
}

class _TabViewPageState extends State<TabViewPage> {
  late List<Widget> _tabPages;
  late List<String> _tabTitles;

  @override
  void initState() {
    super.initState();
    _tabPages = [
      const HomeImcPage(),
      const HistoriPage(),
    ];

    _tabTitles = [
      'IMC Calculator',
      'History',
    ];
  }

@override
Widget build(BuildContext context) {
  return DefaultTabController(
    length: _tabPages.length,
    child: Scaffold(

      body: TabBarView(
        children: _tabPages,
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            tabs: _tabTitles.map((title) => Tab(text: title)).toList(),
          ),
          const Divider(
            height: 1,
            color: Colors.grey, 
          ),
        ],
      ),
    ),
  );
}


}
