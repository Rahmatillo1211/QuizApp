import 'dart:async';

import 'package:app/utils/constants2.dart';
import 'package:app/widgets/result_screen2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class QuizItemWidget2 extends StatefulWidget {
  final List<Map<String, dynamic>> answers;

  const QuizItemWidget2({super.key, required this.answers});
  @override
  State<StatefulWidget> createState() => QuizItemWidgetState2();
}

class QuizItemWidgetState2 extends State<QuizItemWidget2> {
  int time = 10;
  bool selected = false;
  int selectedIndex = -1;
  int questionIndex = 0;
  String answer = "";
  int score = 0;

  @override
  Widget build(BuildContext context) {
    int lastIndex = quizList2.length - 1;
    Timer(
      const Duration(seconds: 1),
      () {
        if (time > 0) {
          setState(
            () {
              time -= 1;
            },
          );
        }
        if (time == 0) {
          selected = false;
          selectedIndex = -1;
          questionIndex++;
          answerList2.add(answer);
        }
        setState(() {
          if (time == 0) {
            time = 10;
          }
          if (time == 10 && questionIndex == lastIndex) {
            time = 0;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen2(score),
              ),
            );
          }
        });
      },
    );
    if (kDebugMode) {
      print(time);
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          const PercentageIndicator(
            percentage: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              "images/img/dart.png",
              width: double.infinity,
            ),
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
              time = 30;
              setState(() {
                if (widget.answers.length > questionIndex + 1) {
                  selected = false;
                  selectedIndex = -1;
                  questionIndex++;
                  answerList2.add(answer);
                } else {
                  answerList2.add(answer);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen2(score),
                    ),
                  );
                }
              });
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
        // height: 50.0,
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

class PercentageIndicator extends StatefulWidget {
  final double percentage;

  const PercentageIndicator({super.key, required this.percentage});

  @override
  // ignore: library_private_types_in_public_api
  _PercentageIndicatorState createState() => _PercentageIndicatorState();
}

class _PercentageIndicatorState extends State<PercentageIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: widget.percentage)
        .animate(_animationController);
    _animationController.forward();

    Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {
        _animationController.reset();
        _animationController.forward();
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return LinearProgressIndicator(
          value: _animation.value / 100,
          backgroundColor: Colors.white,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
        );
      },
    );
  }
}
