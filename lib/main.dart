import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:functions_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FunctionsTest(),
    );
  }
}

class FunctionsTest extends StatefulWidget {
  const FunctionsTest({Key? key}) : super(key: key);

  @override
  State<FunctionsTest> createState() => _FunctionsTestState();
}

class _FunctionsTestState extends State<FunctionsTest> {
  final TextEditingController nameC = TextEditingController();
  final TextEditingController bookC = TextEditingController();
  final TextEditingController priceC = TextEditingController();

  Future<void> addBook(String nameC, String bookC, String priceC) async {
    await FirebaseFirestore.instance.collection('buyers').add({
      "name": nameC,
      "book": bookC,
      "price": priceC,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('本の購入履歴を追加する'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameC,
              decoration: InputDecoration(
                hintText: "購入者の名前を入力",
              ),
            ),
            TextField(
              controller: bookC,
              decoration: InputDecoration(
                hintText: "本の名前を入力",
              ),
            ),
            TextField(
              controller: priceC,
              decoration: InputDecoration(
                hintText: "本の値段を入力",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  addBook(nameC.text, bookC.text, priceC.text);
                },
                child: Text('購入履歴を追加'))
          ],
        ),
      ),
    );
  }
}
