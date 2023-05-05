import 'package:shelf/shelf.dart';

Map<String, List<String>> _defaultHeaders = {
//  ACCESS_CONTROL_EXPOSE_HEADERS: '',
//  ACCESS_CONTROL_ALLOW_CREDENTIALS: true,
  'Access-Control-Allow-Methods': [
    'GET',
    'POST',
//    'PUT',
//    'PATCH',
//    'DELETE',
    'OPTIONS',
  ],
  'Access-Control-Allow-Headers': [
    'Content-Type',
    'User-Agent',
//    'Authorization',
//    'Accept-Encoding',
  ],
  'Access-Control-Allow-Origin': ['*'],
};

Middleware cors({
  Map<String, String>? headers,
}) {
  final headersAll = headers?.map((key, value) => MapEntry(key, [value]));
  return (Handler handler) {
    return (Request request) async {
      final origin = request.headers['origin'];
      if (origin == null) {
        return handler(request);
      }
      final headers0 = <String, List<String>>{
        ..._defaultHeaders,
        ...?headersAll,
      };

      if (request.method == 'OPTIONS') {
        return Response.ok(null, headers: headers0);
      }

      final response = await handler(request);
      return response.change(headers: {
        ...headers0,
        ...response.headersAll,
      });
    };
  };
}
