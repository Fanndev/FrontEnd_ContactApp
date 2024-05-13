class Contact {
  final String id;
  String Nama;
  String Alamat;
  String NoTelp;

  Contact({
    required this.id,
    required this.Nama,
    required this.Alamat,
    required this.NoTelp,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['_id'],
      Nama: json['Nama'],
      Alamat: json['Alamat'],
      NoTelp: json['NoTelp'],
    );
  }
}
