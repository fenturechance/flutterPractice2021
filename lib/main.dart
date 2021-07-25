import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'detail.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map resData = Map();
  @override
  void initState() {
    super.initState();
    getData();
  }

  dynamic getData() async {
    Response? res;
    try {
      res = await Dio().get('https://randomuser.me/api/?results=25');
      if (res.statusCode == 200 && res.data != null) {
        // print(res);
        return res;
      }
    } on DioError catch (e) {
      print(e);
      throw e;
    } catch (e) {
      print(e);
      throw e;
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Expanded(
                child: FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData) {
          Response res = snap.data;
          Map<String, dynamic> data = res.data;
          List<dynamic> result = data['results'];
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              String name =
                  '${result[index]['name']['first']} ${result[index]['name']['last']}';
              String email = '${result[index]['email']}';
              return InkWell(
                  //類似GestureDetector只是多了動畫
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.transparent,
                            content: Detail(person: result[index]),
                          );
                        });
                  },
                  child: ListTile(
                    title: Row(
                      children: [Expanded(child: Text(name)), Text(email)],
                    ),
                  ));
            },
            itemCount: result.length,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ))));
  }

  @override
  void dispose() {
    resData = Map();
    super.dispose();
  }
}
