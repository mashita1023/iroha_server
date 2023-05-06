import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../config/export.dart';
import '../usecase/export.dart';

class ImageController {
  final ImageUsecase usecase;

  ImageController(this.usecase);

  registerImage(Request request) async {
    try {
      final result = await usecase.registerImage(request.context);
      return Response.ok(jsonEncode(result));
    } catch (err) {
      logger.severe('ImageController.registerImage: ${err.toString()}');
      final json = jsonEncode({
        'error': {
          'message': 'Validation Failed',
        }
      });
      return Response.ok(json);
    }
  }
}
