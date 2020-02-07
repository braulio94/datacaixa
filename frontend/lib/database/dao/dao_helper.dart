abstract class DaoHelper {
  void createTable();
  void insert(dynamic item);
  void insertAll(List<dynamic> items);
  void update(dynamic item);
  Future<dynamic> get(int id);
  Future<List<dynamic>> getAll();
  void delete(int id);
}