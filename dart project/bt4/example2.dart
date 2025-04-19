typedef IntList = List<int>;
typedef ListMapper<X> = Map<X, List<X>>;
typedef DoubleList = List<double>;
typedef NestedListMapper<X, Y> = Map<X, Map<Y, List<Y>>>;
void main()
{
  List<int> l1 = [1, 2, 3, 4, 5];
  print(l1);
  IntList l2 = [1, 2, 3, 4, 5, 6, 7];
  print(l2);

  Map<String, int> m1 = {};
  ListMapper<String> m2 = {};


  DoubleList l3 = [1.1, 2.2, 3.3, 4.4, 5.5];
  print(l3);

  NestedListMapper<String, int> m3 = {
    'key1': {1: [1, 2, 3], 2: [4, 5, 6]},
    'key2': {3: [7, 8, 9], 4: [10, 11, 12]}
  };
  print(m3);
}