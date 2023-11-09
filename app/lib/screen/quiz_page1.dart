import 'package:app/utils/constants1.dart';
import 'package:app/widgets/quiz_item1.dart';
import 'package:flutter/material.dart';

class QuizPage1 extends StatelessWidget {
  const QuizPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9F7FFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF9F7FFF),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Center(child: Text("Quiz Page")),
        actions: [
          IconButton(
            onPressed: () {
              _showAlertDialog(context);
            },
            icon: const Icon(
              Icons.notifications,
            ),
          ),
        ],
      ),
      body: QuizItemWidget1(
        answers: quizList1,
        key: UniqueKey(),
      ),
    );
  }

  _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
