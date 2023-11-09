import 'package:app/widgets/result_page1.dart';
import 'package:flutter/material.dart';

class ResultScreen1 extends StatefulWidget {
  final int score;

  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  const ResultScreen1(this.score, {Key, key}) : super(key: key);

  @override
  State<ResultScreen1> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9F7FFF),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(12),
          //   child: Row(
          //     children: [Image.asset("images/img/x.png")],
          //   ),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.score > 30
                        ? "Well done"
                        : widget.score < 10
                            ? "Fail"
                            : "Nice Work",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Image.asset(
                widget.score == 40
                    ? "images/img/star.png"
                    : widget.score > 0
                        ? "images/img/check.png"
                        : "images/img/!.png",
                height: 150,
                width: 600,
              ),

              const SizedBox(
                height: 20,
              ),
              // ${widget.score}
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Your score is: ",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  Text(
                    "${widget.score} pts",
                    style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFFF9051),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        onPressed: () {
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => QuizPage2()),
                          // );
                        },
                        child: const Text(
                          "Next Stage",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFFAA8DFF)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ResultPage1()),
                          );
                        },
                        child: const Text(
                          "Show Results",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
