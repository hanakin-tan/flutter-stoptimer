import 'package:flutter/material.dart';
import 'package:plank_app/components/storage_service.dart';

class TimeHistoryList extends StatefulWidget {
  const TimeHistoryList(this.storage);
  final StorageService storage;

  @override
  TimeHistoryListState createState() => TimeHistoryListState(storage);
}

class TimeHistoryListState extends State<TimeHistoryList> {
  TimeHistoryListState(this.storage);
  StorageService storage;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: storage.getAllHistory(),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return ListView();
            case ConnectionState.active:
            case ConnectionState.waiting:
              return ListView();
            case ConnectionState.done:
              if (snapshot.hasError || snapshot.data == null)
//                return Text('${snapshot.error}');
                return ListView();
              final List<String> historyItems = snapshot.data;
              TextStyle textStyle =
                  const TextStyle(fontSize: 20.0, color: Colors.white);
              return ListView.builder(
                  itemCount: historyItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 40,
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey)),
                      ),
//                      child: Text(historyItems[index]),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Lap $index',
                                style: textStyle,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                historyItems[index],
                                style: textStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
          }
        });
  }
}
