import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();
  final String _historyKey = 'time_history';

  Future<void> addHistory(String time) async {
    SharedPreferences sharedPreferences = await _sharedPreferences;
    List<String> history = await sharedPreferences.getStringList(_historyKey);
    print('StorageService/addHistory:$time');
    if (history == null) {
      history = [time];
    } else {
      history.add(time);
    }
    print('StorageService/addHistory:$history');
    await sharedPreferences.setStringList(_historyKey, history);
  }

  Future<List<String>> getAllHistory() async {
    SharedPreferences sharedPreferences = await _sharedPreferences;
    List<String> history = await sharedPreferences.getStringList(_historyKey);
    print('StorageService/getAllHistory:$history');
    return history;
  }

  Future<void> deleteHistory() async {
    SharedPreferences sharedPreferences = await _sharedPreferences;
    sharedPreferences.remove(_historyKey);
  }
}
