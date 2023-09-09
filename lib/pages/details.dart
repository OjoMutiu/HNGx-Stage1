import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';

class Details extends StatelessWidget {
  const Details({
    super.key,
    required this.content,
    required this.title,
    this.description,
    required this.prefix,
    this.showDivider = true,
    this.showEdit = true,
    this.onPressed,
  });

  final String title, content;
  final String? description;
  final IconData prefix;
  final bool? showDivider, showEdit;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Person Icon
        Container(
          margin: EdgeInsets.only(
              right: AppDimensions.width10, top: AppDimensions.height10),
          child: Icon(
            prefix,
            size: AppDimensions.height30 * 0.9,
            color: AppColors.iconColor,
          ),
        ),
        //Name Details
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                      Text(
                        content,
                        style: TextStyle(
                          color: AppColors.primaryTextColor,
                          fontSize: AppDimensions.height20 * 0.9,
                        ),
                      ),
                    ],
                  ),
                  //Spacer(),
                  if (showEdit!)
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.lightBlue.withOpacity(0.075),
                          borderRadius:
                              BorderRadius.circular(AppDimensions.height25)),
                      child: IconButton(
                        onPressed: onPressed,
                        icon: Icon(
                          Icons.edit,
                          size: AppDimensions.height25,
                          color: AppColors.mainColor,
                        ),
                      ),
                    )
                ],
              ),
              description != null
                  ? Text(
                      description!,
                      style: const TextStyle(
                        color: AppColors.secondaryTextColor,
                      ),
                    )
                  : Container(),
              SizedBox(height: AppDimensions.height10),
              if (showDivider!)
                Divider(
                  thickness: AppDimensions.getProportionalScreenHeight(0.5),
                  color: AppColors.dividerColor.withOpacity(0.8),
                )
            ],
          ),
        )
      ],
    );
  }
}
