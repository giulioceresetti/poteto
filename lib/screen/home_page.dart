import 'package:flutter/material.dart';
import 'package:poteto/business/flutter_bsn.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  String title = 'Poteto Home Page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<int> getNumber() async  {
    return  await FlutterBsn.countActivities();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder<int>(
            future: getNumber(),
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasData) {
                return Column(mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Attività da fare: ${snapshot.data}",
                      style: TextStyle(fontSize: 35),
                    ),
                    const SizedBox(height: 100),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/add_page');
                      },
                      child: const Text('Aggiungi attività',
                          style: TextStyle(fontSize: 20)),
                    ),
                    const SizedBox(height: 30),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/rand_page');
                      },
                      padding: const EdgeInsets.all(0.0),
                      child: const Text('Sorprendimi!',
                          style: TextStyle(fontSize: 30)),
                    ),
                  ],
                );
              } else {
               return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
