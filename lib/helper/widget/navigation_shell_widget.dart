import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationShellWidget extends StatelessWidget {
  const NavigationShellWidget({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width <= 490) {
      return Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
            onDestinationSelected: (index) {
              navigationShell.goBranch(index);
            },
            selectedIndex: navigationShell.currentIndex,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.settings), label: 'Setting')
            ]),
      );
    } else {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              labelType: NavigationRailLabelType.all,
                onDestinationSelected: (index) {
                  navigationShell.goBranch(index);
                },
                selectedIndex: navigationShell.currentIndex,
                destinations: const [
                  NavigationRailDestination(
                      icon: Icon(Icons.home), label: Text('Home')),
                  NavigationRailDestination(
                      icon: Icon(Icons.settings), label: Text('Setting'))
                ]),
            Expanded(child: navigationShell),
          ],
        ),
      );
    }
  }
}
