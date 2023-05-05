import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import '../middleware/export.dart';
import 'routes.dart';

class Server {
  final Routes routes;

  Server(this.routes);

  void run() async {
    final handler = _handler();
    final server = await shelf_io.serve(
      handler,
      '0.0.0.0',
      3000,
    );
    print('Server runnning on ${server.address}:${server.port}');
  }

  _handler() {
    final test = routes.handler;
    final pipeline = Pipeline()
        .addMiddleware(logRequests())
        .addMiddleware(cors())
        .addHandler(routes.handler);
    return pipeline;
  }
}
