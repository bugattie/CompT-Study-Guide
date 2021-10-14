import 'package:flutter/material.dart';

import 'package:figma_squircle/figma_squircle.dart';

import '../contants.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(
      {Key? key, required this.topicData, required this.topic})
      : super(key: key);

  final List topicData;
  final String topic;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kPrimary,
        title: Text(
          widget.topic,
          style: const TextStyle(
              // fontSize: 14,
              ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: _size.height * 0.85,
            child: Card(
              elevation: 10,
              color: Colors.white,
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 25,
                  cornerSmoothing: 0.8,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20, 0, 0),
                    child: Text(
                      '${currentIndex + 1} question of ${widget.topicData.length}',
                      style: const TextStyle(color: kLight),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      widget.topicData[currentIndex]['question'],
                      style: const TextStyle(
                        color: kTextDark,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: kLightBackground,
                        borderRadius: SmoothBorderRadius(
                          cornerRadius: 25,
                          cornerSmoothing: 0.8,
                        ),
                      ),
                      child: Text(
                        widget.topicData[currentIndex]['answer'],
                        style: const TextStyle(color: kButtonBackground),
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: const SmoothBorderRadius.only(
                        bottomLeft: SmoothRadius(
                          cornerRadius: 25,
                          cornerSmoothing: 0.8,
                        ),
                        bottomRight: SmoothRadius(
                          cornerRadius: 25,
                          cornerSmoothing: 0.8,
                        ),
                        topRight: SmoothRadius.zero,
                        topLeft: SmoothRadius.zero,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (widget.topicData.length - 1 != currentIndex) {
                            setState(() {
                              currentIndex++;
                            });
                          } else {
                            setState(() {
                              currentIndex = 0;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: (widget.topicData.length - 1 != currentIndex)
                              ? kButtonBackground
                              : kPrimary,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: (widget.topicData.length - 1 != currentIndex)
                            ? const Text('Next Question')
                            : const Text('Learn Again?'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
