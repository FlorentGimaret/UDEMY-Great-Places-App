// const GOOGLE_API_KEY = 'GOOGLE_API_KEY';
const MAP_QUEST_KEY = '';

class LocationHelper {
  static String generateLocationPreviewImage({
    double latitude,
    double longitude,
  }) {
    // return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
    return 'https://www.mapquestapi.com/staticmap/v5/map?key=$MAP_QUEST_KEY&locations=$latitude,$longitude&zoom=16&size=@2x';
  }
}
