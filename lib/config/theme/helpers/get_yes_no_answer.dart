import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final respose = await _dio.get('https://yesno.wtf/api');
    respose.data['answer'];

    return Message(
      text: respose.data['answer'] == 'yes' ? 'Si' : 'No',
      fromWho: FromWho.his,
      imgUrl: respose.data['image'],
    );
  }
}
