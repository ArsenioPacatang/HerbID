import 'dart:io';

import 'package:dartz/dartz.dart';

import '../exception/app_exception.dart';
import '../model/prediction.dart';

abstract interface class ImageService {
  Future<Either<AppException, Prediction>> uploadPlant(File image);
}
