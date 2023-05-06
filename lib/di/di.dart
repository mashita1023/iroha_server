import '../server/export.dart';
import '../controler/export.dart';
import '../usecase/export.dart';

initializeServer() async {
  final imageUsecase = ImageUsecase();

  final imageController = ImageController(imageUsecase);

  final routes = Routes(imageController);
  final server = Server(routes);

  return server;
}
