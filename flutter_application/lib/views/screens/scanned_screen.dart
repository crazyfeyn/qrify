import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/views/widgets/bottom_padding.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class ScannedScreen extends StatelessWidget {
  final String qrCodeData;

  const ScannedScreen({super.key, required this.qrCodeData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanned QR Code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: qrCodeData));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Data copied to clipboard!'),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF333333),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: [
                      const Text(
                        'Data',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        qrCodeData.length <= 34
                            ? qrCodeData
                            : "${qrCodeData.substring(0, 34)}...",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (qrCodeData.isNotEmpty) ...[
              QrImageView(
                data: qrCodeData,
                version: QrVersions.auto,
                size: 200,
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 20),
              if (qrCodeData.contains('http'))
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        launchUrl(Uri.parse(qrCodeData),
                            mode: LaunchMode.externalApplication);
                      },
                      child: Container(
                        width: 140,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xFFFDB623),
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: Colors.white)),
                        child: const Text(
                          'Go via link',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              const BottomPadding(
                isScanneble: true,
              )
            ] else ...[
              const Text(
                'No data found',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
