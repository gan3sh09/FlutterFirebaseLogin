import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';
import 'package:loginapp/src/constants/image_strings.dart';
import 'package:loginapp/src/constants/sizes.dart';
import 'package:loginapp/src/constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(defaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: const AssetImage(logoImage),
              height: height * 0.5,
            ),
            Column(
              children: [
                Text(
                  welcomeTitle,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 10),
                Text(
                  welcomeSubtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
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
                        Navigator.pushNamed(
                            context, 'signup'); // Navigate to signup screen
                      });
                    },
                    child: Text(
                      signupText.toUpperCase(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
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
                        Navigator.pushNamed(
                            context, 'login'); // Navigate to signup screen
                      });
                    },
                    child: Text(
                      loginText.toUpperCase(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
