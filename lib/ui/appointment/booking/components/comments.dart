import 'package:finpro_app/consts.dart';
import 'package:finpro_app/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart'; // make sure to use Provider for ThemeProvider

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkTheme = themeProvider.isDarkTheme;

    return Column(
      children: [
        _buildComment(
          context,
          'assets/images/rating-1.png',
          'Ariana Grande',
          'Dr. Patricia is so kind and understanding! Highly recommend.',
          'Today',
          4.5,
          isDarkTheme,
        ),
        _buildComment(
          context,
          'assets/images/rating-2.png',
          'Louis Partridge',
          'Great experience overall! The details were very well explained.',
          'Yesterday',
          4.2,
          isDarkTheme,
        ),
        _buildComment(
          context,
          'assets/images/rating-3.png',
          'Niki Zefanya',
          'The service was excellent and exceeded my expectations.',
          '1 Week ago',
          4.8,
          isDarkTheme,
        ),
      ],
    );
  }

  Widget _buildComment(
    BuildContext context,
    String imagePath,
    String name,
    String comment,
    String time,
    double rating,
    bool isDarkTheme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 16),
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: isDarkTheme ? textPrimaryDark : textColor,
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 12,
                          color: isDarkTheme ? textSecondaryDark : textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/rating-star.svg',
                        width: 17,
                        height: 17,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$rating',
                        style: TextStyle(
                          fontSize: 12,
                          color: isDarkTheme ? textSecondaryDark : textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    comment,
                    style: TextStyle(
                      fontSize: 13,
                      color: isDarkTheme ? textSecondaryDark : textSecondary
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}