import 'dart:convert';
import 'package:examtwo/consts/colors.dart';
import 'package:examtwo/data/fake_quiz_list.dart';
import 'package:examtwo/data/user_list.dart';
import 'package:examtwo/models/question_model.dart';
import 'package:examtwo/screens/home/home_page.dart';
import 'package:examtwo/widgets/circular_indicator.dart';
import 'package:examtwo/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _c = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _show(),
    );
  }

  AppBar _buildAppBar() => AppBar(
        iconTheme: const IconThemeData(
          color: colorBlack,
        ),
        backgroundColor: colorTransparent,
        elevation: 0.0,
        title: setSimpleBoldText("Islamic Quiz"),
      );

  _show() {
    Quiz quiz = Quiz.fromJson(quizFakeList[_c]);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 24.0),
          Expanded(
            child: GridView.builder(
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _c++;
                    UserData.currentUser.score += 1;
                    if (_c == quizFakeList.length - 1) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => HomePage()));
                    }
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: colorRed,
                    child: setSimpleBoldText(quiz.options![index],
                        color: colorWhite),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _showQuizzes() => FutureBuilder(
      future: _getQuizData(),
      builder: (context, AsyncSnapshot snap) {
        return snap.hasData
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    setSimpleBoldText(snap.data![0].question!, size: 24.0),
                    const SizedBox(height: 24.0),
                    Expanded(
                      child: GridView.builder(
                          itemCount: 4,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 12.0,
                                  crossAxisSpacing: 12.0,
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            Quiz quiz = snap.data![index];
                            return GestureDetector(
                              onTap: () {
                                print("clicked $index");

                                setState(() {});
                              },
                              child: Container(
                                alignment: Alignment.center,
                                color: colorRed,
                                child: setSimpleBoldText(quiz.options![index],
                                    color: colorWhite),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              )
            : showCircularIndicator(24.0);
      });

  Future<List> _getQuizData() async {
    var quizList = await DefaultAssetBundle.of(context)
        .loadString("assets/data/questions.json");
    return (jsonDecode(quizList.toString()));
  }
}
