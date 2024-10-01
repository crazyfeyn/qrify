import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/utils/save_datas.dart';
import 'package:flutter_application/views/screens/scanned_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late Future<List<String>> _savedDataFuture;

  @override
  void initState() {
    super.initState();
    _savedDataFuture = SaveDatas().loadSavedData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(CupertinoIcons.back),
        ),
      ),
      body: FutureBuilder<List<String>>(
        future: _savedDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No QR codes saved.'));
          } else {
            final datas = snapshot.data!;
            return ListView.builder(
              itemCount: datas.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) =>
                            ScannedScreen(qrCodeData: datas[index]),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(datas[index]),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
