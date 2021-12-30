import 'dart:async';
import 'package:edvoy_app/route_setup.dart';
import 'package:edvoy_app/themes/app_colors.dart';
import 'package:edvoy_app/themes/theme.dart';
import 'package:edvoy_app/util/util.dart';
import 'package:edvoy_app/view/chat_view.dart';
import 'package:edvoy_app/view/edvoy_drawer.dart';
import 'package:edvoy_app/view/edvoy_home_view.dart';
import 'package:edvoy_app/view/search_view.dart';
import 'package:edvoy_app/view/shortlist_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

final heroController = HeroController();


class MyApp extends StatelessWidget
{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'edvoy',
        theme: CustomAppTheme.lightAppTheme,
        darkTheme: CustomAppTheme.darkAppTheme,
        onGenerateRoute: RouterViews.generateRoute,
        navigatorObservers: [routeObserver,heroController],
        home: SplashScreen(),
        );
  }

}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {


  @override
  void initState() {
    try {
      super.initState();
      Future.delayed(Duration.zero, ()
      {
        hideKeyBoard(context);
        startTime();
      });
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:
                [
                  Image.asset('assets/images/edvoy_app_logo.png'),
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }


  startTime() async
  {
      var _duration = const Duration(seconds: 2);
      return Timer(_duration, _navigationPage);
  }

  _navigationPage() {
    try {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => const MyHomePage()));
    }
    catch (e) {
      print(e);
    }
  }
}


class MyHomePage extends StatefulWidget
{
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver
{
  var selectedIndex = 0;
  GlobalKey bottomGlobalKey = GlobalKey();
  bool bottomVisibleStatus = true;

  @override
  void initState()
  {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state)
  {
    if (state == AppLifecycleState.resumed)
    {
      _bottomLayout();
    }
  }

  _bottomLayout()
  {
    List<BottomNavigationBarItem> _bottomBarOptions = [
      _bottomNavigationBarItem(
          active: const Icon(
            Icons.language_outlined,
            size: 32,
          ),
          normal: const Icon(
            Icons.language_outlined,
            size: 32,
            color: Colors.black,
          ),
          title: "Explore"),
      _bottomNavigationBarItem(
          active: const Icon(
            Icons.search_outlined,
            size: 32,
          ),
          normal: const Icon(
            Icons.search_outlined,
            size: 32,
            color: Colors.black,
          ),
          title: "Search"),
      _bottomNavigationBarItem(
          active: const Icon(
            Icons.favorite_border_outlined,
            size: 32,
          ),
          normal: const Icon(
            Icons.favorite_border_outlined,
            size: 32,
            color: Colors.black,
          ),
          title: "Shortlist"),
      _bottomNavigationBarItem(
          active: const Icon(
            Icons.chat_outlined,
            size: 32,
          ),
          normal: const Icon(
            Icons.chat_outlined,
            size: 32,
            color: Colors.black,
          ),
          title: "Chat"),
    ];

    List<Widget> _children =
    [
      const EdvoyHomeView(),
      const SearchView(),
      const ShortListView(),
      const ChatView()

    ];

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: _children[selectedIndex],
      drawer: const EdvoyDrawer(),
      bottomNavigationBar: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          child: bottomVisibleStatus
              ? Wrap(
            children: <Widget>
            [
              Container(
                height: 0.4,
                color: Colors.grey,
              ),
              BottomNavigationBar(
                  key: bottomGlobalKey,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.red,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  currentIndex: selectedIndex,
                  items: _bottomBarOptions),
            ],
          )
              : Container(
            color: Theme.of(context).backgroundColor,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      );
  }

  _bottomNavigationBarItem({required Icon normal, required Icon active, required String title})
  {
    return BottomNavigationBarItem(
      backgroundColor: buttonStart,
      icon: normal,
      label: title,
      activeIcon: active,
    );
  }


  @override
  Widget build(BuildContext context)
  {
    return _bottomLayout();
  }

}
