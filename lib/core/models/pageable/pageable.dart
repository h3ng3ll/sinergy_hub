

abstract class Pageable<T> {
  /// Индекс первой записи для текущей страницы
  int get startIndex;

  /// Размер страницы
  int get pageSize;

  /// Список элементов текущей страницы
  List<T> get items;

}