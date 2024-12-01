import 'package:finpro_app/state-management/theme_provider.dart';
import 'package:finpro_app/ui/home/components/doctor_booked.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/action_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
        backgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi Ney!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkTheme ? Colors.white : Colors.black,
                ),
              ),
              Text(
                'May you always in a good condition',
                style: TextStyle(
                  color: themeProvider.isDarkTheme ? Colors.white : const Color(0xFF3F3F46),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.20,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              themeProvider.toggleTheme(!themeProvider.isDarkTheme);
            },
            icon: Icon(
              themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
              color:
                  themeProvider.isDarkTheme ? Colors.amberAccent : Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(bottom: 24),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'symptoms, diseases...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF9F5FF),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_alt_outlined),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const DoctorBooked(),
              const SizedBox(height: 24),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: ActionCard.actionCardList(context),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 180, // max height for the PageView
                ),
                child: PageView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                      'assets/images/promotion-card.png'
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                      'assets/images/promotion-card.png'
                      ),
                    ),
                  ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
