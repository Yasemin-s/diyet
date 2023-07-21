import 'package:diyet/api/loadData.dart';
import 'package:diyet/main.dart';
import 'package:flutter/material.dart';

//sartlara gore program gosterecek
//yas, category, boy kilo , cinsiyet ve endekse gore secim yaptir
//en alta bizimle iletisime gecin kismi olacak


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  // final int age;
  // final String gender;
  // final String category;
  // final double height;
  // final double weight;
  // final double endex;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<LoadData> _loadDataFuture;

  @override
  void initState() {
    super.initState();
    _loadDataFuture = apiCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<LoadData>(
        future: _loadDataFuture,
        builder: (context, snapshot) {
          print("snap : $snapshot");
          print("snap : $snapshot.data");
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.UzunYasam.length ?? 0,
              itemBuilder: (context, index) {
                var item = snapshot.data?.UzunYasam[index];
                return Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Gun: ${item?.gun}"),
                      Text("Sabah: ${item?.sabah}"),
                      Text("Ogle: ${item?.ogle}"),
                      Text("Araogun: ${item?.araogun}"),
                      Text("Aksam: ${item?.aksam}"),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Hata: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

