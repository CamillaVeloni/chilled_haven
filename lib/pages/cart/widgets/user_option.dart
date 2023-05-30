import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/theme/custom_text_style.dart';

class UserOption extends StatelessWidget {
  final String optionTitle;
  final String title;
  final String subtitle;
  final IconData icon;
  final Function() onTap;

  const UserOption({
    super.key,
    required this.optionTitle,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(optionTitle, style: detailTitleText),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(icon, size: 30, color: primaryColor),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Text>[
                        Text(
                          title,
                          style: minBoldStyle.copyWith(
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: minStyle.copyWith(
                            color: Colors.grey.shade600,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const Icon(
                  Icons.arrow_forward,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
