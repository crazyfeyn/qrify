import 'package:flutter/material.dart';
import 'package:flutter_application/views/screens/camera_scan_screen.dart';
import 'package:flutter_application/views/screens/history_screen.dart';
import 'package:flutter_application/views/screens/text_qr.dart';

class BottomPadding extends StatelessWidget {
  final bool? isScanneble;
  const BottomPadding({super.key, this.isScanneble});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Container(
        padding: const EdgeInsets.all(14),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF333333),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const TextQr()));
              },
              child: Wrap(
                direction: Axis.vertical,
                alignment: WrapAlignment.center,
                children: [
                  Image.asset('assets/images/qr.png', width: 37),
                  const Text(
                    'Generate',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
            isScanneble != null
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const CameraScanScreen()));
                    },
                    child: CircleAvatar(
                      radius: 33,
                      backgroundColor: const Color(0xFFFDB623),
                      child: Image.asset(
                        'assets/images/light_qr.png',
                        height: 40,
                      ),
                    ))
                : const SizedBox(),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const HistoryScreen()));
              },
              child: Wrap(
                direction: Axis.vertical,
                alignment: WrapAlignment.center,
                children: [
                  Image.asset('assets/images/history.png', width: 37),
                  const Text(
                    'History',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
