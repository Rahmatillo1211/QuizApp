import 'package:app/utils/constants2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResultPage2 extends StatelessWidget {
  const ResultPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9F7FFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Text(
                "Your Results",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, quizIndex) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 200,
                        ),
                        Text(
                          quizList2[quizIndex]["question"],
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) {
                              final item = quizList2[index];
                              bool selectedAnswer =
                                  item["answer"].toString().trim() ==
                                      answerList2[index].trim();
                              if (kDebugMode) {
                                print(item["answer"].toString().trim());
                              }
                              if (kDebugMode) {
                                print(answerList2[quizIndex].trim());
                              }
                              if (kDebugMode) {
                                print(answerList2);
                              }
                              return _buildItem(
                                  item, index, quizIndex, selectedAnswer);
                            },
                            separatorBuilder: (_, index) {
                              return const SizedBox(
                                height: 12,
                              );
                            },
                            itemCount: quizList2[quizIndex]["answers"].length),
                      ],
                    );
                  },
                  separatorBuilder: (_, index) {
                    return const SizedBox(
                      height: 50,
                    );
                  },
                  itemCount: quizList2.length),
            )
          ],
        ),
      ),
    );
  }

  _buildItem(Map<String, dynamic> item, int index, int quizIndex,
      bool selectedAnswer) {
    final isAnswer = quizList2[quizIndex]["answers"][index] ==
        quizList2[quizIndex]["answer"];
    final selectedAnswer =
        quizList2[quizIndex]["answers"][index] == answerList2[quizIndex];
    final isSelectedTrue =
        quizList2[quizIndex]["answer"] == answerList2[quizIndex];

    if (kDebugMode) {
      print("answer $isAnswer");
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: isAnswer && isSelectedTrue
            ? Colors.green
            : selectedAnswer && !isSelectedTrue
                ? Colors.red
                : isAnswer && !isSelectedTrue
                    ? Colors.green
                    : const Color(0xFFFF9051),
      ),
      child: Center(
        child: Text(
          quizList2[quizIndex]["answers"][index],
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
