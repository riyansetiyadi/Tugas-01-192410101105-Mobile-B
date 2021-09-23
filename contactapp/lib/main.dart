import 'package:flutter/material.dart';
import "dart:math";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Contact List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Contact> contacts = [
    Contact("images/gianluigidonnarumma.png", "Navisa Kholifatul Jannah", "182410102023@mail.unej.ac.id", "08182410102023"),
    Contact("images/harrykane.png", "ANNISA RAHMAWATI", "182410102050@mail.unej.ac.id", "08182410102050"),
    Contact("images/jorginho.png", "Muhamad Wijayanto", "192410101096@mail.unej.ac.id", "08192410101096"),
    Contact("images/kevindebruyne.png", "Riyan Setiyadi Hidayatullah", "192410101105@mail.unej.ac.id", "08192410101105"),
    Contact("images/kylianmbappe.png", "Rozin Hilmi Annabhan", "192410101112@mail.unej.ac.id", "08192410101112"),
    Contact("images/martinbraithwaite.png", "Sofyatul Masykuroh", "192410102001@mail.unej.ac.id", "08192410102001"),
    Contact("images/messi.png", "Muhammad Sultan Hasbie Asshidiqqie", "192410102007@mail.unej.ac.id", "08192410102007"),
    Contact("images/ngolokante.png", "Dhia Hayyu Syahirah", "192410102008@mail.unej.ac.id", "08192410102008"),
    Contact("images/raheemsterling.png", "Candra Wulan Ana Rawati", "192410102009@mail.unej.ac.id", "08192410102009"),
    Contact("images/robertlewandowski.png", "Indri Fatmawati", "192410102017@mail.unej.ac.id", "08192410102017"),
    Contact("images/ronaldo.jpg", "Deska Dwi Zahratun Nisa", "192410102018@mail.unej.ac.id", "08192410102018"),
    Contact("images/gianluigidonnarumma.png", "Cahyo Tri Nugroho", "192410102019@mail.unej.ac.id", "08192410102019"),
    Contact("images/harrykane.png", "Nida Fara Aprilia", "192410102023@mail.unej.ac.id", "08192410102023"),
    Contact("images/jorginho.png", "Naufal Zakly Santoso", "192410102026@mail.unej.ac.id", "08192410102026"),
    Contact("images/kevindebruyne.png", "FAWAZ ABDURRAHMAN", "192410102030@mail.unej.ac.id", "08192410102030"),
    Contact("images/kylianmbappe.png", "Silva Anggraini", "192410102032@mail.unej.ac.id", "08192410102032"),
    Contact("images/martinbraithwaite.png", "I`ZAZ DHIYA 'ULHAQ", "192410102033@mail.unej.ac.id", "08192410102033"),
    Contact("images/messi.png", "Imanuel Agung Praja Romuty", "192410102036@mail.unej.ac.id", "08192410102036"),
    Contact("images/ngolokante.png", "Muhammad Afif Nurruddin", "192410102039@mail.unej.ac.id", "08192410102039"),
    Contact("images/raheemsterling.png", "MUHAMMAD ALIF RACHMAN FERYANTIKO", "192410102080@mail.unej.ac.id", "08192410102080"),
  ];

  sortingAsc() {
    contacts.sort((c1, c2) {
    return c1.name.compareTo(c2.name);
  });
  }

  @override
  Widget build(BuildContext context) {
    sortingAsc();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          for(var item in contacts ) createCard(item.photo, item.name, item.noTelp, item.email)
        ],
      )
    );
  }

  Card createCard(String contactImage, String contactName, String contactNoTelp, String contactEmail) {
    return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              elevation: 5,
              child: Row(
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    margin: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image(
                        image: AssetImage(contactImage),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                  Expanded(
                    child: Container( 
                      height: 120,
                      margin: EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          createText(contactName, TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            )),
                          createText(contactNoTelp, TextStyle(
                            overflow: TextOverflow.ellipsis,
                          )),
                          createText(contactEmail, TextStyle(
                            overflow: TextOverflow.ellipsis,
                          )),
                        ],
                      )
                    ),
                  )
                ],
              ),
            );
  }

  Container createText(String myText, TextStyle myStyle) {
    return Container(
                        width: double.infinity,
                        child: Text(
                          myText,
                          style: myStyle,
                        )
                      );
  }
}

class Contact {
  final String photo;
  final String name;
  final String email;
  final String noTelp;

  Contact(this.photo, this.name, this.email, this.noTelp);
}
