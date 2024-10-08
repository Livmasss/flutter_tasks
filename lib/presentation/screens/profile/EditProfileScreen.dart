import 'package:flutter/material.dart';
import 'package:flutter_task3/presentation/models/ProfileModel.dart';

import '../../widgets/MyNumericFieldWidget.dart';
import '../../widgets/MyTextFieldWidget.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({
    super.key,
    required this.oldProfile,
    required this.onProfileCreated
  });

  final ValueChanged<ProfileModel> onProfileCreated;
  ProfileModel oldProfile;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState(
    onProfileCreated, oldProfile
  );
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  ProfileModel profile;

  final ValueChanged<ProfileModel> onProfileCreated;
  _EditProfileScreenState(
      this.onProfileCreated,
      this.profile
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyTextFieldWidget(
            onChanged: (text) { profile.name = text; },
            hintText: "Фио",
            initialValue: profile.name,
          ),
          MyTextFieldWidget(
            onChanged: (text) { profile.group = text; },
            hintText: "Группа",
            initialValue: profile.group,
          ),
          MyNumericFieldWidget(
              onChanged: (text) {
                try {
                  profile.taskNumber = int.parse(text);
                }
                catch(e) {
                  profile.taskNumber = 0;
                }
              },
              hintText: "Номер работы",
            initialValue: profile.taskNumber,
          ),
          MyTextFieldWidget(
              onChanged: (text) { profile.phoneNumber = text; },
              hintText: "Номер телефона"
          ),
          MyTextFieldWidget(
              onChanged: (text) { profile.email = text; },
              hintText: "Элекктронная почта"
          ),

          const Spacer(),
          OutlinedButton(
              onPressed: () {
                onProfileCreated(profile);

                Navigator.pop(context);
              },
              child: const Text("Подтвердить")
          ),
        ],
      ),
    );
  }
}
