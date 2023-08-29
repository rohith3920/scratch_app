import 'package:flutter/material.dart';
import 'package:scratcher/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scratch Card',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        title: Text(
          "Scratch Card",
          style: TextStyle(
            color: Colors.tealAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.1,
              child: TextButton(
                onPressed: () {
                  showScratchCard(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor:
                      Colors.blue, // Replace with your desired background color
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                child: Text(
                  'scratch the Reward',
                  style: TextStyle(color: Colors.black),
                ),
              )),
        ),
      ),
    ));
  }
}

showScratchCard(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Scratcher(
          brushSize: 100,
          threshold: 50,
          color: Colors.lightBlue,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.32,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.18,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Image.network(
                    "https://c4.wallpaperflare.com/wallpaper/610/387/806/anime-naruto-jiraiya-naruto-naruto-uzumaki-wallpaper-preview.jpg",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "You\'ve won",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        letterSpacing: 1,
                        color: Colors.green),
                  ),
                ),
                Text(
                  "\9",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: Colors.green),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
