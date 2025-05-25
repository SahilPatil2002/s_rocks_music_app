import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:s_rocks_music_app/models/service.dart';

class ServiceController extends GetxController {
  var services = <Service>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchServices();
  }

  void fetchServices() async {
    final snapshot = await FirebaseFirestore.instance.collection('services').get();
    services.value = snapshot.docs.map((doc) => Service.fromMap(doc.data())).toList();
  }
}
