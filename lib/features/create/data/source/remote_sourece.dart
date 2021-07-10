import 'dart:convert';
import 'dart:io';

import 'package:eventer_app/core/constant/api_constant.dart';
import 'package:eventer_app/core/constant/text_constant.dart';
import 'package:eventer_app/core/errors/exception.dart';
import 'package:eventer_app/features/explore/domain/model/event.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

abstract class EventCreateRemoteSource {
  Future<Event> createEvent({Map<String, dynamic>? data, String? token});
}

class IEventCreateRemoteSource extends EventCreateRemoteSource {
  @override
  Future<Event> createEvent({Map<String, dynamic>? data, String? token}) async {
    final Map<String, dynamic> postData = {
      "title": data!['name'],
      "description": data["description"],
      "startDate": data['startDateTime'],
      "endDate": data['endDateTime'],
      "address": data['location'],
    };

    final List<String> featurePhotos = data['featurePhotos'] ?? [];
    final File coverImage = data['coverPhoto'];

    final _url = Uri.parse(BASE_URL + "/events");
    final headers = {
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "multipart/form-data"
    };
    var request = http.MultipartRequest('POST', _url);
    request.headers.addAll(headers);

    postData.forEach((key, value) => request.fields[key] = value);
    if (featurePhotos.isNotEmpty) {
      featurePhotos.forEach((image) async {
        if (image.isNotEmpty) {
          request.files.add(await http.MultipartFile.fromPath(
              'featureImages', image,
              contentType: MediaType("image", "jpg")));
        }
      });
    }
    request.files.add(await http.MultipartFile.fromPath(
        "coverImage", coverImage.path,
        contentType: MediaType("image", "jpg")));

    var result = await request.send();
    final createResponse = await http.Response.fromStream(result);
    if (createResponse.statusCode == 201) {
      final eventData = jsonDecode(createResponse.body);
      final Event event = Event.fromMap(eventData['data']['data']);
      return event;
    } else if (createResponse.statusCode >= 400 &&
        createResponse.statusCode < 500) {
      Map<String, dynamic> error =
          Map<String, dynamic>.from(jsonDecode(createResponse.body));
      throw FailException(message: error['message']);
    } else if (createResponse.statusCode >= 500) {
      final error = jsonDecode(createResponse.body);
      throw ServerException(message: error['message']);
    }
    throw ServerException(message: UNKNOWN_ERROR);
  }
}
