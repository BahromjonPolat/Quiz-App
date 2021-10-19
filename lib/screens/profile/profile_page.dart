import 'package:examtwo/consts/colors.dart';
import 'package:examtwo/data/user_list.dart';
import 'package:examtwo/models/user_model.dart';
import 'package:examtwo/widgets/icons.dart';
import 'package:examtwo/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  User user = UserData.currentUser;

  @override
  Widget build(BuildContext context) {
    return _showProfileInfo();
  }

  _showProfileInfo() => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
          children: [
            _showUserInfo(),
            _showScore(),
          ],
        ),
  );

  ListTile _showUserInfo() {
    return ListTile(
            leading: CircleAvatar(
              radius: 32.0,
              child: setIcon(user.avatar, color: colorWhite, size: 32.0),
            ),
            title: setSimpleBoldText(user.username, color: colorWhite),
            subtitle: setSimpleText(user.email, color: colorWhite),
            
          );
    
   
  }

  ListTile _showScore()=>ListTile(
    title: setSimpleBoldText("Your Score", color: colorWhite),
    trailing: setBoldText(user.score.toString(), color: colorWhite, size: 18.0),
  );
}
