import 'dart:convert';
import 'package:examtwo/data/user_list.dart';
import 'package:http/http.dart' as http;
import 'package:examtwo/consts/colors.dart';
import 'package:examtwo/models/question_model.dart';
import 'package:examtwo/widgets/circular_indicator.dart';
import 'package:examtwo/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _showQuizzes(),
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

  _showQuizzes() => FutureBuilder(
      future: _getQuizData(),
      builder: (context, AsyncSnapshot<List<Results>> snap) {
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
                            Results quiz = snap.data![index];
                            return GestureDetector(
                              onTap: (){
                                print("clicked $index");
                                if (quiz.incorrectAnswers![index].toString() == quiz.correctAnswer) {
                                  UserData.currentUser.score += 1;
                                }

                                setState(() {

                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                color: colorRed,
                                child: setSimpleBoldText(
                                    index == 3
                                        ? quiz.correctAnswer!
                                        : quiz.incorrectAnswers![index],
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

  Future<List<Results>> _getQuizData() async {
    Uri url = Uri.parse("https://opentdb.com/api.php?amount=10");
    var quizList = await http.get(url);
    return (jsonDecode(quizList.body)['results'] as List)
        .map((e) => Results.fromJson(e))
        .toList();
  }
}
