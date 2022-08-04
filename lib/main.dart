// Tasarım Örneği - Biraz daha Widget ağacı
// Veri akışı
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
    ogrenciler.add("init");
  }

  var sinif = 5;
  var baslik = "Öğrenciler";
  var ogrenciler = ["Mehmet", "Vedat", "Zeynep"];

  void yeniOgrenciEkle(String yeniOgrenci){
    setState(() {
      ogrenciler.add(yeniOgrenci);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("MyHomePageState Build ...");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Sinif(
        sinif: sinif,
        baslik: baslik,
        ogrenciler: ogrenciler,
        yeniOgrenciEkle: yeniOgrenciEkle,

      ),
    );
  }
}

class Sinif extends StatelessWidget {
  const Sinif({
    Key? key,
    required this.sinif,
    required this.baslik,
    required this.ogrenciler,
    required this.yeniOgrenciEkle,
  }) : super(key: key);

  final int sinif;
  final String baslik;
  final List<String> ogrenciler;
  final void Function(String yeniOgrenci) yeniOgrenciEkle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            ),
          ],
        ),
        Text(
          baslik,
          textScaleFactor: 1.5,
        ),
        OgrenciListesi(ogrenciler: ogrenciler),
        OgrenciEkleme(yeniOgrrenciEkle: yeniOgrenciEkle),
      ],
    );
  }
}

class OgrenciListesi extends StatelessWidget {
  const OgrenciListesi({
    Key? key,
    required this.ogrenciler,
  }) : super(key: key);

  final List<String> ogrenciler;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children:[
        for (final o in ogrenciler)
          Text(
              o
          ),
      ],
    );
  }
}

class OgrenciEkleme extends StatefulWidget {

  const OgrenciEkleme({
    Key? key, required this.yeniOgrrenciEkle,
  }) : super(key: key);

  final void Function(String yeniOgrenci) yeniOgrrenciEkle;

  @override
  State<OgrenciEkleme> createState() => _OgrenciEklemeState();
}

class _OgrenciEklemeState extends State<OgrenciEkleme> {
  final controller = TextEditingController();

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: controller,
          onChanged: (value) {
            setState(() {

            });
          },
        ),
        ElevatedButton(
          onPressed: controller.text.isEmpty? null :  (){
            final yeniOgrenci = controller.text;
            widget.yeniOgrrenciEkle(yeniOgrenci);
            controller.text = "";
            // setState(() {
            //   ogrenciler.add("yeni");
            //  });
          },
          child: const Text(
            "Ekle",
          ),
        ),
      ],
    );
  }
}
