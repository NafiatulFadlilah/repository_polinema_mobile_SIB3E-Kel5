import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ServerService {
  final dio = Dio();
  
  Future<List> getAllData() async{
    await dotenv.load(fileName: ".env");
    final String? baseUrl = dotenv.env['SERVER_ADDRESS'];
    Response resp;
    final String uri = baseUrl! + 'all_data';
    print(uri);

    resp = await dio.post(uri);
    if(resp.statusCode == 200){
      return resp.data;
    }else{
      return [];
    }
  }
}