import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
    print(count);
  }

  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/image.jpg'),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
//_________________________
                Text(
                  isFull ? 'Lotado' : 'Pode Entrar!',
                  style: TextStyle(
                      fontSize: 30,
                      color: isEmpty
                          ? Colors.green
                          : isFull
                              ? Colors.red
                              : Colors.white),
                ),
                const SizedBox(height: 40),
//_________________________
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Text(
                    count.toString(),
                    style: TextStyle(
                        fontSize: 60,
                        color: isEmpty
                            ? Colors.green
                            : isFull
                                ? Colors.red
                                : Colors.white),
                  ),
                ),
//_________________________
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
//*************************
                    TextButton(
                        onPressed: isFull ? null : increment,
                        style: TextButton.styleFrom(
                            backgroundColor: isFull
                                ? Colors.red.withOpacity(0.5)
                                : Colors.white,
                            fixedSize: const Size(100, 100),
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          'Entrou',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )),
                    const SizedBox(width: 40),

//*************************
                    TextButton(
                        onPressed: isEmpty ? null : decrement,
                        style: TextButton.styleFrom(
                            backgroundColor: isEmpty
                                ? Colors.white.withOpacity(0.2)
                                : Colors.white,
                            fixedSize: const Size(100, 100),
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text('Saiu',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)))
                  ],
                )
              ],
            )));
  }
}
