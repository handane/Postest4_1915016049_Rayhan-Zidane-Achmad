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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Online Course"),
      ),
      body: ListData(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text("ini drawer"),
            ),
            ListTile(
              leading: Icon(Icons.coronavirus),
              title: Text("hal tiga"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) {
                    return ThirdPage();
                  },
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}

class ListData extends StatefulWidget {
  const ListData({ Key? key }) : super(key: key);

  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  List names = [
    "HTML",
    "CSS",
    "PHP",
    "Ruby",
    "Python",
    "C++",
    "C#",
    "Dart",
    "Flutter",
    "Kotlin",
    "MySQL",
    "Swift",
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
      child: ListView.builder(itemBuilder: (BuildContext context, int index){
        final number = index + 1;
        final name = names[index].toString();
        return new Card(
          
          child: new Padding(
            padding: const EdgeInsets.all(15.0),
            
            child: new Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Image.asset(
                  'images/_$number.JPG', width: 150,
                ),
                Text(name),
                Text("Rp 20K"),
                Container(
                  child: ElevatedButton(
                    child: Text("Beli"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (_) {
                          return ThirdPage();
                        },
                      ));
                    }),
                )
                ],
            ),
          ),
        );
      },itemCount: names.length,),
    ),
    );
  }
} 

class SecondPage extends StatelessWidget {
  final List<Widget> tabBody = [
    Icon(Icons.chat),
    Icon(Icons.photo),
    Icon(Icons.phone),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("halaman kedua"),
          backgroundColor: Colors.green[600],
          bottom: TabBar(tabs: [
            Tab(text: "Chats"),
            Tab(text: "Story"),
            Tab(text: "Panggilan"),
          ]),
        ),
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  List<BottomNavigationBarItem> bottomNavbaritems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: "Lihat",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.payment),
      label: "Bayar",
    ),
  ];

  int _index = 0;

  List<Widget> tabBody = [
    Container(
          child: new Padding(
            padding: const EdgeInsets.all(1.0),
            
            child: new Column(
              
              children: [
                 Image.asset(
                  'images/_9.JPG', width: 400,
                ),
                Text('Belajar Flutter Pro', 
                style: TextStyle(
                  fontSize: 30,
                  fontWeight:FontWeight.bold)),
                Text("Rp 20.000",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight:FontWeight.bold,
                  color: Colors.red)),
                Text(" ",
                style: TextStyle(
                  height: 3,
                )),
                Text("Apa yang dipelajari:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight:FontWeight.bold)),
                Text("1. Dasar-dasar Pemrograman Android dengan flutter",textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,)),
                Text("2. menginstal aplikasi Android studio dan vscode menggunakan flutter",
                style: TextStyle(
                  fontSize: 18,)),
                Text("3. Belajar pengoperasian emulator android di android studio",
                style: TextStyle(
                  fontSize: 18,)),
                Text("4. Membuat aplikasi android pemula dengan flutter",
                style: TextStyle(
                  fontSize: 18,)),
                ],
            ),
          ),
    ),
   
    Container(
      padding: new EdgeInsets.all(10.0),
      child: new Column(
        children: <Widget>[
          new TextField(
            decoration: new InputDecoration(
              hintText: "Nama Lengkap",
              labelText: "Nama Lengkap",
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(20.0)
              )
            ),
          ),
          new Padding(padding: new EdgeInsets.only(top: 20.0),),
          new TextField(
            decoration: new InputDecoration(
              hintText: "Umur",
              labelText: "Umur",
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(20.0)
              )
            ),
          ),
          new Padding(padding: new EdgeInsets.only(top: 20.0),),
          new TextField(
            maxLines: 3,
            decoration: new InputDecoration(
              hintText: "Mengapa ingin belajar disini",
              labelText: "mengapa ingin belajar disini",
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(20.0)
              )
            ),
          ),
          new Padding(padding: new EdgeInsets.only(top: 20.0),),
          new TextField(
            maxLines: 3,
            decoration: new InputDecoration(
              hintText: "Metode Pembayaran",
              labelText: "Metode Pembayaran",
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(20.0)
              )
            ),
          ),
        ],
        
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Pelajaran"),
        backgroundColor: Color.fromARGB(255, 164, 43, 150),
      ),
      body: tabBody.elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavbaritems,
        currentIndex: _index,
        onTap: (int index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}

class Formulir extends StatefulWidget {
  const Formulir({ Key? key }) : super(key: key);

  @override
  State<Formulir> createState() => _FormulirState();
}

enum Gender { mahasiswa, bekerja }

class _FormulirState extends State<Formulir> {
  String namaDepan = "-", namaBelakang = "-";

  final namaDepanController = TextEditingController();
  final namaBelakangController = TextEditingController();
  bool? isActive = false;
  Gender? status = Gender.mahasiswa;

  @override
  void dispose() {
    // TODO: implement dispose

    namaDepanController.dispose();
    namaBelakangController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("formulir"),
      ),
      body: ListView(
        children: [
          Text( 
            "Nama saya: ${namaDepan} ${namaBelakang}",
            style: TextStyle(fontSize: 30),
          ),
          Divider(),
          TextField(
            controller: namaDepanController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "masukkan nama",
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            maxLines: 4,
            controller: namaBelakangController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Nama belakang",
            ),
          ),
          ListTile(
            leading: Radio(
              value: Gender.mahasiswa,
              groupValue: status,
              onChanged: (Gender? value) {
                setState(() {
                  status = value;
                });
              },
            ),
            title: Text("Mahasiswa"),
          ),
          ListTile(
            leading: Radio(
              value: Gender.bekerja,
              groupValue: status,
              onChanged: (Gender? value) {
                setState(() {
                  status = value;
                });
              },
            ),
            title: Text("Bekerja"),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: isActive,
                onChanged: (value) {
                  setState(() {
                    isActive = value;
                  });
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                namaDepan = namaDepanController.text;
                namaBelakang = namaBelakangController.text;
              });
            },
            child: Text("Tampilkan Output"),
          ),
        ],
      ),
    );
  }
}
