import 'package:events_app/components/Drawer&Appbar&bottomNavBar/appbar_building.dart';
import 'package:events_app/components/Drawer&Appbar&bottomNavBar/custome_drawer.dart';
import 'package:events_app/core/constants/theme.dart';
import 'package:events_app/view/booking/main_booking_page.dart';
import 'package:events_app/view/home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  //========================================
  int _currentIndexBottom = 0;
  bool isButtomNavPressed = false;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SecondPage(),
    //here u will go to ADD page and also in the + button u gonna go to Add page
    Text('ADD'),
    SecondPage(),
    Text('Profile'),
  ];

  void _onItemTappedBottom(int index) {
    setState(() {
      isButtomNavPressed = true;
      //to make the lightest page in drawer is the HOME PAGE
      _selectedIndex = 0;
      _currentIndexBottom = index;
    });
  }

  //========================================
  int _selectedIndex = 0;

  final Color _selectedColor = ThemesStyles.primary;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final List<Widget> _pages = [
    const HomePage(),
    const AdminsPage(),
    //const ReportsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          //backgroundColor: Themes.background,
          key: scaffoldKey,
          drawer: DrawerWidget(
            selectedIndex: _selectedIndex,
            onItemTapped: _onItemTapped,
            selectedColor: _selectedColor,
          ),
          appBar: appBarBuilding(context, scaffoldKey),
          body: isButtomNavPressed
              ? Center(child: _widgetOptions[_currentIndexBottom])
              : Row(
                  children: [
                    // Page Content
                    Expanded(
                      child: _pages[_selectedIndex],
                    ),
                  ],
                ),
          // bottomNavigationBar: const BottomNavBar(),
          bottomNavigationBar:
              // BottomNavPage(
              //   currentIndex: _currentIndexBottom,
              // ),
              BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.receipt_long_outlined,
                ),
                label: 'Reservations',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.event,
                ),
                label: 'PublicEvents'.tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: 'search',
              ),
            ],
            currentIndex: _currentIndexBottom,
            onTap: _onItemTappedBottom,
          ),
        ),

        //====================== + button==================
        Positioned(
          bottom: 25,
          left: MediaQuery.sizeOf(context).width * 0.44,
          child: ElevatedButton(
            onPressed: () {
              //Go to Adding Page
              Get.to(MainBookingPage());
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  300.0,
                ), // Adjust the border radius as needed
              ),
              backgroundColor: ThemesStyles.primary,
              padding: const EdgeInsets.all(20),
            ),
            child: const Icon(
              Icons.add,
              color: ThemesStyles.thirdColor,
            ),
          ),
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      isButtomNavPressed = false;
      _selectedIndex = index;
    });
  }
}

class AdminsPage extends StatelessWidget {
  const AdminsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("sssss");
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("First Page");
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Second Page");
  }
}
