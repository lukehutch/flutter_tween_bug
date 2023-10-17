import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  timeDilation = 10.0;
  runApp(const MyApp());
}

const String _heroTag = 'tag';

final _navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: _navigatorKey,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(50),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: InkWell(
                    onTap: () => _openHero(context),
                    child: Hero(
                      tag: _heroTag,
                      createRectTween: (begin, end) =>
                          RectTween(begin: begin, end: end),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset('assets/images/small.jpg'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openHero(BuildContext context) {
    _navigatorKey.currentState!.push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext pageContext, _, __) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: InkWell(
                onTap: () => _navigatorKey.currentState!.pop(),
                child: Hero(
                  tag: _heroTag,
                  createRectTween: (begin, end) =>
                      RectTween(begin: begin, end: end),
                  child: Image.asset('assets/images/large.jpg'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
