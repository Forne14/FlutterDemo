import 'package:flutter/material.dart';
import 'package:youtube_player/youtube_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Youtube Player',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'likkle youtube player'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _idController = TextEditingController();
  String id = "dQw4w9WgXcQ"; //starter video. just for the bants ya know.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            YoutubePlayer(
              context: context,
              source: id,
              quality: YoutubeQuality.HD,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _idController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter youtube link"
                ),
              ),
            ),
            RaisedButton(
              onPressed: (){
                setState(() {
                  id = _idController.text;
                });
              },
              child: Text("play"),
            ),
          ],
        ),
      ),
    );
  }
}
