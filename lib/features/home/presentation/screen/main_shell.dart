import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zehnmind/config/router/app_router.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.child});

  final Widget child;

  int _currentIndex(String location) {
    if (location.startsWith(AppRoute.profile)) return 1;
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(AppRoute.home);
      case 1:
        context.go(AppRoute.profile);
    }
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final index = _currentIndex(location);
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => _onTap(context, i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.checklist_rounded),
            selectedIcon: Icon(Icons.checklist_rounded),
            label: 'Tasks',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
