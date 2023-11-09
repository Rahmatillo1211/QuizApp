import 'dart:async';

import 'package:app/utils/constants1.dart';
import 'package:app/widgets/result_screen1.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class QuizItemWidget1 extends StatefulWidget {
  final List<Map<String, dynamic>> answers;

  const QuizItemWidget1({super.key, required this.answers});
  @override
  State<StatefulWidget> createState() => QuizItemWidgetState1();
}

class QuizItemWidgetState1 extends State<QuizItemWidget1> {
  Timer? timer2;
  int time = 30;
  bool selected = false;
  int selectedIndex = -1;
  int questionIndex = 0;
  String answer = "";
  int score = 0;
  @override
  void dispose() {
    timer2?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int lastIndex = quizList1.length - 1;
    timer2 = Timer(
      const Duration(seconds: 1),
      () {
        if (time > 0) {
          setState(
            () {
              time -= 1;
            },
          );
        }
        setState(
          () {
            if (time == 0) {
              timer2?.cancel();
              selected = false;
              selectedIndex = -1;
              questionIndex++;
              answerList1.add(answer);
            }
            if (time == 0 && questionIndex == lastIndex) {
              timer2?.cancel();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen1(score),
                ),
              );
            }
          },
        );
      },
    );

    if (kDebugMode) {
      print(time);
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Time :",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "00:$time",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(16),
              minHeight: 10,
              value: 1 - (time / 30),
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(time < 7
                  ? Colors.red
                  : time < 15
                      ? Colors.yellow
                      : Colors.blue),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            "images/img/java.png",
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 150,
                width: double.infinity,
                color: Colors.white,
                child: Center(
                  child: Text(
                    widget.answers[questionIndex]["question"],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
          ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                final item = widget.answers[index];
                return _buildItem(item, index);
              },
              separatorBuilder: (_, index) {
                return const SizedBox(
                  height: 12,
                );
              },
              itemCount: 4),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              setState(
                () {
                  if (widget.answers.length > questionIndex + 1) {
                    timer2?.cancel();
                    time = 30;
                    selected = false;
                    selectedIndex = -1;
                    questionIndex++;
                    answerList1.add(answer);
                  } else {
                    timer2?.cancel();
                    answerList1.add(answer);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen1(score),
                      ),
                    );
                  }
                },
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xFF9F7FFF),
              ),
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(
                  color: Color(0xFFFF9051),
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            child: Text(
              widget.answers.length > questionIndex + 1 ? "Next" : "Result",
              style: const TextStyle(color: Color(0xFFFF9051)),
            ),
          ),
        ],
      ),
    );
  }

  _buildItem(Map<String, dynamic> item, int index) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            timer2?.cancel();
            selected = true;
            selectedIndex = index;
            answer = widget.answers[questionIndex]["answers"][index];
            score = widget.answers[questionIndex]["answers"][index] ==
                    widget.answers[questionIndex]["answer"]
                ? score += 10
                : score;
            if (kDebugMode) {
              print("selected $answer");
            }
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: selected && selectedIndex == index
              ? const Color.fromARGB(255, 255, 94, 2)
              : const Color(0xFFFF9051),
        ),
        child: Center(
          child: Text(
            widget.answers[questionIndex]["answers"][index],
            style: TextStyle(
                color: selected && selectedIndex == index
                    ? Colors.black
                    : Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
