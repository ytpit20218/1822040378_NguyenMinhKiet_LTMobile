import '../model/User.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// Lớp `NguoiDungDatabaseHelper` chịu trách nhiệm quản lý cơ sở dữ liệu SQLite cho thông tin người dùng.
///
/// Lớp này cung cấp các phương thức để:
/// - Khởi tạo và truy cập cơ sở dữ liệu.
/// - Tạo bảng người dùng (nguoidung).
/// - Thêm dữ liệu mẫu vào bảng người dùng.
class NguoiDungDatabaseHelper {

  static NguoiDungDatabaseHelper get instance => _instance;

  static final NguoiDungDatabaseHelper _instance = NguoiDungDatabaseHelper
      ._init();
  static Database? _database;

  /// Khởi tạo constructor private.
  NguoiDungDatabaseHelper._init();

  /// Trả về một instance của database. Nếu database chưa được khởi tạo, nó sẽ khởi tạo trước khi trả về.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase('nguoidung.db');
    return _database!;
  }

  /// Khởi tạo database với tên file được chỉ định.
  ///
  /// `filePath` là đường dẫn đến file database.
  /// Trả về một `Future<Database>` hoàn thành khi database đã được mở.
  Future<Database> _initDatabase(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  /// Tạo bảng 'nguoidung' trong database.
  ///
  /// Bảng có các cột:
  /// - id: Khóa chính, tự động tăng.
  /// - ten: Tên người dùng.
  /// - email, SDT, avatar, NgaySinh.
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE nguoidung (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        ten TEXT,
        email TEXT,
        SDT TEXT,
        avatar TEXT,
        NgaySinh TEXT
      )
    ''');
    await _insertSampleData(db);
  }

  /// Chèn dữ liệu mẫu vào bảng 'nguoidung'.
  ///
  /// `sampleData` là danh sách các bản ghi người dùng mẫu.
  /// Duyệt qua `sampleData` và chèn từng bản ghi vào database.
  Future<void> _insertSampleData(Database db) async {
    final List<Map<String, dynamic>> sampleData = [
      {
        'ten': 'Nguyen Van A',
        'email': 'nguyenvana@kietmail.com',
        'SDT': '097654321',
        'avatar': 'https://example.com/avatar1.png',
        'NgaySinh': DateTime(1990, 1, 19).toIso8601String(),
      },
      {
        'ten': 'Tran Thi B',
        'email': 'tranthib@kietmail.com',
        'SDT': '098765432',
        'avatar': 'https://example.com/avatar2.png',
        'NgaySinh': DateTime(1995, 2, 20).toIso8601String(),
      },
      {
        'ten': 'Le Van C',
        'email': 'levanc@kietmail.com',
        'SDT': '091234567',
        'avatar': 'https://example.com/avatar3.png',
        'NgaySinh': DateTime(1988, 3, 15).toIso8601String(),
      },
      {
        'ten': 'Pham Thi D',
        'email': 'phamthid@kietmail.com',
        'SDT': '092345678',
        'avatar': 'https://example.com/avatar4.png',
        'NgaySinh': DateTime(1992, 4, 22).toIso8601String(),
      },
      {
        'ten': 'Hoang Van E',
        'email': 'hoangvane@kietmail.com',
        'SDT': '093456789',
        'avatar': 'https://example.com/avatar5.png',
        'NgaySinh': DateTime(1997, 5, 10).toIso8601String(),
      },
    ];

    for (final data in sampleData) {
      await db.insert('nguoidung', data);
    }
  }

  /// Đóng kết nối đến database.
  Future close() async {
    final db = await instance.database;
    db.close();
  }

  /// Tạo mới một người dùng trong database.
  ///
  /// `nguoidung` là đối tượng `NguoiDungModel` chứa thông tin người dùng cần thêm.
  /// Trả về `id` của người dùng vừa được thêm, hoặc một giá trị âm nếu thất bại.
  Future<int> TaoNguoiDung(NguoiDungModel nguoidung) async {
    /// Lấy database instance.
    ///
    final db = await instance.database;
    final id = await db.insert('nguoidung', nguoidung.toMap());
    return id;
  }

  Future<NguoiDungModel?> getNguoiDungById(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      'nguoidung',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      Map<String, dynamic> map = maps.first;
      return NguoiDungModel.fromMap({
        'id': map['id'],
        'ten': map['ten'],
        'email': map['email'],
        'SDT': map['SDT'],
        'avatar': map['avatar'], 'NgaySinh': map['NgaySinh']});
    } else {
      return null;
    }
  }

  /// Cập nhật thông tin người dùng trong database.
  ///
  /// `nguoidung` là đối tượng `NguoiDungModel` với thông tin đã được cập nhật.
  /// Trả về số lượng hàng bị ảnh hưởng bởi thao tác cập nhật, thường là 1 nếu thành công.
  ///
  Future<int> updateNguoiDung(NguoiDungModel nguoidung) async {
    final db = await instance.database;
    return await db.update(
      'nguoidung',
      nguoidung.toMap(),
      where: 'id = ?',
      whereArgs: [nguoidung.id],
    );
  }

  /// Xóa một người dùng khỏi database theo `id`.
  ///
  /// Trả về số lượng hàng bị xóa, thường là 1 nếu thành công.
  Future<int> deleteNguoiDung(int id) async {
    final db = await instance.database;
    return await db.delete('nguoidung', where: 'id = ?', whereArgs: [id]);
  }

  /// Xóa tất cả người dùng khỏi database.
  ///
  /// Trả về số lượng hàng bị xóa.
  Future<int> deleteAllNguoiDung() async {
    final db = await instance.database;
    return await db.delete('nguoidung');
  }

  /// Lấy danh sách tất cả người dùng từ database.
  ///
  /// Trả về một `List<NguoiDungModel>` chứa tất cả người dùng.
  Future<List<NguoiDungModel>> getAllUsers() async {
    final db = await instance.database;
    final result = await db.query('nguoidung');
    return result.map((map) => NguoiDungModel.fromMap(map)).toList();
  }

  /// Đếm số lượng người dùng trong database.
  ///
  /// Trả về số lượng người dùng dưới dạng `int`.
  Future<int> countNguoiDung() async {
    final db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM nguoidung')) ?? 0;
  }
}