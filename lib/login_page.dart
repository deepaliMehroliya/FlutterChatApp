import 'package:chat_app/utils/spaces.dart';
import 'package:chat_app/utils/textField_styles.dart';
import 'package:chat_app/widgets/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:social_media_buttons/social_media_buttons.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _mainUrl = "https://github.com/deepaliMehroliya";
  void loginUser(context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, '/chat',
          arguments: '${userNameController.text}');
    } else {
      print('Login unsuccessful');
    }
  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Lets\'s sign you in!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold)),
                const Text(
                  'Welcome back! \n You\'ve been missed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      fontStyle: FontStyle.italic),
                ),
                Image.asset(
                  'assets/appLogo.jpg',
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      LoginTextField(
                        controller: userNameController,
                        hintText: 'Enter your username here',
                        validator: (value) {
                          if (value != null &&
                              value.isNotEmpty &&
                              value.length < 5) {
                            return 'Username length should be more than 5';
                          } else if (value != null && value.isEmpty) {
                            return 'Please type your username';
                          }
                          return null;
                        },

                      ),
                      verticalSpacing(24),
                      LoginTextField(
                        controller: passwordController,
                        hasAsterik: true ,
                        hintText: 'Enter your password here',
                      ),
                    ],
                  ),
                ),
                verticalSpacing(20),
                ElevatedButton(
                    onPressed: () {
                      loginUser(context);
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    )),
                GestureDetector(
                  onTap: ()async {
                    //todo: Navigate to the browser
                    if(!await launchUrl(Uri.parse(_mainUrl)) ){
                      throw 'Could not launch this url';
                    }
                    print('Link clicked');
                  },
                  child: Column(
                    children: [
                      Text('Find us on', style: TextStyle(color: Colors.blue),),
                      Text(_mainUrl, style: TextStyle(color: Colors.blue),),
                    ],
                  ),
                ),
                verticalSpacing(10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButton.twitter(
                        size: 20,
                        color: Colors.blue,
                        url: 'https://twitter.com/DeepaliM67408'),
                    SocialMediaButton.linkedin(
                        size: 20,
                        color: Colors.blue,
                        url: 'https://www.linkedin.com/in/deepali-mehroliya/'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
