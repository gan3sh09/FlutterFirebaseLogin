import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';
import 'package:loginapp/src/features/authentication/controllers/logout_controller/logout_controller.dart';
import 'package:loginapp/src/features/authentication/screens/dashboard_screen/layout/emotion_face.dart';
import 'package:loginapp/src/features/authentication/screens/dashboard_screen/layout/exercise_widget.dart';
import 'package:loginapp/src/utils/theme_manager.dart';
import 'layout/bottom_navigation.dart';
import 'layout/dashboard_header.dart';
import 'layout/dashboard_search_bar.dart';
import 'layout/how_do_you_feel.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible:
                    false, // Prevents dismissing dialog by tapping outside
                builder: (BuildContext context) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
                },
              );

              // Simulate a delay of 3 seconds before navigating
              Future.delayed(const Duration(seconds: 1), () {
                Navigator.pop(context); // Close the dialog
                logOut();
                Navigator.pushNamed(
                    context, 'login'); // Navigate to login screen
              });
            },
            icon: Icon(
              Icons.logout,
              color: Theme.of(context).brightness == Brightness.light
                  ? whiteColor
                  : whiteColor,
            ),
          ),
          actions: const [
            Text(
              'Dark Mode',
              style: TextStyle(
                  color: whiteColor, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ChangeThemeButtonWidget()
          ],
        ),
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? primaryColor
            : scafDarkBackground,
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                children: [
                  // dashboard header
                  DashboardHeader(),
                  SizedBox(
                    height: 15,
                  ),

                  // search bar
                  DashboardSearchBar(),
                  SizedBox(
                    height: 15,
                  ),

                  // how to you feel
                  HowDoYouFeel(
                    text: 'How do you feel?',
                    color: whiteColor,
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  // emotion faces
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      EmotionFace(
                        emotionEmoji: '😍',
                        title: 'love',
                      ),
                      EmotionFace(
                        emotionEmoji: '🤭',
                        title: 'Shy',
                      ),
                      EmotionFace(
                        emotionEmoji: '😎',
                        title: 'Cool',
                      ),
                      EmotionFace(
                        emotionEmoji: '😡',
                        title: 'Angry',
                      ),
                    ],
                  ),
                  /* SizedBox(
                    height: 10,
                  ), */
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? exContainerLight
                      : containerDark,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      // exercise heading
                      HowDoYouFeel(
                        text: 'Exercises',
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : whiteColor,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // list view of exercise
                      Expanded(
                        child: ListView(
                          children: const [
                            ExerciseWidget(
                              exerciseName: 'Speaking Skills',
                              noOfExcercise: 16,
                              icon: Icons.favorite,
                              color: Colors.orange,
                            ),
                            ExerciseWidget(
                              exerciseName: 'Reading Skills',
                              noOfExcercise: 12,
                              icon: Icons.person,
                              color: Colors.blue,
                            ),
                            ExerciseWidget(
                              exerciseName: 'Writing Skills',
                              noOfExcercise: 20,
                              icon: Icons.star,
                              color: Colors.pink,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        // bottom navigation
        bottomNavigationBar: const DashboardBottomNavigation(),
      ),
    );
  }
}
