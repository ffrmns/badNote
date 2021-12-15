import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Argumen {
  final String jenis;
  Argumen(this.jenis);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bukan Google Keep',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HalamanUtama(),
        '/HalamanInput': (context) => HalamanInput(),
        '/HalamanDaftar': (context) => HalamanDaftar(),
      }
    );
  }
}

class HalamanUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jurnal Mingguanmu 2021!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Aplikasi Jurnal Mingguanmu 2021! ini siap memfasilitasi kamu untuk menjadikan pekan-pekanmu terdokumentasi dengan baik'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/HalamanInput',
                      arguments: Argumen('Kejadian Top'),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Kejadian\ntop!'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/HalamanInput',
                      arguments: Argumen('Kejadian Diri Sendiri'),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Kejadiannya\ndiri sendiri!'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/HalamanInput',
                      arguments: Argumen('Kejadian orang-orang'),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Kejadiannya\norang-orang!'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/HalamanInput',
                      arguments: Argumen('Kejadian Apa Aja'),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Kejadian\napa aja!'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HalamanInput extends StatelessWidget {
  String? _kejadian;
  @override
  num minggu = (DateTime.now().millisecondsSinceEpoch-1609459200000)~/(7*24*3600*1000);
  String get ms => minggu.toString();
  Widget build(BuildContext context) {
    final ar = ModalRoute.of(context)!.settings.arguments as Argumen;
    return Scaffold(
      body: Center(
        child: Column (
          children: [
          Padding(
            padding: EdgeInsets.all(50),
            child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               Text(
                 'Apa kejadiannya?',
                 style: TextStyle(fontSize:30), 
               ),
               Text('Sekarang minggu ke-$ms'),
               Text('Kategori: '+ar.jenis),
             ],
            ),
          ),
          Masukan(),
          ElevatedButton(
            onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/HalamanDaftar',
                      arguments: Argumen('kejadiantop'),
                    );
            },
            child: Text('Serahkan'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Kembali ke awal'),
          ),

          ],
        ),
      ),
    );
  }
}

class Masukan extends StatefulWidget {
  final String? jenis;
  Masukan({Key? key, this.jenis}):super(key:key);
  @override
  _apaAda createState() => _apaAda();
}

class _apaAda extends State<Masukan> {
  String _kejadian = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
            children: [
            TextField(
            maxLines: null,
            decoration: InputDecoration(
              labelText: "Masukkan kejadiannya",
              hintText: "Hari ini aku menyelesaikan proyek portofolio",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onChanged: (String value) {
              setState((){
                _kejadian = value;
              });
            },
          ),
          Text('$_kejadian'),
          ])
    );
  }
}

class HalamanDaftar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children:[
          Padding(
            padding: EdgeInsets.all(10),
            child: Center(child: Text('Daftar Jurnal'),),
          ),
          Card(color:Colors.amber,child:Text('Hello'),),
          Container(
            height:300,
            color: Colors.blue,
            child: Padding(padding:EdgeInsets.all(10),child:Column(children:[Text('Minggu ke-22'),Container(height:200,color: Colors.grey,child:Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children:[Column(children:[Text('Kejadian\nTop')]),Column(children:[Text('Kejadian\nDiri Sendiri')]),Column(children:[Text('Kejadian\n Orang')]),Column(children:[Text('Kejadian\n Lainnya')]),])),],),),
          ),
          Container(
            height:100,
            color: Colors.red,
          ),
          Container(
            height:100,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
