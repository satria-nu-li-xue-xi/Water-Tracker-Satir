import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:intl/intl.dart';
import 'package:faker/faker.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var faker = new Faker();
  String tanggal = DateTime.now().toIso8601String();
  bool editing = true;
  TextEditingController firstNameC = TextEditingController();
  TextEditingController lastNameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController ageC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  editing = false;
                });
              },
              icon: Icon(
                IconData(0xf73b,
                    fontPackage: CupertinoIcons.iconFontPackage,
                    fontFamily: CupertinoIcons.iconFont),
                color: Colors.blue[300],
                size: 32,
              ))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://picsum.photos/200/300'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'First Name',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Field(
            editing: editing,
            cont: firstNameC,
            jenis: TextInputType.name,
            data: faker.person.firstName(),
          ),
          Text(
            'Last Name',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Field(
            editing: editing,
            cont: lastNameC,
            jenis: TextInputType.name,
            data: faker.person.lastName(),
          ),
          Text(
            'Email',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Field(
            editing: editing,
            cont: emailC,
            jenis: TextInputType.emailAddress,
            data: faker.internet.email(),
          ),
          Text(
            'Age',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Field(
            editing: editing,
            cont: ageC,
            jenis: TextInputType.number,
            data: '18',
          ),
          editing
              ? Text('Lates Update $tanggal')
              : ElevatedButton(
                  onPressed: () {
                    setState(() {
                      editing = true;
                      tanggal =
                          DateFormat.yMd().add_jm().format(DateTime.now());
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue[300],
                      fixedSize: Size(70, 30)),
                  child: Text(
                    'Update',
                  ))
        ],
      ),
    );
  }
}

class Field extends StatelessWidget {
  Field({
    super.key,
    required this.editing,
    required this.cont,
    required this.data,
    required this.jenis,
  });
  TextInputType jenis;
  String data;
  final bool editing;
  final TextEditingController cont;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: editing,
      controller: cont,
      autocorrect: false,
      keyboardType: jenis,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          hintText: data,
          fillColor: Colors.blue[200],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
    );
  }
}
