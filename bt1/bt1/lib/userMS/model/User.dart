class NguoiDungModel
{
  int? id;
  String? ten;
  String? email;
  String? SDT;
  String? avatar;
  DateTime NgaySinh;

  NguoiDungModel({
    this.id,
    this.ten,
    this.email,
    this.SDT,
    this.avatar,
    required this.NgaySinh
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ten': ten,
      'email': email,
      'SDT': SDT,
      'avatar': avatar,
      'NgaySinh': NgaySinh.toIso8601String(),
    };
  }
  factory NguoiDungModel.fromMap(Map<String, dynamic> map) {
    return NguoiDungModel(
      id: map['id'],
      ten: map['ten'],
      email: map['email'],
      SDT: map['SDT'],
      avatar: map['avatar'],
      NgaySinh: DateTime.parse(map['NgaySinh']),
    );
  }
  NguoiDungModel copyWith({
    int? id,
    String? ten,
    String? email,
    String? SDT,
    String? avatar,
    DateTime? NgaySinh,
  }) {
    return NguoiDungModel(
      id: id ?? this.id,
      ten: ten ?? this.ten,
      email: email ?? this.email,
      SDT: SDT ?? this.SDT,
      avatar: avatar ?? this.avatar,
      NgaySinh: NgaySinh ?? this.NgaySinh,
    );
  }
  @override
  String toString() {
    return 'NguoiDungModel{id: $id, ten: $ten, email: $email, SDT: $SDT, avatar: $avatar, NgaySinh: $NgaySinh}';
  }
}