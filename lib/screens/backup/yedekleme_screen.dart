import 'package:flutter/material.dart';

class YedeklemeScreen extends StatelessWidget {
  const YedeklemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yedekleme")),
      body: const Center(child: Text("Yedekleme işlemleri burada yer alacak.")),
    );
  }
}
