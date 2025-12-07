import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gogi_ordering_interface/providers/theme_provider.dart';
import 'package:gogi_ordering_interface/models/menu_item_model.dart';
import 'package:gogi_ordering_interface/providers/session_provider.dart';
import 'package:gogi_ordering_interface/theme_data.dart';
import 'package:gogi_ordering_interface/widgets/bottom_bar.dart';
import 'package:gogi_ordering_interface/widgets/menu_container.dart';
import 'package:gogi_ordering_interface/widgets/order_panel.dart';
import 'package:gogi_ordering_interface/widgets/top_bar.dart';

void main() {
  const menuItems = <MenuItemModel>[
    // Soups and Salads
    MenuItemModel(
      name: 'Miso Soup',
      unitPrice: 3.99,
      imagePath: 'images/menu/Miso-Soup.jpg',
      categories: <String>['Soups and Salads'],
      dropdownOptions: <String, List<String>>{
        'Size': <String>['Small', 'Large'],
        'Add Tofu': <String>['No', 'Yes'],
      },
      description:
          'A comforting Japanese soup with miso broth, green onions, and tofu.',
    ),
    MenuItemModel(
      name: 'Avocado Salad',
      unitPrice: 7.99,
      imagePath: 'images/menu/avacadoSalad.jpg',
      categories: <String>['Soups and Salads'],
      dropdownOptions: <String, List<String>>{
        'Dressing': <String>['Sesame', 'Ginger', 'Soy Vinaigrette'],
      },
      description:
          'Fresh avocado slices over mixed greens with your choice of dressing.',
    ),
    MenuItemModel(
      name: 'Cucumber Salad',
      unitPrice: 5.99,
      imagePath: 'images/menu/Cucumber.jpg',
      categories: <String>['Soups and Salads'],
      description: 'Thinly sliced cucumbers in a tangy vinegar dressing.',
    ),
    MenuItemModel(
      name: 'Kani Salad',
      unitPrice: 8.49,
      imagePath: 'images/menu/Kani.jpg',
      categories: <String>['Soups and Salads'],
      dropdownOptions: <String, List<String>>{
        'Spice Level': <String>['Mild', 'Medium', 'Spicy'],
      },
      description:
          'Shredded crab stick with cucumber and masago in spicy mayo.',
    ),
    MenuItemModel(
      name: 'Seaweed Salad',
      unitPrice: 6.49,
      imagePath: 'images/menu/seaweed.jpg',
      categories: <String>['Soups and Salads'],
      description:
          'Seasoned seaweed salad with a savory-sweet sesame dressing.',
    ),

    // Appetizer
    MenuItemModel(
      name: 'Beef Gyoza Dumpling',
      unitPrice: 8.99,
      imagePath: 'images/menu/beef.jpg',
      categories: <String>['Appetizer'],
      defaultOptions: <String, bool>{
        'Pan-Fried': true,
        'Steamed': false,
      },
      description: 'Crispy beef dumplings with soy dipping sauce.',
    ),
    MenuItemModel(
      name: 'Crab Rangoon',
      unitPrice: 7.99,
      imagePath: 'images/menu/crab.jpg',
      categories: <String>['Appetizer'],
      description: 'Golden wontons filled with crab and cream cheese.',
    ),
    MenuItemModel(
      name: 'Edamame',
      unitPrice: 5.49,
      imagePath: 'images/menu/edamame.jpg',
      categories: <String>['Appetizer'],
      dropdownOptions: <String, List<String>>{
        'Seasoning': <String>['Sea Salt', 'Garlic', 'Spicy'],
      },
      description: 'Steamed soybeans lightly seasoned to your taste.',
    ),
    MenuItemModel(
      name: 'Spring Roll',
      unitPrice: 6.49,
      imagePath: 'images/menu/spring.jpg',
      categories: <String>['Appetizer'],
      defaultOptions: <String, bool>{
        'Vegetable': true,
        'Add Shrimp': false,
      },
      description: 'Crispy rolls filled with vegetables.',
    ),
    MenuItemModel(
      name: 'Shrimp Tempura',
      unitPrice: 10.49,
      imagePath: 'images/menu/Shrimp.jpg',
      categories: <String>['Appetizer'],
      description: 'Battered shrimp fried light and crispy.',
    ),
    MenuItemModel(
      name: 'Shrimp Shumai Dumpling',
      unitPrice: 8.49,
      imagePath: 'images/menu/shumai.jpg',
      categories: <String>['Appetizer'],
      description: 'Steamed shrimp dumplings with dipping sauce.',
    ),

    // Kitchen Entree
    MenuItemModel(
      name: 'Beef Fried Rice',
      unitPrice: 14.99,
      imagePath: 'images/menu/rice.jpg',
      categories: <String>['Kitchen Entree'],
      dropdownOptions: <String, List<String>>{
        'Rice Type': <String>['White Rice', 'Brown Rice'],
      },
      description: 'Fried rice mixed with tender beef and vegetables.',
    ),
    MenuItemModel(
      name: 'Hibachi Steak',
      unitPrice: 19.99,
      imagePath: 'images/menu/Steak.jpg',
      categories: <String>['Kitchen Entree'],
      dropdownOptions: <String, List<String>>{
        'Doneness': <String>['Rare', 'Medium', 'Well Done'],
        'Side': <String>['Fried Rice', 'Steamed Rice', 'Veggies'],
      },
      description: 'Grilled hibachi-style steak with side options.',
    ),
    MenuItemModel(
      name: 'Hibachi Shrimp',
      unitPrice: 18.49,
      imagePath: 'images/menu/HiShrimp.jpg',
      categories: <String>['Kitchen Entree'],
      description: 'Fresh hibachi-grilled shrimp with sides.',
    ),
    MenuItemModel(
      name: 'Beef Yakisoba Noodle',
      unitPrice: 15.49,
      imagePath: 'images/menu/Yakisoba.jpg',
      categories: <String>['Kitchen Entree'],
      description: 'Stir-fried yakisoba noodles with beef.',
    ),
    MenuItemModel(
      name: 'Chicken Fried Rice',
      unitPrice: 13.99,
      imagePath: 'images/menu/Chicken.jpg',
      categories: <String>['Kitchen Entree'],
      description: 'Classic chicken fried rice.',
    ),

    // Sushi & Sashimi
    MenuItemModel(
      name: 'Tuna',
      unitPrice: 5.99,
      imagePath: 'images/menu/Tuna.jpg',
      categories: <String>['Sushi and sashimi'],
      dropdownOptions: <String, List<String>>{
        'Style': <String>['Sushi', 'Sashimi'],
      },
      description: 'Fresh tuna served sushi or sashimi style.',
    ),
    MenuItemModel(
      name: 'White Tuna Sushi',
      unitPrice: 6.49,
      imagePath: 'images/menu/White.jpg',
      categories: <String>['Sushi and sashimi'],
      description: 'Delicate white tuna sushi.',
    ),
    MenuItemModel(
      name: 'Shrimp',
      unitPrice: 5.49,
      imagePath: 'images/menu/ShrimpSushi.jpg',
      categories: <String>['Sushi and sashimi'],
      description: 'Cooked shrimp sushi or sashimi.',
    ),
    MenuItemModel(
      name: 'Salmon',
      unitPrice: 5.99,
      imagePath: 'images/menu/Salmon.jpg',
      categories: <String>['Sushi and sashimi'],
      description: 'Rich, buttery salmon sushi or sashimi.',
    ),
    MenuItemModel(
      name: 'Masago',
      unitPrice: 4.99,
      imagePath: 'images/menu/Masago.jpg',
      categories: <String>['Sushi and sashimi'],
      description: 'Smelt roe served over rice or as a topping.',
    ),

    // Drinks
    MenuItemModel(
      name: 'Juice',
      unitPrice: 2.99,
      imagePath: 'images/menu/juice.jpg',
      dropdownOptions: <String, List<String>>{
        'Type': <String>['Apple', 'Orange', 'Mango', 'Peach', 'Lychee', 'Pineapple'],
        'Ice Level': <String>['Ice', 'No Ice', 'Less Ice'],
      },
      categories: <String>['Drinks'],
      description: 'Fresh juice with flavor choices.',
    ),
    MenuItemModel(
      name: 'Korean Juice',
      unitPrice: 3.99,
      imagePath: 'images/menu/korean_pear_juice.jpg',
      categories: <String>['Drinks'],
      description: 'Sweet Korean pear juice.',
    ),
    MenuItemModel(
      name: 'Milkis Soda',
      unitPrice: 2.99,
      imagePath: 'images/menu/milkis_soda.jpg',
      categories: <String>['Drinks'],
      description: 'Creamy, carbonated soft drink.',
    ),
    MenuItemModel(
      name: 'Pop',
      unitPrice: 1.99,
      imagePath: 'images/menu/pop.jpg',
      dropdownOptions: <String, List<String>>{
        'Pop': <String>['Coca Cola', 'Sprite', 'Iced Tea', 'Lemonade'],
        'Ice Level': <String>['Ice', 'No Ice', 'Less Ice'],
      },
      categories: <String>['Drinks'],
      description: 'Classic fountain drinks.',
    ),
    MenuItemModel(
      name: 'Water',
      unitPrice: 0.00,
      imagePath: 'images/menu/water.jpg',
      dropdownOptions: <String, List<String>>{
        'Ice Level': <String>['Ice', 'No Ice', 'Less Ice'],
      },
      categories: <String>['Drinks'],
      description: 'Refreshing water.',
    ),
  ];

  const menuCategories = <String>[
    'Soups and Salads',
    'Appetizer',
    'Kitchen Entree',
    'Sushi and sashimi',
    'Drinks',
  ];

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SessionProvider(menuItems, menuCategories),
        ),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) => MaterialApp(
        title: 'Gogi Ordering Interface',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: theme.themeMode,
        home: const DefaultTabController(
          length: 6,
          child: Scaffold(
            body: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      TopBar(),
                      Expanded(child: MenuPage()),
                      BottomBar(),
                    ],
                  ),
                ),
                OrderPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
