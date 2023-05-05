import '../server/export.dart';

initializeServer() async {
  final routes = Routes();
  final server = Server(routes);
  return server;
}
