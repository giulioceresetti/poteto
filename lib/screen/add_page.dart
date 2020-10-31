import 'package:flutter/material.dart';
import 'package:poteto/business/flutter_bsn.dart';
import 'package:poteto/dto/activity.dart';

class AddPage extends StatefulWidget {
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String testo;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aggiungine una"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                onChanged: (value) {
                  testo = value;
                },
                validator: (value) {
                  if (value.length< 10 ) {
                    return "Inserisci qualcosa da fare";
                  }else
                  return null;
                },
              ),
              const SizedBox(height: 100),
              RaisedButton(
                onPressed: () {
                  Activity a = new Activity();
                  a.name = testo;
                  FlutterBsn.addActivity(a).then(
                      (value) {
                        Navigator.pop(context);
                      }
                  ).catchError((err) {

                    Scaffold
                        .of(context)
                        .showSnackBar(SnackBar(content: Text('Errore: $err')));
                  });
                },
                padding: const EdgeInsets.all(0.0),
                child: const Text('Aggiungi', style: TextStyle(fontSize: 30)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
