class ResponseRifai {
  ResponseRifai({
    bool? status,
    String? message,
    List<Data_fai>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  ResponseRifai.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data!.add(Data_fai.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<Data_fai>? _data;

  bool? get status => _status;
  String? get message => _message;
  List<Data_fai>? get data => _data;

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

class Data_fai {
  Data_fai({
    num? id,
    String? username,
    String? nama,
    String? telp,
    String? alamat,
    String? role,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _username = username;
    _nama = nama;
    _telp = telp;
    _alamat = alamat;
    _role = role;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Data_fai.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _nama = json['nama'];
    _telp = json['telp'];
    _alamat = json['alamat'];
    _role = json['role'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _username;
  String? _nama;
  String? _telp;
  String? _alamat;
  String? _role;
  String? _createdAt;
  String? _updatedAt;

  num? get id => _id;
  String? get username => _username;
  String? get nama => _nama;
  String? get telp => _telp;
  String? get alamat => _alamat;
  String? get role => _role;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['nama'] = _nama;
    map['telp'] = _telp;
    map['alamat'] = _alamat;
    map['role'] = _role;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
