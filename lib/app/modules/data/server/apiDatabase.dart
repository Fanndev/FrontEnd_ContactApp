class Api {
  late String localhost = 'http://localhost:3000/'; //192.168.43.18
  late String hostapi = '${localhost}api/';

  //User Contact
  // late final register = '${hostapi}auth/register';
  // late final login = '${hostapi}auth/login';
  late final listContact = '${hostapi}contacts';
  late final addContact = '${hostapi}add-contact';
  late final updateContact = '${hostapi}contact/';
  late final deleteContact = '${hostapi}delete-contact/';
}
