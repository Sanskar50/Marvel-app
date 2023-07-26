import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String image = "";
  String title = "Welcome to the Marvel app";

  void changeImg(String ig) {
    setState(() {
      image = ig;
      title = ig;
    });
  }

  void reset() {
    setState(() {
      image = "";
      title = "Welcome to the Marvel app";
    });
  }

  void _imageSelector(BuildContext ctx) {
    showModalBottomSheet(
      backgroundColor: Colors.black,
      context: ctx,
      builder: (_) {
        return Container(
          height: 300,
          child: GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Select any Character",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              changeImg('THOR');
                              Navigator.of(context).pop();
                            },
                            child: const Text('THOR')),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              changeImg('IRONMAN');
                              Navigator.of(context).pop();
                            },
                            child: const Text('IRONMAN')),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              changeImg('SPIDERMAN');
                              Navigator.of(context).pop();
                            },
                            child: const Text('SPIDERMAN')),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              changeImg('DR-STRANGE');
                              Navigator.of(context).pop();
                            },
                            child: const Text('DR-STRANGE')),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                            onPressed: () {
                              changeImg('CAPTAIN-AMERICA');
                              Navigator.of(context).pop();
                            },
                            child: const Text('CAPTAIN-AMERICA')),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () {
                    reset();
                    Navigator.of(context).pop();
                  },
                  child: const Text('RESET'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Marvel App'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          Text(
            // ignore: unnecessary_string_interpolations
            "$title",
            // ignore: prefer_const_constructors
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: image == ""
                  ? Image.asset(
                      'assets/images/MARVEL.jpg',
                      fit: BoxFit.cover,
                      height: 280,
                      width: 300,
                    )
                  : Image.asset(
                      'assets/images/$image.jpg',
                      fit: BoxFit.cover,
                      height: 350,
                      width: 300,
                    ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "\"An App by MR SS\"",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _imageSelector(context),
      ),
    );
  }
}
