import 'package:flutter/material.dart';
import 'package:flutter_application/utils/save_datas.dart';
import 'package:flutter_application/views/screens/scanned_screen.dart';
import 'package:flutter_application/views/widgets/bottom_padding.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class CameraScanScreen extends StatefulWidget {
  const CameraScanScreen({super.key});

  @override
  State<CameraScanScreen> createState() => _CameraScanScreenState();
}

class _CameraScanScreenState extends State<CameraScanScreen> {
  final saveDatas = SaveDatas();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? qrCodeResult;
  bool isNavigating = false;

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null && !isNavigating) {
        setState(() {
          qrCodeResult = scanData.code;
        });
        _navigateToScannedScreen();
      }
    });
  }

  Future<void> _navigateToScannedScreen() async {
    isNavigating = true;
    await controller?.pauseCamera();
    await saveDatas.saveData(qrCodeResult!);
    await Navigator.push(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(
        builder: (context) => ScannedScreen(qrCodeData: qrCodeResult!),
      ),
    );
    isNavigating = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Scan'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          const BottomPadding()
        ],
      ),
    );
  }
}
