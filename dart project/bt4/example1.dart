void main()
{
  var r = ('first', a:2, 5, 10.5); //record

  //dinh nghia record co 2 gia tri
  var point = (123, 456,);

  //Định nghĩa person
  var person = (name:'John', age: 25);
  
  print(point.$1); //Laasy gia tri cua phan tu thu 1
  print(person.name); //Lay gia tri cua phan tu co key la name
  print(person.age); //Lay gia tri cua phan tu co key la age
  
  
}