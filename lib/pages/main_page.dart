import 'package:flutter/material.dart';
import 'package:profile/constants/app_colors.dart';
import 'package:profile/constants/app_dimensions.dart';
import 'package:profile/constants/app_strings.dart';
import 'package:profile/pages/github_page.dart';

import 'details.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //Variable
  String username = 'MiQSource';
  String roleDetails = AppStrings.roleDescription;
  late TextEditingController nameController, roleController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    roleController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    roleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppDimensions().init(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.width20),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: AppDimensions.getProportionalScreenHeight(120)),
                //Profile Image
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                contentPadding: const EdgeInsets.all(0),
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppDimensions
                                            .getProportionalScreenHeight(2))),
                                content: Container(
                                  height: AppDimensions.height100 * 5,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions
                                              .getProportionalScreenHeight(1))),
                                  child: ClipRRect(
                                    clipBehavior: Clip.none,
                                    child: Center(
                                      child: Image.asset(
                                        AppStrings.profileImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      child: CircleAvatar(
                        radius: AppDimensions.height100 * 0.9,
                        backgroundImage: AssetImage(AppStrings.profileImage),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: AppDimensions.getProportionalScreenWidth(-2),
                        child: IconButton(
                          onPressed: () {},
                          icon: CircleAvatar(
                            backgroundColor: AppColors.mainColor,
                            radius: AppDimensions.height20 * 1.2,
                            child: Center(
                              child: Icon(
                                Icons.camera_alt,
                                size: AppDimensions.height20 * 1.5,
                                color: Colors.white, //AppColors.lightBlue,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
                SizedBox(height: AppDimensions.height20),
                //Name
                Details(
                  title: AppStrings.name,
                  content: username,
                  prefix: Icons.person,
                  description: AppStrings.namePrivacyAssurance,
                  onPressed: () {
                    editSlackName(
                      hintText: username,
                      title: AppStrings.name,
                      controller: nameController,
                    );
                  },
                ),
                SizedBox(height: AppDimensions.height10),
                //Role
                Details(
                  title: AppStrings.role,
                  content: AppStrings.roleTitle,
                  prefix: Icons.info_outline,
                  description: AppStrings.roleDescription,
                  onPressed: () {
                    editSlackName(
                      hintText: roleDetails,
                      title: AppStrings.role,
                      controller: roleController,
                    );
                  },
                ),
                SizedBox(height: AppDimensions.height10),
                //PhoneNumber
                Details(
                  title: AppStrings.phone,
                  content: AppStrings.phoneNumber,
                  prefix: Icons.phone,
                  showEdit: false,
                  showDivider: false,
                ),
                SizedBox(height: AppDimensions.getProportionalScreenHeight(80)),
                //Button
                SizedBox(
                  width: double.maxFinite,
                  height: AppDimensions.getProportionalScreenHeight(56),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GitHubWebView()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppColors.mainColor2.withOpacity(0.9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6))),
                      child: Text(AppStrings.openGit,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: AppDimensions.height20))),
                ),
                SizedBox(height: AppDimensions.getProportionalScreenHeight(40)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Field Editing Dialog
  Future editSlackName(
      {required String hintText,
      required String title,
      required TextEditingController controller}) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    AppDimensions.getProportionalScreenHeight(4))),
            title: SizedBox(width: double.maxFinite, child: Text(title)),
            content: SizedBox(
              width: double.maxFinite,
              child: TextField(
                autofocus: true,
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                ),
                onChanged: (value) {
                  hintText = value;
                },
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(AppStrings.cancel)),
              TextButton(
                  onPressed: () {
                    if (controller.text.length > 1 &&
                        controller.text.isNotEmpty) {
                      Navigator.pop(context);
                      setState(() {
                        username = controller.text;
                      });

                      controller.clear();
                    }
                  },
                  child: Text(
                    AppStrings.save,
                    style: const TextStyle(color: AppColors.mainColor),
                  )),
            ],
          );
        });
  }
}
