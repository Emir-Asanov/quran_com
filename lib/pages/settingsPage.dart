import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quran_com/main.dart';
import 'package:quran_com/pages/mainPage.dart';
import 'package:quran_com/storage/myShape.dart';
import 'package:quran_com/storage/themeSettings.dart';
import 'package:rxdart/subjects.dart';

class settingsPage extends StatefulWidget {
  const settingsPage({super.key});

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    BehaviorSubject<int> themeNum = BehaviorSubject()..add(0);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: h,
      width: 650,
      color: appProvider.activityTheme.value.colorFour,
      child: ListView(
        children: [
          SizedBox(
            width: 650,
            child: Column(
              children: [
                Container(
                  color: appProvider.activityTheme.value.colorOne,
                  height: 65,
                  width: 650,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Settings',
                          style: TextStyle(
                              fontSize: 23,
                              color: appProvider.activityTheme.value.colorFour),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset('icons/exit.svg'))
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Theme',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: 500,
                    height: 40,
                    decoration: BoxDecoration(
                      color: appProvider.activityTheme.value.colorOne,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: StreamBuilder<Object>(
                        stream: themeNum,
                        builder: (context, snapshot) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: InkWell(
                                  onTap: () {
                                    appProvider.themeChange(classicTheme);
                                    themeNum.add(0);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(180),
                                      color: snapshot.data != 0
                                          ? Colors.transparent
                                          : Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Classic',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: snapshot.data != 0
                                              ? appProvider
                                                  .activityTheme.value.colorFour
                                              : appProvider
                                                  .activityTheme.value.colorOne,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  height: 36,
                                  width: 1,
                                  color: Colors.white,
                                ),
                                Expanded(
                                    child: InkWell(
                                  onTap: () {
                                    themeNum.add(1);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(180),
                                      color: snapshot.data != 1
                                          ? Colors.transparent
                                          : Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Light',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: snapshot.data != 1
                                              ? appProvider
                                                  .activityTheme.value.colorFour
                                              : appProvider
                                                  .activityTheme.value.colorOne,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  height: 36,
                                  width: 1,
                                  color: Colors.white,
                                ),
                                Expanded(
                                    child: InkWell(
                                  onTap: () {
                                    appProvider.themeChange(darkTheme);
                                    themeNum.add(2);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(180),
                                      color: snapshot.data != 2
                                          ? Colors.transparent
                                          : Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Dark',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: snapshot.data != 2
                                              ? appProvider
                                                  .activityTheme.value.colorFour
                                              : appProvider
                                                  .activityTheme.value.colorOne,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    width: w * 0.45,
                    height: 1,
                    color: const Color.fromARGB(165, 158, 158, 158),
                  ),
                ),
                Row(
                  children: [
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Quran font',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 20, top: 20, bottom: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Font Style',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Font Size',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: SizedBox(
                        width: 500,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 40,
                              width: 400,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      appProvider.activityTheme.value.colorOne),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Lorem ipsum dolor sit amet consectetur',
                                    style: TextStyle(
                                        color: appProvider
                                            .activityTheme.value.colorFour),
                                  ),
                                  SvgPicture.asset('icons/stroke.svg')
                                ],
                              )),
                            ),
                            SizedBox(
                              height: 48,
                              width: 500,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('10'),
                                  Container(
                                    width: 350,
                                    child: Expanded(
                                      child: SliderTheme(
                                        data: SliderTheme.of(context).copyWith(
                                          trackHeight: 6,
                                          thumbShape:
                                              AppSliderShape(thumbRadius: 0),
                                          activeTrackColor: appProvider
                                              .activityTheme.value.colorTwo,
                                          inactiveTrackColor:
                                              const Color.fromARGB(
                                                  255, 213, 213, 213),
                                        ),
                                        child: Slider(
                                          value: appProvider
                                              .arabicFontSize.value
                                              .toDouble(),
                                          max: 100,
                                          min: 10,
                                          divisions: 90,
                                          onChanged: (double value) {
                                            appProvider.sizeArabicChange(value);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text('100'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(
                    'Preview',
                    style: TextStyle(
                        color: appProvider.activityTheme.value.colorOne,
                        fontSize: 18),
                  ),
                ),
                Container(
                  height: 130,
                  width: 500,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: appProvider.activityTheme.value.colorOne)),
                  child: Center(
                    child: Text(
                      'وريم إيبسوم دولور الجلوس أميت كونسيكتور. لوريم إي',
                      style:
                          TextStyle(fontSize: appProvider.arabicFontSize.value),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 40),
                    width: w * 0.45,
                    height: 1,
                    color: const Color.fromARGB(165, 158, 158, 158),
                  ),
                ),
                Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Translation font',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 20, top: 20, bottom: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Font Style',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Font Size',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: SizedBox(
                        width: 450,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 40,
                              width: 400,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      appProvider.activityTheme.value.colorOne),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Lorem ipsum dolor sit amet consectetur',
                                    style: TextStyle(
                                        color: appProvider
                                            .activityTheme.value.colorFour),
                                  ),
                                  SvgPicture.asset('icons/stroke.svg')
                                ],
                              )),
                            ),
                            SizedBox(
                              height: 48,
                              width: 400,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('10'),
                                  Container(
                                    width: 350,
                                    child: Expanded(
                                      child: SliderTheme(
                                        data: SliderTheme.of(context).copyWith(
                                          trackHeight: 6,
                                          thumbShape:
                                              AppSliderShape(thumbRadius: 0),
                                          activeTrackColor: appProvider
                                              .activityTheme.value.colorTwo,
                                          inactiveTrackColor:
                                              const Color.fromARGB(
                                                  255, 213, 213, 213),
                                        ),
                                        child: Slider(
                                          value: appProvider.mainFontSize.value
                                              .toDouble(),
                                          max: 100,
                                          min: 10,
                                          divisions: 90,
                                          onChanged: (double value) {
                                            setState(() {
                                              appProvider.sizeMainChange(value);
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text('100'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(
                    'Preview',
                    style: TextStyle(
                        color: appProvider.activityTheme.value.colorOne,
                        fontSize: 18),
                  ),
                ),
                Container(
                  height: 130,
                  width: 500,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: appProvider.activityTheme.value.colorOne)),
                  child: Center(
                    child: Text(
                      'Lorem ipsum dolor sit amet consectetur. Duis convallis egestas sapien tincidunt quis faucibus.',
                      style:
                          TextStyle(fontSize: appProvider.mainFontSize.value),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 40),
                    width: w * 0.45,
                    height: 1,
                    color: const Color.fromARGB(165, 158, 158, 158),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Translation Preferences',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
