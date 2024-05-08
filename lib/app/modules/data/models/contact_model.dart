class Contact {
  final String id;
  late final String nama;
  late final String alamat;
  late final String noTelp;

  Contact({
    required this.id,
    required this.nama,
    required this.alamat,
    required this.noTelp,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['_id'],
      nama: json['Nama'],
      alamat: json['Alamat'],
      noTelp: json['NoTelp'],
    );
  }
}
