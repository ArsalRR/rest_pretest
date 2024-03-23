import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileController extends GetxController {
  var profiles = [].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    var url = Uri.parse('https://randomuser.me/api/?results=10');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      profiles.value = data['results']; 
    } else {
      print('Gagal mengambil data');
    }
  }
}
