import 'package:bloc/bloc.dart';

class TextQrImageCubit extends Cubit<String> {
  TextQrImageCubit() : super('');

  void changeQrImage(String data) {
    emit(data);
  }


  String currentData() => super.state;
}
