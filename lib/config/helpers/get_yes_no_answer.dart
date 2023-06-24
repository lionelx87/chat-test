import 'package:dio/dio.dart';
import 'package:chat_test/domain/entities/message.dart';
import 'package:chat_test/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {

  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();

    // return Message(
    //   text: yesNoModel.answer, 
    //   sender: Sender.YOU,
    //   imageUrl: yesNoModel.image
    // );

    // return Message(
    //   text: response.data['answer'], 
    //   imageUrl: response.data['image'],
    //   sender: Sender.YOU
    // );
    
    // throw UnimplementedError();
  }
}