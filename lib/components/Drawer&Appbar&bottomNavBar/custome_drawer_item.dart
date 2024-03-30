import 'package:events_app/core/constants/theme.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final int index;
  final int selectedIndex;
  final Function(int) onItemTapped;
  final Color selectedColor;

  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.index,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: AnimatedContainer(
        duration:
            const Duration(milliseconds: 300), // Duration of the animation
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? ThemesStyles.primary
              : Theme.of(context).brightness == Brightness.dark
                  ? ThemesStyles.backgroundDark
                  : ThemesStyles.secondary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: ListTile(
          title: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              style: TextStyle(
                color: selectedIndex == index
                    ? ThemesStyles.secondary
                    : ThemesStyles.primary,
              ),
            ),
          ),
          tileColor:
              selectedIndex == index ? selectedColor : Colors.transparent,
          leading: Icon(icon,
              color: selectedIndex == index
                  ? ThemesStyles.secondary
                  : ThemesStyles.primary),
          selected: selectedIndex == index,
        ),
      ),
    );
  }
}
