import 'package:examtwo/components/border_radius.dart';
import 'package:examtwo/consts/colors.dart';
import 'package:examtwo/data/quizzes_list.dart';
import 'package:examtwo/models/category_model.dart';
import 'package:examtwo/screens/quiz_arena/quiz_page.dart';
import 'package:examtwo/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class DiscoverPage extends StatelessWidget {
   DiscoverPage({Key? key}) : super(key: key);

  double? _width;
  double? _height;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return _showCategories();
  }

  GridView _showCategories() => GridView.builder(
      itemCount: quizList.length,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 12.0, crossAxisSpacing: 12.0),
      itemBuilder: (context, index) {
        Category category = quizList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_)=> QuizPage()));
          },
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              borderRadius: setCircularBorder(12.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(category.imageUrl),
              ),
            ),
            child: Container(
              width: _width,
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: const BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                ),
              ),
              child: setSimpleBoldText(category.title, color: colorWhite),
            ),
          ),
        );
      });
}
