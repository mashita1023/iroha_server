import 'package:iroha_server/controler/image_controller.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';

class Routes {
  final ImageController imageController;
  Routes(this.imageController);

  Handler get handler {
    final router = Router();
    router.get('/healthz', (Request request) {
      return Response.ok('health');
    });

    router.post('/image/register', imageController.registerImage);
    router.all('/<ignored|.*>', (Request request) {
      return Response.notFound('Page not Found');
    });
    return router;
  }
}
