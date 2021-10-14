import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/questions_screen.dart';
import '../contants.dart';
import '../topics.dart';

class TopicCard extends StatelessWidget {
  TopicCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  final topics = Topic().topics;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.899,
        ),
        itemCount: topics[index]['items'].length,
        itemBuilder: (ctx, i) {
          return Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Card(
              elevation: 5,
              color: Colors.white,
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 25,
                  cornerSmoothing: 0.8,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topics[index]['items'][i],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${topics[index]['questions'][i]['items'].length} questions',
                      style: const TextStyle(
                        color: kSearch,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: kSecondaryLight,
                        shape: SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius(
                            cornerRadius: 10,
                            cornerSmoothing: 1,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: QuestionsScreen(
                              topic: topics[index]['category'],
                              topicData: topics[index]['questions'][i]['items'],
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Lets Learn',
                            style: TextStyle(
                              color: kSecondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 10,
                            color: kSecondary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
