import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quran_com/main.dart';
import 'package:quran_com/pages/mainPage.dart';

// void checkUserStatus() {
//   User? user = FirebaseAuth.instance.currentUser;

//   if (user != null) {
//     print("Пользователь в аккаунте: ${user.email}");
//     appProvider true;
//   } else {
//     print("Пользователь не авторизован");
//     return false;
//   }
// }

class userPage extends StatefulWidget {
  const userPage({super.key});

  @override
  State<userPage> createState() => _userPageState();
}

class _userPageState extends State<userPage> {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    FirebaseAuth.instance.currentUser == null
        ? appProvider.loginUpdate(false)
        : appProvider.loginUpdate(true);

    return StreamBuilder<bool>(
        stream: appProvider.userInSystem,
        builder: (context, snapshot) {
          return ListView(
            children: [
              () {
                if (snapshot.data ?? true) {
                  var user = FirebaseAuth.instance.currentUser;
                  return Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 120),
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(180)),
                                child: user?.photoURL == null
                                    ? Image.asset(
                                        'images/not-avatar.png',
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(user!.photoURL!),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 20),
                                height: 100,
                                width: 300,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user?.displayName ?? '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      user?.email ?? '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: Text(
                            'Недавно прочитанные',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 100.0),
                          child: SizedBox(
                            height: 120,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Container(
                                      height: 110,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            width: w * 0.2,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: const Color.fromARGB(
                                                        126, 158, 158, 158))),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'الفاتحة',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 21),
                                                    ),
                                                    Text(
                                                      'Lorem Ipsum',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 17),
                                                    ),
                                                    Text(
                                                      'Surah 1 | Ayah 23 | Mecca',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 13),
                                                    ),
                                                  ],
                                                ),
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                    width: 38,
                                                    height: 38,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(180)),
                                                    child: const Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Icon(Icons
                                                            .youtube_searched_for_rounded)),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Expanded(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                '14 hours age',
                                                style: TextStyle(fontSize: 12),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        Container(
                          height: 1,
                          width: w,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 120, vertical: 30),
                          color: const Color.fromARGB(166, 158, 158, 158),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: Text(
                            'Мои закладки',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 100.0),
                          child: SizedBox(
                            height: 120,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Container(
                                      height: 110,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            width: w * 0.2,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: const Color.fromARGB(
                                                        126, 158, 158, 158))),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'الفاتحة',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 21),
                                                    ),
                                                    Text(
                                                      'Lorem Ipsum',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 17),
                                                    ),
                                                    Text(
                                                      'Surah 1 | Ayah 23 | Mecca',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 13),
                                                    ),
                                                  ],
                                                ),
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                    width: 38,
                                                    height: 38,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(180)),
                                                    child: const Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Icon(Icons
                                                            .mark_as_unread)),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Expanded(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                '14 hours age',
                                                style: TextStyle(fontSize: 12),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              FirebaseAuth.instance.signOut();
                              appProvider.loginUpdate(false);
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.only(top: 40, bottom: 10),
                              width: 220,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: const Color.fromARGB(197, 158, 158, 158),
                              ),
                              child: Center(
                                child: Text(
                                  'LOG OUT',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: appProvider
                                          .activityTheme.value.colorFour),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 40.0),
                          child: Center(
                              child: Text(
                            'delete my account',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(186, 158, 158, 158)),
                          )),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    height: h * 0.65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Вы не авторизованы',
                          style: TextStyle(
                              color: appProvider.activityTheme.value.colorOne,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            showRegisterDialog(context);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 40, bottom: 10),
                            width: 220,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: appProvider.activityTheme.value.colorOne,
                            ),
                            child: Center(
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: appProvider
                                        .activityTheme.value.colorFour),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showLoginDialog(context);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 20, bottom: 10),
                            width: 220,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: appProvider.activityTheme.value.colorOne,
                            ),
                            child: Center(
                              child: Text(
                                'LOG IN',
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: appProvider
                                        .activityTheme.value.colorFour),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }(),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
        });
  }
}

void showRegisterDialog(BuildContext context) {
  final _auth = FirebaseAuth.instance;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void register(String name) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (newUser != null) {
        print("Registration successful!");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => mainPage()),
        );
        User? user = FirebaseAuth.instance.currentUser;
        user?.updateDisplayName(name);
        AppProvider().loginUpdate(true);
      }
    } catch (e) {
      print(e);
      // Покажите сообщение об ошибке пользователю
    }
  }

  // final appProvider = Provider.of<AppProvider>(context);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      final appProvider = Provider.of<AppProvider>(context);
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(40),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(60)),
          width: 450,
          height: 450,
          child: Column(
            children: [
              Text(
                'Sign Up',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 60),
              Column(
                children: [
                  Container(
                    height: 40,
                    padding: EdgeInsets.only(bottom: 10, left: 8, right: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color.fromARGB(149, 158, 158, 158),
                            width: 2)),
                    child: Center(
                      child: TextField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(
                                color: Color.fromARGB(145, 158, 158, 158)),
                            hintText: "Name",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 40,
                    padding: EdgeInsets.only(bottom: 10, left: 8, right: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color.fromARGB(149, 158, 158, 158),
                            width: 2)),
                    child: Center(
                      child: TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(
                                color: Color.fromARGB(145, 158, 158, 158)),
                            hintText: "Email",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 40,
                    padding: EdgeInsets.only(bottom: 10, left: 8, right: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color.fromARGB(142, 158, 158, 158),
                            width: 2)),
                    child: Center(
                      child: TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(
                                color: Color.fromARGB(141, 158, 158, 158)),
                            hintText: "Password",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      register(_nameController.text);
                    },
                    child: Container(
                      width: 220,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: appProvider.activityTheme.value.colorOne,
                      ),
                      child: Center(
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: appProvider.activityTheme.value.colorFour),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showLoginDialog(BuildContext context) {
  final _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login() async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (user != null) {
        print("Login successful!");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => mainPage()),
        );
        AppProvider().loginUpdate(true);
        // Перейдите на другую страницу после успешного входа
      }
    } catch (e) {
      print(e);
      // Покажите сообщение об ошибке пользователю
    }
  }

  // final appProvider = Provider.of<AppProvider>(context);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      final appProvider = Provider.of<AppProvider>(context);
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(40),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(60)),
          width: 450,
          height: 450,
          child: Column(
            children: [
              Text(
                'Log In',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 60),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 40,
                    padding: EdgeInsets.only(bottom: 10, left: 8, right: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color.fromARGB(149, 158, 158, 158),
                            width: 2)),
                    child: Center(
                      child: TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(
                                color: Color.fromARGB(145, 158, 158, 158)),
                            hintText: "Email",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 40,
                    padding: EdgeInsets.only(bottom: 10, left: 8, right: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color.fromARGB(142, 158, 158, 158),
                            width: 2)),
                    child: Center(
                      child: TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(
                                color: Color.fromARGB(141, 158, 158, 158)),
                            hintText: "Password",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      login();
                    },
                    child: Container(
                      width: 220,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: appProvider.activityTheme.value.colorOne,
                      ),
                      child: Center(
                        child: Text(
                          'LOG IN',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: appProvider.activityTheme.value.colorFour),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
