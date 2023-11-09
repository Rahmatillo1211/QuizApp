import 'package:app/utils/constants1.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResultPage1 extends StatelessWidget {
  const ResultPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9F7FFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
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
                          height: 100,
                        ),
                        Text(
                          quizList1[quizIndex]["question"],
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
                              final item = quizList1[index];
                              bool selectedAnswer =
                                  item["answer"].toString().trim() ==
                                      answerList1[index].trim();
                              if (kDebugMode) {
                                print(item["answer"].toString().trim());
                              }
                              if (kDebugMode) {
                                print(answerList1[quizIndex].trim());
                              }
                              if (kDebugMode) {
                                print(answerList1);
                              }
                              return _buildItem(
                                  item, index, quizIndex, selectedAnswer);
                            },
                            separatorBuilder: (_, index) {
                              return const SizedBox(
                                height: 12,
                              );
                            },
                            itemCount: quizList1[quizIndex]["answers"].length),
                      ],
                    );
                  },
                  separatorBuilder: (_, index) {
                    return const SizedBox(
                      height: 50,
                    );
                  },
                  itemCount: quizList1.length),
            )
          ],
        ),
      ),
    );
  }

  _buildItem(Map<String, dynamic> item, int index, int quizIndex,
      bool selectedAnswer) {
    final isAnswer = quizList1[quizIndex]["answers"][index] ==
        quizList1[quizIndex]["answer"];
    final selectedAnswer =
        quizList1[quizIndex]["answers"][index] == answerList1[quizIndex];
    final isSelectedTrue =
        quizList1[quizIndex]["answer"] == answerList1[quizIndex];

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
          quizList1[quizIndex]["answers"][index],
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
