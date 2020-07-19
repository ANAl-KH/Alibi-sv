import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  var alibiset = Set();
  //遍历sharedpreference，把值存到list里
  void readalibi() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    keys.forEach((s) {
      alibiset.add(prefs.get(s));
    });
    //prefs.clear();清理数据用
    print(keys);
    print(alibiset);
  }

  @override
  void initState() {
    readalibi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //readalibi();
    print(alibiset);
    return Scaffold(
      body: RefreshIndicator(
        child: ListView.separated(
          itemCount: alibiset.length,
          itemBuilder: (context, index) {
            return Container(
              child: Text('alibi:${alibiset.toList()[index]}'),
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
