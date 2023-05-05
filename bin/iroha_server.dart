import 'package:hotreloader/hotreloader.dart';

import 'package:iroha_server/config/export.dart';
import 'package:iroha_server/di/di.dart';

main() async {
  await HotReloader.create(
      onAfterReload: (ctx) =>
          logger.info('HotReload Result: ${ctx.result}\n${ctx.reloadReports}'));

  final server = await initializeServer();

  await server.run();
}
