import 'package:flutter/material.dart';
import 'package:websearch/mobile.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.dark(background: Colors.transparent)),
      title: 'String Search App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> searchStrings = [
    "A","B", "C", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "v", "u", "t", "s", "r", "w", "x", "y", "z", "q", "gqa", "qes", "gqd", "gq",
  ];
  final List<String> searchSeven = [
    "wc", "xx", "ys", "za", "qd", "ga", "qs",
  ];
  final List<String> searchThree = [
    "hc", "tx", "rs",
  ];
  final List<String> searchTen = [
    "wcc", "xdx", "yfs", "ae", "qt", "oa", "lls","hcl", "tex", "ros",
  ];

  Future<void> searchOnWeb(String query) async {
    final url = Uri.parse('https://www.bing.com/search?q=$query');
    await Future.delayed(Duration(milliseconds: 300));
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('String Search App'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {});
                for (String query in searchStrings) {
                  searchOnWeb(query);
                }
              },
              child: Text('Search Strings on Web'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                for (String query in searchSeven) {
                  searchOnWeb(query);
                }
              },
              child: Text('7 search'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                for (String query in searchThree) {
                  searchOnWeb(query);
                }
              },
              child: Text('3 Search '),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                for (String query in searchTen) {
                  searchOnWeb(query);
                }
              },
              child: Text('10 Search '),
            ),
          ],
        ),
      ),
    );
  }
}

