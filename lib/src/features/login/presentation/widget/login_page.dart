// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_auth/src/features/login/application/services/login_service.dart';
import 'package:flutter_auth/src/features/login/presentation/states/login_shared_preferences.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisibilePassword = false;

  TextEditingController codeTextController = TextEditingController();
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  final api = LoginService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(null),
        actions: [
          Row(children: [
            const Text(
              'Clear shared preferences ->',
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 8),
              child: IconButton(
                onPressed: () async {
                  await LoginSharedPreferences.clear();
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 1),
                      backgroundColor: Colors.green,
                      content: Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Access Token, User_id, Code has deleted',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  );
                  setState(() {});
                },
                icon: const Icon(
                  Icons.delete_outlined,
                  color: Colors.red,
                ),
              ),
            ),
          ])
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 340,
              width: 400,
              child: LottieBuilder.asset(
                'assets/lotties/welcome_lottie.json',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FutureBuilder(
                  future: LoginSharedPreferences.getCode(),
                  builder: (context, snapshoot) {
                    if (snapshoot.data == null) {
                      return const Text('Code: Value code kosong');
                    } else {
                      return Text('Code: ${snapshoot.data}');
                    }
                  },
                ),
                FutureBuilder(
                  future: LoginSharedPreferences.getUserId(),
                  builder: (context, snapshoot) {
                    if (snapshoot.data == null) {
                      return const Text('Code: Value user_id kosong');
                    } else {
                      return Text('User ID: ${snapshoot.data}');
                    }
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: codeTextController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.code),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(28)),
                  hintText: 'Enter your Code...',
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: usernameTextController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.account_circle_outlined),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(28)),
                  hintText: 'Enter your Username...',
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: passwordTextController,
                obscureText: (isVisibilePassword == true) ? false : true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  filled: true,
                  suffixIcon: IconButton(
                      onPressed: () {
                        if (isVisibilePassword == true) {
                          isVisibilePassword = false;
                        } else {
                          isVisibilePassword = true;
                        }
                        setState(() {});
                      },
                      icon: (isVisibilePassword == true)
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined)),
                  fillColor: Colors.grey[200],
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(28)),
                  hintText: 'Enter your password...',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () async {
                  print("ON PRESSED LOGIN");

                  final result = await api.dioLogin(codeTextController.text,
                      usernameTextController.text, passwordTextController.text);

                  print('RESULT ON PRESSED: $result');
                  if (context.mounted) {
                    if (result == true) {
                      Navigator.pushNamed(context, '/bottomNav');
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          icon: const Icon(
                            Icons.warning_amber_outlined,
                            size: 48,
                          ),
                          title: const Text(
                            'Error Occured',
                          ),
                          content:
                              const Text('Wrong Email, Password, Or Code!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('dismiss'),
                            )
                          ],
                        ),
                      );
                      // if (context.mounted) {
                      // }
                    }
                  }
                  setState(() {});
                },
                child: const Text(
                  'Login',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}