import 'package:flutter/material.dart';
import 'package:flutter_task3/presentation/screens/profile/edit_profile_screen.dart';

import '../../../data/profile_service.dart';
import '../../models/profile_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
      getProfile().then((value) => setState(() {
        profile = value;
      }));

    super.initState();
  }
  ProfileModel profile = profileModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            profile.name,
            style: const TextStyle(
                fontSize: 20
            ),
          ),
          Text(
            profile.group,
            style: const TextStyle(
                fontSize: 20
            ),
          ),
          Text(
            "ПКС ${profile.taskNumber} задание",
            style: const TextStyle(
                fontSize: 20
            ),
          ),
          Text(
            profile.phoneNumber,
            style: const TextStyle(
                fontSize: 20
            ),
          ),
          Text(
            profile.email,
            style: const TextStyle(
                fontSize: 20
            ),
          ),
          OutlinedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => EditProfileScreen(
                oldProfile: profile,
                onProfileCreated: (ProfileModel value) {
                  setState(() {
                    profile = value;
                  });
                },
              ),
            ));
            },
              child: const Text("Редактировать")
          ),
        ]
      ),
    );
  }
}
