import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quran_com/main.dart';
import 'package:speech_to_text/speech_to_text.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final SpeechToText speech = SpeechToText();
  bool _isListening = false;
  final TextEditingController controller = TextEditingController();

  void _startListening() async {
    bool hasSpeech = await speech.initialize(
      onStatus: (status) {
        print('Current status: $status');
      },
    );

    if (hasSpeech) {
      await speech.listen(onResult: (result) {
        setState(() {
          controller.text = result.recognizedWords;
        });
      });
      setState(() {
        _isListening = true;
      });
    } else {
      print('Speech not available');
    }
  }

  void _stopListening() async {
    await speech.stop();
    setState(() {
      _isListening = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    int number = -2;
    return ListView(
      children: [
        SizedBox(
          height: 270,
          width: w,
          child: Stack(
            children: [
              Container(
                height: 270,
                width: w,
                color: appProvider.activityTheme.value.colorTwo,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: w * 0.09),
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: SvgPicture.asset(
                            'images/logo_white.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.5,
                        child: Column(children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Коран Онлайн',
                              style: TextStyle(
                                  color:
                                      appProvider.activityTheme.value.colorFour,
                                  fontSize: 48,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Коран, переводы и толкования смыслов Коран - божественное руководство для человечества, последнее Священное Писание, ниспосланное Всевышним Аллахом. «Это Писание, в котором нет сомнения, является верным руководством для богобоязненных» (2:2).',
                              style: TextStyle(
                                  color:
                                      appProvider.activityTheme.value.colorFive,
                                  fontSize: 15,
                                  decoration: TextDecoration.none,
                                  height: 2),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 440,
                              height: 42,
                              decoration: BoxDecoration(
                                  color:
                                      appProvider.activityTheme.value.colorFour,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(width: 1)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        print(1);
                                      },
                                      child: const SizedBox(
                                          width: 40,
                                          height: 42,
                                          child: Icon(Icons.search)),
                                    ),
                                    Expanded(
                                        child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 12.0),
                                        child: TextField(
                                          controller: controller,
                                          decoration: InputDecoration(
                                            hintText:
                                                'Введите текст для поиска...',
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    )),
                                    SizedBox(
                                        width: 40,
                                        height: 42,
                                        child: InkWell(
                                          onTap: _isListening
                                              ? _stopListening
                                              : _startListening,
                                          child: SvgPicture.asset(
                                            'icons/micro.svg',
                                            height: 25,
                                            width: 25,
                                            fit: BoxFit.none,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
              IgnorePointer(
                child: Image.asset(
                  'images/logo2.png',
                  width: w,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120.0),
          child: Column(children: () {
            List<Widget> list = [
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 8),
                child: Text(
                  'القرآن الكريم',
                  style: TextStyle(
                      color: appProvider.activityTheme.value.colorOne,
                      fontSize: 34,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Text(
                'Священный Коран',
                style: TextStyle(
                    color: appProvider.activityTheme.value.colorOne,
                    fontSize: 34,
                    fontWeight: FontWeight.w700),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: w,
                height: 2,
                color: appProvider.activityTheme.value.colorFour,
              ),
            ];

            List<Widget> generateList = List.generate(50, (index) {
              number = number + 3;
              return Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: w * 0.2,
                      height: 125,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'الفاتحة',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 21),
                              ),
                              Text(
                                'Lorem Ipsum',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17),
                              ),
                              Text(
                                'Surah 1 | Ayah 23 | Mecca',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 13),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(180)),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    number.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: w * 0.2,
                      height: 125,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'الفاتحة',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 21),
                              ),
                              Text(
                                'Lorem Ipsum',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17),
                              ),
                              Text(
                                'Surah 1 | Ayah 23 | Mecca',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 13),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(180)),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    (number + 1).toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: w * 0.2,
                      height: 125,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'الفاتحة',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 21),
                              ),
                              Text(
                                'Lorem Ipsum',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17),
                              ),
                              Text(
                                'Surah 1 | Ayah 23 | Mecca',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 13),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(180)),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    (number + 2).toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            });
            list.addAll(generateList);

            return list;
          }()),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          width: w,
          height: 2,
          color: appProvider.activityTheme.value.colorFour,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Align(
              alignment: Alignment.center,
              child: Text(
                'Скачать: quran.pdf (10mb)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
        ),
        Center(
          child: InkWell(
              onTap: () {},
              child: Container(
                  width: 250,
                  height: 45,
                  decoration: BoxDecoration(
                      color: appProvider.activityTheme.value.colorOne,
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: Text(
                      'DOWNLOAD',
                      style: TextStyle(
                          color: appProvider.activityTheme.value.colorFour,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ))),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            width: w,
            height: 2,
            color: appProvider.activityTheme.value.colorFour,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.15, vertical: 16),
          child: const Text(
            'Lorem ipsum dolor sit amet consectetur. Lacus congue morbi venenatis vitae. Donec suspendisse diam risus scelerisque scelerisque. Faucibus nunc amet pretium ultrices. Ultrices pellentesque sem nunc eget pulvinar non et urna tortor. Risus at ridiculus dolor eget porta leo tortor neque risus. Interdum lectus ut sem integer. Purus enim nulla quis nulla enim non cras molestie.',
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 2),
          ),
        ),
        SizedBox(
          height: 270,
          width: w,
          child: Stack(
            children: [
              Container(
                height: 270,
                width: w,
                color: appProvider.activityTheme.value.colorTwo,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: w * 0.09),
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: SvgPicture.asset(
                            'images/logo_white.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Навигация',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 17),
                                ),
                                Text(
                                  'Священный Коран',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 2),
                                ),
                                Text(
                                  'Переводы смыслов',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 2),
                                ),
                                Text(
                                  'Толкования (Тафсир)',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 2),
                                ),
                                Text(
                                  'My Profile',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 2),
                                ),
                                Text(
                                  'Settings',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 2),
                                ),
                                Text(
                                  'Разработчики',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 2),
                                ),
                                Text(
                                  'Благотворительность',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 2),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Сеть',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                Text(
                                  'data',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 2),
                                ),
                                Text(
                                  'data',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 2),
                                ),
                                Text(
                                  'data',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 2),
                                ),
                                Text(
                                  'data',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 2),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: [
                                  Text(
                                    'Find Us on Social Media',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(Icons.facebook),
                                        Icon(Icons.photo_camera),
                                        Icon(Icons.one_x_mobiledata),
                                        Icon(Icons.telegram),
                                        Icon(Icons.video_label_sharp),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              IgnorePointer(
                child: Image.asset(
                  'images/logo2.png',
                  width: w,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
