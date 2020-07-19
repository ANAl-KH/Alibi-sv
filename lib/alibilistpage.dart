import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  var alibilist = List();
  //遍历sharedpreference，把值存到list里
  void readalibi() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    keys.forEach((s) {
      alibilist.add(prefs.get(s));
    });
    //prefs.clear();清理数据用
    print(keys);
    print(alibilist);
  }

  @override
  void initState() {
    readalibi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //readalibi();
    print(alibilist);
    return Scaffold(
      body: RefreshIndicator(
        child: ListView.separated(
          itemCount: alibilist.length,
          itemBuilder: (context, index) {
            return Container(
              child: Text('${alibilist[index]}'),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: .5,
              indent: 75,
              color: Color(0xFFDDDDDD),
            );
          },
        ),
        onRefresh: () async {
          readalibi();
        },
      ),
    );
  }
}
