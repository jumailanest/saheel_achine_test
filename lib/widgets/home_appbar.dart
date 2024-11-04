import 'package:flutter/material.dart';
import 'package:saheel_machine_test/utils/app_colors.dart';
import 'package:saheel_machine_test/utils/app_constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        height: 120,
        width: 0.97 * size.width,
        decoration: BoxDecoration(color: AppColors.appBarColor, borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: AppConstants.padLeft13),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: AppConstants.padLeft13),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Good morning"),
                      AppConstants.sbh5,
                      SizedBox(
                        width: 0.55 * size.width,
                        child: const Text(
                          "Alex",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: AppConstants.fontWeight700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppConstants.sb,
            AppConstants.sb,
            const Row(
              children: [
                Icon(Icons.language),
                AppConstants.sbw10,
                Text(" | "),
                AppConstants.sbw10,
                Text("Logout"),
                AppConstants.sbw10,
                Icon(Icons.notifications_none),
                AppConstants.sbw10,
              ],
            )
          ],
        ),
      ),
    );
  }
}
