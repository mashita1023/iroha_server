import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';

class Routes {
  Routes();

  Handler get handler {
    final router = Router();
    router.get('/healthz', (Request request) {
      return Response.ok('health');
    });
    router.all('/<ignored|.*>', (Request request) {
      return Response.notFound('Page not Found');
    });
    return router;
  }
}
