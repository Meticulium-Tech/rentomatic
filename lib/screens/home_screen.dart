import 'package:flutter/material.dart';
import 'package:rentomatic/utils/utils.dart';
import 'package:ms_undraw/ms_undraw.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scsvc = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Meticiculum', style: Styles.title),
        backgroundColor: Palette.secondary,
      ),
      body: Container(
        child: SingleChildScrollView(
          controller: scsvc,
          child: Column(
            children: [
              UnDraw(
                  illustration: UnDrawIllustration.a_better_world,
                  color: Palette.light,
                  height: 50,
                  width: 50),
              Text(
                'soon available',
                style: Styles.body,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
        ],
      ),
      // bottomNavigationBar: ,
    );
  }
}
