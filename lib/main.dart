import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:openwhyd_app/constants/route_names.dart';
import 'package:openwhyd_app/constants/route_observer.dart';
import 'package:openwhyd_app/ui/add_track_view/add_track_view.dart';
import 'package:openwhyd_app/ui/home_view/home_view.dart';
import 'package:openwhyd_app/ui/profile_view/profile_view.dart';
import 'package:openwhyd_app/ui/search_and_discovery_view.dart/search_and_discovery_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Openwhyd Mobile',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: Colors.grey
        ),
        initialRoute: RouteNames.home,
        navigatorObservers: [AppRouteObserver()],
        routes: {RouteNames.home: (_) => MainApp()});
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var _selectedPage = 0;
  final PageController controller = PageController(initialPage: 0);
  final MenuPositionController menuPositionController =
      MenuPositionController(initPosition: 0);
  void _onTappedBar(int value) {
    setState(() {
      _selectedPage = value;
    });
    controller.jumpToPage(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Openwhyd"),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        onPageChanged: (page) {
          setState(() {
            _selectedPage = page;
          });
          menuPositionController.animateToPosition(page);
        },
        children: [HomeView(), AddTrackView(), SearchAndDiscoveryView(), ProfileView()],
      ),
      bottomNavigationBar: BubbledNavigationBar(
        defaultBubbleColor: Colors.black54,
        onTap: _onTappedBar,
        controller: menuPositionController,
        animationDuration: Duration(milliseconds: 500),
        items: [
          BubbledNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home", style: TextStyle(color: Colors.white),),
          ),
          BubbledNavigationBarItem(
            icon: Icon(Icons.playlist_add),
            title: Text("Add Track", style: TextStyle(color: Colors.white),),
          ),
          BubbledNavigationBarItem(
              icon: Icon(Icons.search), title: Text("Discovery", style: TextStyle(color: Colors.white),)),
          BubbledNavigationBarItem(
              icon: Icon(Icons.person), title: Text("Profile", style: TextStyle(color: Colors.white),)),
        ],
      ),
    );
  }
}
