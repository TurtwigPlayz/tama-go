import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gogi_ordering_interface/widgets/menu_item.dart';
import 'package:gogi_ordering_interface/providers/session_provider.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final session = Provider.of<SessionProvider>(context, listen: false);

    const double spacing = 12.0;

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(spacing),
        child: TabBarView(
          children: <Widget>[
            ...['All', ...session.menuCategories].map(
              (category) => GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      (MediaQuery.of(context).size.width / 300).floor(),
                  mainAxisSpacing: spacing,
                  crossAxisSpacing: spacing,
                  childAspectRatio: 0.75,
                ),
                itemCount: session.menuItems.where((menuItem) {
                  return category == 'All' ||
                      menuItem.categories.contains(category);
                }).length,
                itemBuilder: (context, index) {
                  final filteredItems = session.menuItems.where((menuItem) {
                    return category == 'All' ||
                        menuItem.categories.contains(category);
                  }).toList();

                  final menuItem = filteredItems[index];

                  return MenuItem(menuItem: menuItem);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
