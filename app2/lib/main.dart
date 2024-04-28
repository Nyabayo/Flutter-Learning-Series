import 'package:flutter/material.dart';

// MyAppBar is a StatelessWidget which doesn't require mutable state.
class MyAppBar extends StatelessWidget {
  // Constructor with required fields. `key` is optional for widget identification.
  const MyAppBar({required this.title, super.key});

  // Immutable field 'title', which is a widget.
  final Widget title;

  // Override build method to describe how to display the widget in terms of other, lower-level widgets.
  @override
  Widget build(BuildContext context) {
    // Container widget acts as a structural element to customize its child widget's size and decoration.
    return Container(
      height: 56, // Height set in logical pixels.
      padding: const EdgeInsets.symmetric(
          horizontal:
              8), // Symmetrical horizontal padding inside the container.
      decoration: BoxDecoration(
          color: Colors
              .blue[500]), // Decorates the background with a shade of blue.
      // Row is a layout widget that displays its children in a horizontal array.
      child: Row(
        children: [
          // IconButton is a graphical button to interact with, here it is used to display a menu icon.
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // Button is disabled by null onPressed function.
          ),
          // Expanded widget to stretch its child to fill the extra space in the Row.
          Expanded(
            child: title,
          ),
          // Another IconButton for displaying a search icon.
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null, // Also disabled.
          ),
        ],
      ),
    );
  }
}

// MyScaffold is another StatelessWidget.
class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // Material is a widget that implements the Material Design visual layout structure.
    return Material(
      // Column is a layout widget that arranges its children vertically.
      child: Column(
        children: [
          // MyAppBar included as a child of Column, passing a Text widget as the title.
          MyAppBar(
            title: Text(
              'Example title',
              // Style the text using the current theme's title style.
              style: Theme.of(context).primaryTextTheme.titleLarge,
            ),
          ),
          // Expanded widget to use all remaining space in the column after the app bar.
          const Expanded(
            child: Center(
              // Center is a layout widget that centers its child within itself.
              child: Text('Hello, world!'), // Simple text inside the center.
            ),
          ),
        ],
      ),
    );
  }
}

// Main entry point of the application.
void main() {
  runApp(
    // MaterialApp is a widget that wraps a number of widgets that commonly required material applications.
    const MaterialApp(
      title: 'My app', // Title for the OS task switcher.
      home: SafeArea(
        // SafeArea widget adds padding to avoid intrusions by the operating system.
        child: MyScaffold(), // The custom scaffold declared earlier.
      ),
    ),
  );
}
