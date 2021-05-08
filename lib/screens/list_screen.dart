import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'dart:convert';
import 'package:flutter_kurs/models/item_model.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  static const API_KEY = '7314616742149af29a0fa0dd6e8ead6b';
  static const URL = 'data.fixer.io';

  // ignore: deprecated_member_use
  List<ItemModel> itemList = List<ItemModel>();

  bool _isLoading = true;
  String date;
  String base;

  @override
  void initState() {
    super.initState();
    _funcGetRates();
  }

  void _funcGetRates() async {
    var client = https.Client();
    try {
      _isLoading = true;
      var param = {'access_key': API_KEY};
      var uri = Uri.https(URL, '/api/latest', param);
      var uriRes = await client.get(uri);
      var _response = json.decode(uriRes.body.toString());
      final rates = _response['rates'];
      base = _response['base'];
      var time =
          DateTime.fromMillisecondsSinceEpoch(_response['timestamp'] * 1000);
      date = time.toString();

      rates.forEach((final String key, final value) {
        ItemModel _item = ItemModel();
        double val = value.toDouble();
        _item.code = key;
        _item.value = val;
        itemList.add(_item);
      });

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      print('Error handling : $e');
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.deepOrange[300],
          primaryTextTheme:
              TextTheme(headline6: TextStyle(color: Colors.white))),
      home: Scaffold(
        appBar: AppBar(
          title: Text('App KURS'),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            // ignore: await_only_futures
            await _funcGetRates();
            return true;
          },
          child: _isLoading
              ? Center(child: Text('Waiting for connect to server...'))
              : ListView.builder(
                  itemCount: itemList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Material(
                      child: InkWell(
                        // onTap: null,
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(color: Colors.red),
                          )),
                          child: Row(children: <Widget>[
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Text(
                                itemList[index]?.code ?? '-',
                                style: TextStyle(color: Colors.red[300]),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Row(
                              children: <Widget>[
                                Text(itemList[index]?.value.toString()),
                                const SizedBox(
                                  width: 16.0,
                                )
                              ],
                            )
                          ]),
                        ),
                      ),
                    );
                  }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
