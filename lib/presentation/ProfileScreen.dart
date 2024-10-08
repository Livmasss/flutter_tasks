import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Сейранян Самвел Гагикович",
            style: TextStyle(
                fontSize: 20
            ),
          ),
          Text(
            "ЭФБО-01-22",
            style: TextStyle(
                fontSize: 20
            ),
          ),
          Text(
            "ПКС 5 задание",
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ],
      ),
    );
  }
}
