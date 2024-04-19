class ResponseApi {
  ResponseApi({
    required bool status,
    required String message,
    List<Data>? data,
  })  : _status = status,
        _message = message,
        _data = data;

  late bool _status; // Menggunakan late karena akan diinisialisasi di konstruktor
  late String _message;
  List<Data>? _data;

  bool get status => _status;
  String get message => _message;
  List<Data>? get data => _data;

  ResponseApi.fromJson(dynamic json) {
    _status = json['status'] ?? false; // Memberikan nilai default jika tidak ada nilai dari JSON
    _message = json['message'] ?? ""; // Memberikan nilai default
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    required int id,
    required String username,
    required String nama,
    required String telp,
    required String alamat,
    required String role,
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : _id = id,
        _username = username,
        _nama = nama,
        _telp = telp,
        _alamat = alamat,
        _role = role,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  late int _id;
  late String _username;
  late String _nama;
  late String _telp;
  late String _alamat;
  late String _role;
  late DateTime _createdAt;
  late DateTime _updatedAt;

  int get id => _id;
  String get username => _username;
  String get nama => _nama;
  String get telp => _telp;
  String get alamat => _alamat;
  String get role => _role;
  DateTime get createdAt => _createdAt;
  DateTime get updatedAt => _updatedAt;

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _nama = json['nama'];
    _telp = json['telp'];
    _alamat = json['alamat'];
    _role = json['role'];
    _createdAt = DateTime.parse(json['created_at']);
    _updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['nama'] = _nama;
    map['telp'] = _telp;
    map['alamat'] = _alamat;
    map['role'] = _role;
    map['created_at'] = _createdAt.toIso8601String();
    map['updated_at'] = _updatedAt.toIso8601String();
    return map;
  }
}
