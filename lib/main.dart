// Build Fonksiyonu Yan Etkisiz Olmalı
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
    // ogrenciler.add("build 'den"); // yapılabilecek bir hata
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "$sinif. Sınıf",
              textScaleFactor: 2,
            ),
            Text(
              baslik,
              textScaleFactor: 1.5,
            ),
            for (final o in ogrenciler)
              Text(
                o
              ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    ogrenciler.add("Yeni");
                  });
                },
                child: const Text(
                  "Ekle",
                ),
            )
          ],
        ),
      ),
    );
  }
}
