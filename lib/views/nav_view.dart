import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_ui/cubits/cubits.dart';
import 'package:netflix_ui/views/views.dart';

class NavView extends StatefulWidget {
  const NavView({Key? key}) : super(key: key);

  @override
  _NavViewState createState() => _NavViewState();
}

class _NavViewState extends State<NavView> {
  final List<Widget> _screens = [
    const HomeView(
      key: PageStorageKey("homeScreen"),
    ),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  final Map<String, IconData> _icons = const {
    "Home": Icons.home,
    "Search": Icons.search,
    "Coming Soon": Icons.queue_play_next,
    "Downloads": Icons.file_download,
    "More": Icons.menu
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBarCubit>(
      create: (context) => AppBarCubit(),
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: Stack(
          children: [
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
                child: Opacity(
                  opacity: 0.3,
                  child: BottomNavigationBar(
                    backgroundColor: Colors.black,
                    type: BottomNavigationBarType.fixed,
                    items: _icons
                        .map(
                          (title, icon) => MapEntry(
                            title,
                            BottomNavigationBarItem(
                                icon: Icon(
                                  icon,
                                  size: 30,
                                ),
                                label: title),
                          ),
                        )
                        .values
                        .toList(),
                    currentIndex: _currentIndex,
                    selectedItemColor: Colors.white,
                    selectedFontSize: 11,
                    unselectedItemColor: Colors.grey,
                    unselectedFontSize: 11,
                    onTap: (index) => setState(
                      () {
                        _currentIndex = index;
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
