void main()
{
  Map<String, dynamic> user1 =
  {
    'name': 'Tung',
    'age': 20,
    'isStudent': true,
    'address': 'Tung'
  };
  user1['email'] = 'caubekidieu924@gmail.com';  //thêm entry mới  
  user1['age'] = 21;  //cập nhật value
  //user1.putIfAbsent('phone', => '03580899298');

  user1.remove('age');
  user1.removeWhere((key, value) => value == null);
  user1.clear();

  //Lấy value an toàn với giá trị mặc định


}