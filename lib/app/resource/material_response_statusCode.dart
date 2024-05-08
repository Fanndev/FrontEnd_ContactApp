final Map<int, String> statusCode = {
  100:
      'Continue: Server menerima permintaan dan klien sekarang dapat melanjutkan permintaan berikutnya.',
  101: 'Switching Protocols: Server beralih protokol karena permintaan klien.',
  200: 'OK: Permintaan berhasil.',
  201: 'Created: Permintaan berhasil dan sumber daya baru telah dibuat.',
  204:
      'No Content: Permintaan berhasil tetapi tidak ada konten yang dikembalikan.',
  301:
      'Moved Permanently: Sumber daya dipindahkan secara permanen ke lokasi baru.',
  302: 'Found: Sumber daya ditemukan di lokasi lain sementara.',
  400: 'Bad Request: Permintaan tidak dapat diproses karena kesalahan klien.',
  403: 'Forbidden: Akses ke sumber daya ditolak oleh server.',
  404: 'Not Found: Sumber daya yang diminta tidak ditemukan di server.',
  500:
      'Internal Server Error: Terjadi kesalahan internal yang tidak dapat ditentukan dengan tepat.',
  503:
      'Service Unavailable: Server tidak tersedia untuk menangani permintaan karena overload atau pemeliharaan.',
};
