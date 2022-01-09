import 'dart:convert';

import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = 'GOOGLE_API_KEY';
const MAP_QUEST_KEY = '8hH5oMaLWSvLb5j5nDzxAJad7Sly72Od';

class LocationHelper {
  static String generateLocationPreviewImage({
    double latitude,
    double longitude,
  }) {
    // return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
    return 'https://open.mapquestapi.com/staticmap/v5/map?key=$MAP_QUEST_KEY&locations=$latitude,$longitude&zoom=16&size=@2x';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    // final url = Uri.parse(
    //   'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&amp;key=$GOOGLE_API_KEY',
    // );
    final url = Uri.parse(
      'http://open.mapquestapi.com/geocoding/v1/reverse?key=$MAP_QUEST_KEY&location=$lat,$lng&includeRoadMetadata=true&includeNearestIntersection=true',
    );
    final response = await http.get(url);

    final Map<String, dynamic> location =
        json.decode(response.body)['results'][0]['locations'][0];

    final address = [
      location['postalCode'],
      location['street'],
      location['adminArea5']
    ].join(' ');

    return address;

    // For Google API
    // return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
