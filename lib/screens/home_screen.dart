import 'package:flutter/material.dart';

import 'package:figma_squircle/figma_squircle.dart';

import '../contants.dart';
import '../widgets/topic_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<bool> showExitPopUp() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            buttonPadding: const EdgeInsets.symmetric(horizontal: 20),
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius(
                cornerRadius: 20,
                cornerSmoothing: 0.8,
              ),
            ),
            title: Text('Confirm'),
            content: const Text(
              'Are you sure you want to exit?',
              style: TextStyle(color: Color(0xFFA6A7A9)),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("NO"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text(
                  'YES',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(primary: kPrimary),
              ),
            ],
          ),
        ) ??
        false;
  }

  List<String> category = [
    "A+ 1001",
    "A+ 1002",
    "Project Management",
    "Security",
    "Networking"
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopUp,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kPrimary,
          foregroundColor: Colors.white,
          title: const Text('CompT Study Guide'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(),
              const SizedBox(height: 20),
              SizedBox(
                height: 55,
                child: ListView.builder(
                  physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                  itemBuilder: (context, index) => buildCategory(index),
                ),
              ),
              const SizedBox(height: 20),
              TopicCard(index: selectedIndex),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F7F7),
            borderRadius: SmoothBorderRadius(
              cornerRadius: 20,
              cornerSmoothing: 1,
            ),
          ),
          child: Column(
            children: [
              Text(
                category[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index ? Colors.black : kTextDark,
                ),
              ),
              if (selectedIndex == index)
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  height: 3,
                  width: 22,
                  decoration: BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
          text: 'Choose what',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          children: <TextSpan>[
            TextSpan(
              text: '\nto learn today?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            )
          ]),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function onPress;
  const CategoryItem({
    Key? key,
    required this.title,
    this.isActive = false,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: SmoothBorderRadius(
          cornerRadius: 20,
          cornerSmoothing: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: 3,
              width: 22,
              decoration: BoxDecoration(
                color: kPrimary,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
        ],
      ),
    );
  }
}
