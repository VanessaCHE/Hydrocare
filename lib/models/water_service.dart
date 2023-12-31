import 'package:cloud_firestore/cloud_firestore.dart';
import 'water_measurements.dart';

class WaterService {
  final CollectionReference waterCollection =
      FirebaseFirestore.instance.collection('water_measurements');

  Future<List<WaterMeasurement>> getWaterMeasurements() async {
    QuerySnapshot querySnapshot = await waterCollection.get();
    return querySnapshot.docs.map((doc) {
      return WaterMeasurement(
        id: doc.id,
        name: doc['name'],
        volume: doc['volume'].toDouble(),
      );
    }).toList();
  }
}
