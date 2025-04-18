import "../model/User.dart";
import "package:sqflite/sqflite.dart";
import 'package:path/path.dart';

class UserDatabaseHelper {
  static final UserDatabaseHelper instance = UserDatabaseHelper._init();
  static Database? _database;

  // Constructor private, không thể khởi tạo trực tiếp từ bên ngoài
  UserDatabaseHelper._init();

  // Getter cho database
  Future<Database> get database async {
    // Nếu _database đã tồn tại, trả về luôn
    if (_database != null) return _database!;
    // Nếu chưa tồn tại, khởi tạo database
    _database = await _initDB('app_database.db');
    return _database!;
  }

  // Phương thức khởi tạo database
  Future<Database> _initDB(String filePath) async {
    // Lấy đường dẫn tới thư mục lưu trữ database
    final dbPath = await getDatabasesPath();
    // Kết hợp đường dẫn thư mục và tên file để tạo đường dẫn đầy đủ
    final path = join(dbPath, filePath);

    // Mở database, nếu chưa tồn tại sẽ tạo mới, version là 1, khi tạo gọi hàm _createDB
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // Phương thức tạo database
  // - db: Instance của database
  // - version: Version của database
  Future _createDB(Database db, int version) async {
    await db.execute('''
        CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          email TEXT NOT NULL,
          phone TEXT NOT NULL,
          avatar TEXT,
          dateOfBirth TEXT NOT NULL
        )
      ''');

    // Tạo sẵn dữ liệu mẫu
    await _insertSampleData(db);
  }

  // Phương thức chèn dữ liệu mẫu
  Future _insertSampleData(Database db) async {
    // Danh sách dữ liệu mẫu
    final List<Map<String, dynamic>> sampleUsers = [
      {
        'name': 'Nguyễn Văn An',
        'email': 'nguyenvanan@gmail.com',
        'phone': '0901234567',
        'avatar': null,
        'dateOfBirth': DateTime(1990, 5, 15).toIso8601String(),
      },
      {
        'name': 'Trần Thị Bình',
        'email': 'tranthibinh@gmail.com',
        'phone': '0912345678',
        'avatar': null,
        'dateOfBirth': DateTime(1992, 8, 21).toIso8601String(),
      },
      {
        'name': 'Lê Văn Cường',
        'email': 'levancuong@gmail.com',
        'phone': '0923456789',
        'avatar': null,
        'dateOfBirth': DateTime(1988, 3, 10).toIso8601String(),
      },
      {
        'name': 'Phạm Thị Dung',
        'email': 'phamthidung@gmail.com',
        'phone': '0934567890',
        'avatar': null,
        'dateOfBirth': DateTime(1995, 11, 25).toIso8601String(),
      },
      {
        'name': 'Hoàng Văn Emm',
        'email': 'hoangvanemm@gmail.com',
        'phone': '0945678901',
        'avatar': null,
        'dateOfBirth': DateTime(1993, 7, 8).toIso8601String(),
      },
    ];

    // Chèn từng người dùng vào cơ sở dữ liệu
    for (final userData in sampleUsers) {
      await db.insert('users', userData);
    }
  }

  Future close() async {
    // Lấy instance database và đóng nó
    final db = await instance.database;
    db.close();
  }

  /*
  instance: Singleton pattern đảm bảo chỉ có một instance của DatabaseHelper
  database: Getter trả về instance của Database, tạo mới nếu chưa tồn tại
  _initDB: Khởi tạo database với đường dẫn cụ thể
  _createDB: Tạo các bảng khi database được tạo lần đầu
  close: Đóng kết nối database
   */

  // Thêm user mới
  // - user: Instance của User cần thêm
  Future<int> createUser(User user) async {
    // Lấy database instance
    final db = await instance.database;
    // Thêm user vào database và trả về id của user vừa thêm
    return await db.insert('users', user.toMap());
  }

  // Đọc tất cả users
  Future<List<User>> getAllUsers() async {
    // Lấy database instance
    final db = await instance.database;
    // Thực hiện truy vấn lấy tất cả data trong bảng users
    final result = await db.query('users');

    // Chuyển đổi kết quả trả về (dạng List<Map<String, dynamic>>) thành List<User>
    return result.map((map) => User.fromMap(map)).toList();
  }

  // Đọc user theo id
  // - id: id của user cần tìm
  Future<User?> getUserById(int id) async {
    // Lấy database instance
    final db = await instance.database;
    // Thực hiện truy vấn tìm user theo id
    final maps = await db.query('users', where: 'id = ?', whereArgs: [id]);

    // Nếu tìm thấy user, trả về instance của User
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    // Nếu không tìm thấy, trả về null
    return null;
  }

  // Cập nhật user
  // - user: Instance của User cần cập nhật
  Future<int> updateUser(User user) async {
    // Lấy database instance
    final db = await instance.database;
    // Cập nhật user trong database
    return await db.update(
      'users',
      user.toMap(),
      // Điều kiện để cập nhật
      where: 'id = ?',
      // Giá trị thay thế vào điều kiện where
      whereArgs: [user.id],
    );
  }

  // Xoá user
  // - id: id của user cần xoá
  Future<int> deleteUser(int id) async {
    final db = await instance.database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  // Delete - Xoá tất cả users
  Future<int> deleteAllUsers() async {
    final db = await instance.database;
    return await db.delete('users');
  }

  // Đếm số lượng users
  Future<int> countUsers() async {
    final db = await instance.database;
    final result = await db.rawQuery('SELECT COUNT(*) FROM users');
    return Sqflite.firstIntValue(result) ?? 0;
  }
}