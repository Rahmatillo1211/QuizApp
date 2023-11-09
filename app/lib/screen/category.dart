import 'package:app/screen/quiz_page1.dart';
import 'package:app/screen/quiz_page2.dart';
import 'package:app/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9F7FFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF9F7FFF),
        title: const Center(
          child: Text('Programming',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 30)),
        ),
        leading: (const Icon(
          Icons.home,
          size: 30,
        )),
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "images/img/computer.png",
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton(
                    text: 'Java',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuizPage1()),
                      );
                    },
                  ),
                  MyButton(
                    text: 'Dart',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuizPage2()),
                      );
                    },
                  ),
                  MyButton(
                    text: 'Flutter',
                    onPressed: () {},
                  ),
                  MyButton(
                    text: 'Python',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
