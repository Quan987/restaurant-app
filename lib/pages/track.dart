import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project2/components/bottomnav.dart';
import 'package:project2/components/loading.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  bool _isLoading = true;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _isLoading
          ? const LoadingWidget()
          : Column(
              children: [
                Text(FirebaseAuth.instance.currentUser!.uid),
                Text("Track"),
              ],
            ),
      bottomNavigationBar: const MyBottomNavBar(currentIndex: 1),
    );
  }
}
