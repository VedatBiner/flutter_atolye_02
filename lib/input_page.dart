import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

enum Cinsiyet {
  kadin,
  erkek,
  bos,
}

const okullar = ["ilkokul", "Ortaokul", "Lise", "Üniversite"];

class _InputPageState extends State<InputPage> {
  bool? okuldaMisin = false;
  Cinsiyet? cinsiyet = Cinsiyet.bos;
  String? okul;
  double boy = 100;
  TextEditingController yorumController = TextEditingController();

  @override
  void dispose() {
    yorumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Girdi Sayfası"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Checkbox(
              value: okuldaMisin,
              onChanged: (value) {
                setState(() {
                  okuldaMisin = value;
                }
               );
              }
            ),
            Switch(
              value: okuldaMisin!,
              onChanged: (value) {
                setState(() {
                  okuldaMisin = value;
                });
              }
            ),
            Text( // null olmaktan kurtulmak için
              okuldaMisin == true ? "Okuldasın" : "Okuda değilsin",
            ),
            Radio<Cinsiyet>(
              value: Cinsiyet.kadin,
              groupValue: cinsiyet,
              onChanged: (value) {
                setState(() {
                  cinsiyet = value;
                });
              },
            ),
            Radio<Cinsiyet>(
              value: Cinsiyet.erkek,
              groupValue: cinsiyet,
              onChanged: (value) {
                setState(() {
                  cinsiyet = value;
                });
              },
            ),
            Text(cinsiyet.toString()),
            DropdownButton<String>(
              value: okul,
              items: okullar.map(
                (e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                )
              ).toList(),
              onChanged: (value){
                setState(() {
                  okul = value;
                });
              },
            ),
            Text(okul ?? ""),
            Slider(
              value: boy,
              min: 30,
              max: 300,
              onChanged: (double value) {
                setState(() {
                  boy = value;
                });
              },
            ),
            Text(
              boy.toStringAsFixed(2), // noktadan sonra iki basamak koy
            ),
            TextField(
              controller: yorumController,
              onChanged: (value){
                setState(() {
                });
              },
            ),
            Text(yorumController.text),
            ElevatedButton(onPressed: (){
              setState(() {
                okuldaMisin = false;
                cinsiyet = Cinsiyet.bos;
                okul = null;
                boy = 100;
                yorumController.text = "";
              });
            }, child: Text("Temizle"))
          ],
        ),
      ),
    );
  }
}
