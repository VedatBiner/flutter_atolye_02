// Ekran tasarımı denemeleri
// Row, expanded, flesible, spacer
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // tek sefer çalışacağı kabul edilebilir bir kullanım
    // ogrenciler.add("initState 'den");
  }
  var sinif = 5;
  var baslik = "Öğrenciler";
  var ogrenciler = ["Ali", "Ayşe", "Can"];
  @override
  Widget build(BuildContext context) {
    print("MyHomePageState Build...");
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.red,
                ),
                Text(
                  "$sinif. Sınıf",
                  textScaleFactor: 2,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.red,
                )
              ],
            ),
            Text(
              baslik,
              textScaleFactor: 1.5,
            ),
            for (final o in ogrenciler)
              Text(
                  o
              ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    ogrenciler.add("Yeni");
                  });
                },
                child: const Text(
                  "Ekle",
                ),
              ),
            ),
            SizedBox(
              width: 100,
              height: 200,
              child: Container(
                color: Colors.yellow,
                child: Center(
                  child: Container(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                      child: Container(
                        width: 50,
                        height: 100,
                        color: Colors.red,
                        child: const Center(
                          child: Text(
                            "AAA",
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
                children: const [
                  Flexible(
                    child:
                    Text(
                        "Flexible"
                    ),
                  ),
                  Flexible(
                    child:
                    Text(
                        "Flexible"
                    ),
                  ),
                  Expanded(
                    child: Text(
                        "Expanded"
                    ),
                  ),
                  Text(
                      "Merhaba ve spacer"
                  ),
                  Spacer(),
                  Text(
                      "Merhaba"
                  ),
                  Text(
                      "Merhaba"
                  ),
                ]
            ),
          ],
        ),
      ),
    );
  }
}
