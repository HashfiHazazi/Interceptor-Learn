import 'package:flutter/material.dart';
import 'package:flutter_auth/src/features/bottom_nav/presentation/states/bloc/bottom_nav_bloc.dart';
import 'package:flutter_auth/src/features/home/presentation/widgets/home_page.dart';
import 'package:flutter_auth/src/features/schedule/presentation/widgets/schedule_page.dart';
import 'package:flutter_auth/src/features/profile/presentation/widgets/profile_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class BottomNavPage extends StatelessWidget {
  BottomNavPage({super.key});

  List<GButton> navItems = <GButton>[
    const GButton(icon: Icons.home_filled, text: 'Home'),
    const GButton(icon: Icons.calendar_month, text: 'Schedule'),
    const GButton(icon: Icons.person_2, text: 'Profile')
  ];

  Color navColor = const Color(0xFF2A506F);

  @override
  Widget build(BuildContext context) {
    BottomNavBloc myBottomNavBloc = context.read<BottomNavBloc>();

    List<StatelessWidget> screenPages = <StatelessWidget>[
      const HomePage(),
      const SchedulePage(),
      const ProfilePage(),
    ];

    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: navColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(1),
                  blurRadius: 8,
                  spreadRadius: 1,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: GNav(
                tabs: navItems,
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                onTabChange: (index) {
                  myBottomNavBloc.add(
                    TabChange(changeTabEvent: index),
                  );
                },
                rippleColor: Colors.blue,
                hoverColor: navColor,
                selectedIndex: state.tabIndex,
                activeColor: navColor,
                color: Colors.white,
                tabBackgroundColor: Colors.white,
                gap: 8,
              ),
            ),
          ),
          body: screenPages[state.tabIndex],
        );
      },
    );
  }
}
