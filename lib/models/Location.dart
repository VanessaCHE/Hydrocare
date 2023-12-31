import 'package:cloud_firestore/cloud_firestore.dart';

class LocationModel {
  String location;
  double latitude;
  double longitude;

  LocationModel({
    required this.location,
    required this.latitude,
    required this.longitude,
  });

  // Convert the LocationModel to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  // Create a LocationModel from a Firestore document snapshot
  factory LocationModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return LocationModel(
      location: data['location'] ?? '',
      latitude: data['latitude'] ?? 0.0,
      longitude: data['longitude'] ?? 0.0,
    );
  }
}
