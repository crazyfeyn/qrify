import 'package:shared_preferences/shared_preferences.dart';

class SaveDatas {
  static List<String> savedDataList = [];

  Future<List<String>> loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    savedDataList = prefs.getStringList('qrDataList') ?? [];
    return savedDataList;
  }

  Future<void> saveData(String data) async {
    final prefs = await SharedPreferences.getInstance();
    savedDataList.add(data);
    await prefs.setStringList('qrDataList', savedDataList);
  }
}
