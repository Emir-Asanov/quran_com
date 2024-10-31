import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quran_com/main.dart';
import 'package:quran_com/pages/homePage.dart';
import 'package:quran_com/pages/settingsPage.dart';
import 'package:quran_com/pages/userPage.dart';
import 'package:quran_com/pages/stream.dart';
import 'package:rxdart/rxdart.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    BehaviorSubject<int> numPage = BehaviorSubject<int>();
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      drawer: settingsPage(),
      body: Container(
        width: w,
        height: h,
        color: appProvider.activityTheme.value.colorFour,
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 65,
              color: appProvider.activityTheme.value.colorOne,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: Text(
                        'Коран Онлайн',
                        style: TextStyle(
                          color: appProvider.activityTheme.value.colorFour,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: IconButton(
                            onPressed: () {
                              numPage.add(0);
                            },
                            icon: SvgPicture.asset(
                              'icons/home.svg',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  numPage.add(1);
                                });
                              },
                              icon: SvgPicture.asset('icons/user.svg')),
                        ),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: IconButton(
                              onPressed: () {
                                scaffoldKey.currentState?.openDrawer();
                              },
                              icon: SvgPicture.asset('icons/settings.svg')),
                        ),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset('icons/search.svg')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    alignment: Alignment(1, -0.9),
                                    child: Expanded(
                                      child: Container(
                                        width: 80,
                                        height: 100,
                                        color: Colors.red,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: SizedBox(
                              width: 100,
                              height: 40,
                              child: Row(
                                children: [
                                  SvgPicture.asset('icons/earth.svg'),
                                  Text(
                                    appProvider.userLanguage.value,
                                    style: TextStyle(
                                      color: appProvider
                                          .activityTheme.value.colorFour,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            StreamBuilder(
              stream: numPage,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Container(
                    width: w,
                    height: h - 65,
                    child: () {
                      switch (snapshot.data) {
                        case 0:
                          return homePage();
                        case 1:
                          return userPage();
                        case 2:
                          return settingsPage();
                        default:
                          return homePage();
                      }
                    }());
              },
            ),
          ],
        ),
      ),
    );
  }
}
