import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dioProvider = Provider((ref){
  Dio dio  = Dio()..interceptors.add(PrettyDioLogger());
  return dio;
});