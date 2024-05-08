// import 'package:get/get_connect/connect.dart';
// import '../models/contact_model.dart';
// import '../server/apiDatabase.dart';

// class ContactProvider extends GetConnect {
//   @override
//   void onInit() {
//     super.onInit();
//     httpClient.defaultDecoder = (map) {
//       if (map is Map<String, dynamic>) return Contact.fromJson(map);
//       if (map is List) {
//         return map.map((item) => Contact.fromJson(item)).toList();
//       }
//     };
//     // httpClient.baseUrl = Api().hostapi;
//   }

//   Future<Contact?> getContact(String id) async {
//     final response = await get('contact/$id');
//     return response.body;
//   }

//   Future<Response> postContact(Contact contact) async {
//     final response = await post(Api().addContact, contact.toJson());
//     return response;
//   }

//   // Future<Response> deleteContact(int id) async {
//   //   final response = await delete('contact/$id');
//   //   return response;
//   // }
// }
