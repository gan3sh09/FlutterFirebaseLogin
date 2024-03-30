import 'package:flutter/material.dart';
import 'package:loginapp/src/common_widgets/form/form_header_widget.dart';
import 'package:loginapp/src/constants/colors.dart';
import 'package:loginapp/src/constants/image_strings.dart';
import 'package:loginapp/src/constants/sizes.dart';
import 'package:loginapp/src/constants/text_strings.dart';

class EmailSentNotifyScreen extends StatelessWidget {
  const EmailSentNotifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
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
                      context, 'login'); // Navigate to login screen
                });
              },
              icon: const Icon(Icons.clear),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: defaultSize * 4,
                ),
                const FormHeaderWidget(
                  image: logoImage,
                  title: notifyTitle,
                  subTitle: notifySubTitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textAlign: TextAlign.center,
                  heightBetween: 10,
                ),
                const SizedBox(
                  height: formHeight,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
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
                                context, 'login'); // Navigate to login screen
                          });
                        },
                        child: const Text(doneText),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        resendEmail,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
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
