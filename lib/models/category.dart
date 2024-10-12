class Category {
  final String? idCategory;
  final String? strCategory;
  final String? strCategoryThumb;
  final String? strCategoryDescription;

  Category(
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  );

  factory Category.fromMap(Map<String, dynamic> json) {
    return Category(
      json['idCategory'],
      json['strCategory'],
      json['strCategoryThumb'],
      json['strCategoryDescription'],
    );
  }

  Map<String, dynamic> toMap() => {
        'idCategory': idCategory,
        'strCategory': strCategory,
        'strCategoryThumb': strCategoryThumb,
        'strCategoryDescription': strCategoryDescription,
      };
}
