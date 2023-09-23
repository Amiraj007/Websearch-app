import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyHome extends StatelessWidget {
  final List<String> searchSeven = [
    "wc", "xx", "ys", "za", "qd", "ga", "qs",
  ];
  final List<String> searchThree = [
    "hc", "tx", "rs",
  ];
  final List<String> searchTen = [
    "wcc", "xdx", "yfs", "ae", "qt", "oa", "lls","hcl", "tex", "ros",
  ];
  final List<String> searchStrings = [
    "Ra",
    "An",
    "Ye",
    "A",
    "B",
    "C",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "v",
    "u",
    "t",
    "s",
    "r",
    "w",
    "x",
    "y",
    "z",
    "q",
    "gqa",
    "qes",
    "gqd",
    "gq",
  ];

  @override
  Widget build(BuildContext context) {
    var num = 5;
    var nm=6;
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData.from(colorScheme: ColorScheme.light(background: Color(0xffc3cfe2),primary: Colors.transparent)),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffc3cfe2),elevation: 0,
          title: Text('String Search App',style: TextStyle(color: Colors.black),),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(style: ButtonStyle(elevation: MaterialStatePropertyAll(2),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewScreen(searchStrings,num),
                    ),
                  );
                },
                child: const Text('LogIn'),
              ),
              ElevatedButton(style: ButtonStyle(elevation: MaterialStatePropertyAll(2),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewSe(searchStrings),
                    ),
                  );
                },
                child: const Text('LogOut'),
              ),
              ElevatedButton(style: ButtonStyle(elevation: MaterialStatePropertyAll(2),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewScreen(searchStrings,nm),
                    ),
                  );
                },
                child: const Text('30 Search'),
              ),
              ElevatedButton(style: ButtonStyle(elevation: MaterialStatePropertyAll(2),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewScreen(searchTen,nm),
                    ),
                  );
                },
                child: const Text('10 Search'),
              ),
              ElevatedButton(style: ButtonStyle(elevation: MaterialStatePropertyAll(2),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewScreen(searchSeven,nm),
                    ),
                  );
                },
                child: const Text('7 Search'),
              ),
              ElevatedButton(style: ButtonStyle(elevation: MaterialStatePropertyAll(2),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewScreen(searchThree,nm),
                    ),
                  );
                },
                child: const Text('3 Search'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WebViewScreen extends StatefulWidget {
  final List<String> searchStrings;
  final num ;

  WebViewScreen(this.searchStrings,this.num);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewWidget _webView = WebViewWidget(controller: _controller);
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
          onNavigationRequest: (request) {
            return NavigationDecision.navigate;
          }));
    _controller = controller;
    _performSearches();
  }

  Future<void> _performSearches() async {
    if (widget.num == 5){
      await _controller.loadRequest(Uri.parse('https://www.bing.com'));
      setState(() {});
    }else{
      for (String query in widget.searchStrings) {
        await _controller.runJavaScript(
            'window.location.href = "https://www.bing.com/search?q=$query";');
        // Wait for a while to simulate user interaction
        await Future.delayed(const Duration(milliseconds: 700));
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: const Color(0xffc3cfe2),
        title:  const Text('Web View',style: TextStyle(color: Colors.black)),
      ),
      body: _webView,
      drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('amirajbhanderi01@gmail.com', textScaleFactor: 1.2),
                TextButton(
                  onPressed: () {
                    Clipboard.setData(const ClipboardData(text: 'Ami\$9999')).then(
                            (val) => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Copied!'))));
                    Navigator.pop(context);
                  },
                  child: const Text('Password', textScaleFactor: 2),
                ),
                const Divider(),
                const Text('arvindmavani69@outlook.com', textScaleFactor: 1.2),
                TextButton(
                  onPressed: () {
                    Clipboard.setData(const ClipboardData(text: 'arvind@99')).then(
                            (val) => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Copied!'))));
                    Navigator.pop(context);
                  },
                  child: const Text('Password ', textScaleFactor: 2),
                ),
                const Divider(),
                const Text('helimihir@outlook.com', textScaleFactor: 1.2),
                TextButton(
                  onPressed: () {
                    Clipboard.setData(const ClipboardData(text: 'mihir@99')).then(
                            (val) => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Copied!'))));
                    Navigator.pop(context);
                  },
                  child: const Text('Password ', textScaleFactor: 2),
                ),
                const Divider(),
                const Text('jaimintaklo@outlook.com', textScaleFactor: 1.2),
                TextButton(
                  onPressed: () {
                    Clipboard.setData(const ClipboardData(text: 'jaimin@99')).then(
                            (val) => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Copied!'))));
                    Navigator.pop(context);
                  },
                  child: const Text('Password ', textScaleFactor: 2),
                ),
                const Divider(),
                const Text('khushibhanderi7@gmail.com', textScaleFactor: 1.2),
                TextButton(
                  onPressed: () {
                    Clipboard.setData(const ClipboardData(text: 'khushi@8595'))
                        .then((val) => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Copied!'))));
                    Navigator.pop(context);
                  },
                  child: const Text('Password ', textScaleFactor: 2),
                ),
                const Divider(),
                const Text('manukakafake157@gmail.com', textScaleFactor: 1.2),
                TextButton(
                  onPressed: () {
                    Clipboard.setData(const ClipboardData(text: 'manukaka@99'))
                        .then((val) => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Copied!'))));
                    Navigator.pop(context);
                  },
                  child: const Text('Password ', textScaleFactor: 2),
                ),
                const Divider(),
                const Text('rajeshbhanderibhanderi707@gmail.com',
                    textScaleFactor: 1.2),
                TextButton(
                  onPressed: () {
                    Clipboard.setData(const ClipboardData(text: 'bhanderi@99'))
                        .then((val) => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Copied!'))));
                    Navigator.pop(context);
                  },
                  child: const Text('Password ', textScaleFactor: 2),
                ),
                const Divider(),
                const Text('rameshjiramesh007@gmail.com', textScaleFactor: 1.2),
                TextButton(
                  onPressed: () {
                    Clipboard.setData(const ClipboardData(text: 'ramesh@99')).then(
                            (val) => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Copied!'))));
                    Navigator.pop(context);
                  },
                  child: const Text('Password ', textScaleFactor: 2),
                ),
                const Divider(),
                const Text('slc.amiraj005@gmail.com', textScaleFactor: 1.2),
                TextButton(
                  onPressed: () {
                    Clipboard.setData(const ClipboardData(text: 'amiraj@99')).then(
                            (val) => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Copied!'))));
                    Navigator.pop(context);
                  },
                  child: const Text('Password ', textScaleFactor: 2),
                ),
              ],
            ),
          )),
    );
  }
}


class WebViewSe extends StatefulWidget {
  final List<String> searchStrings;

  WebViewSe(this.searchStrings);

  @override
  _WebViewSeState createState() => _WebViewSeState();
}

class _WebViewSeState extends State<WebViewSe> {
  late WebViewWidget _webView = WebViewWidget(controller: _controller);
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
          NavigationDelegate(onNavigationRequest: (request) {
        return NavigationDecision.navigate;
      }));
    _controller = controller;
    _clearAppData();
  }

  Future<void> _clearAppData() async {
    final secureStorage = const FlutterSecureStorage();
    await secureStorage.deleteAll();

    // Clear WebView cookies
    await _controller.clearLocalStorage();
    await _controller.clearCache();

    if (Platform.isAndroid) {
      final platform = const MethodChannel('app.channel.shared.data');
      await platform.invokeMethod('clearData');
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: const Color(0xffc3cfe2),
        title: const Text('LogOut'),
      ),
      body: _webView,
    );
  }
}
