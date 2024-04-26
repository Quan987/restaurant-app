import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project2/components/setting_button.dart';
import 'package:project2/components/bottomnav.dart';
import 'package:project2/components/loading.dart';
import 'package:project2/pages/updateprofile.dart';
import 'package:project2/services/authService.dart';
import 'package:project2/services/databaseService.dart';
import 'package:project2/services/redirecting_service.dart';
import 'package:intl/intl.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _isLoading = true;
  final AuthService _auth = AuthService();
  final FirestoreService _db = FirestoreService();
  late String _firstName;
  late String _lastName;
  late String _email;

  void getInfo() async {
    try {
      _firstName = await _db.getUserInfo(_auth.getCurrentUserUID, "fname");
      _lastName = await _db.getUserInfo(_auth.getCurrentUserUID, "lname");
      _email = await _db.getUserInfo(_auth.getCurrentUserUID, "email");
    } on FirebaseException catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
        title: Text("Setting".toUpperCase()),
        centerTitle: true,
        elevation: 4,
        shadowColor: Colors.grey,
      ),
      body: _isLoading
          ? const LoadingWidget()
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'lib/images/login-profile.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 40),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${toBeginningOfSentenceCase(_firstName)} ${toBeginningOfSentenceCase(_lastName)}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _email,
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Account Setting",
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            const Divider(
                              indent: 0,
                              endIndent: 0,
                              height: 40,
                            ),
                            const SizedBox(height: 10),

                            // Manage account
                            MySettingWidget(
                              title: "Manage Acccount",
                              subtitle: "Update account informations",
                              circle: Colors.blue,
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const UpdateProfilePage(),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 140),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(),
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {
                                    setState(() {
                                      _auth.logout();
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RedirectingService()),
                                      );
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Logout".toUpperCase(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            letterSpacing: 2,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        const Icon(Icons.logout),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: const MyBottomNavBar(currentIndex: 2),
    );
  }
}
