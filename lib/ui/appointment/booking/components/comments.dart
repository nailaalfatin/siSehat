import 'package:finpro_app/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildComment(
          'assets/images/rating-1.png',
          'Ariana Grande',
          'Dr. Patricia is so kind and understanding! Highly recommend.',
          'Today',
          4.5,
        ),
        _buildComment(
          'assets/images/rating-2.png',
          'Louis Partridge',
          'Great experience overall! The details were very well explained.',
          'Yesterday',
          4.2,
        ),
        _buildComment(
          'assets/images/rating-3.png',
          'Niki Zefanya',
          'The service was excellent and exceeded my expectations.',
          '1 Week ago',
          4.8,
        ),
      ],
    );
  }

  Widget _buildComment(
      String imagePath, String name, String comment, String time, double rating) {
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
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        time,
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/rating-star.svg',
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$rating',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    comment,
                    style: const TextStyle(fontSize: 13),
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
