import 'package:flutter/material.dart';

class Default extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Found Page'),
      ),
      body: const Center(
        child:  Text('Welcome to my app!'),
      ),
    );
  }
}

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Not Found'),
      ),
      body: const Center(
        child: Text('Sorry, the page you requested was not found.'),
      ),
    );
  }
}
