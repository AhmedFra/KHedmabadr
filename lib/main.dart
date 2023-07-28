import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'tasks.dart';

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutee',
      theme: ThemeData(),
      home: HomePage(),
  
    ),
  ));
}


