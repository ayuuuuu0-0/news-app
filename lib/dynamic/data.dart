import 'package:news_app/models/categoryModel.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];

  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = 'Business';
  categoryModel.image = 'assets/images/business.jpg';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = 'Sport';
  categoryModel.image = 'assets/images/sport.jpg';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = 'Entertainment';
  categoryModel.image = 'assets/images/entertainment.jpeg';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = 'health';
  categoryModel.image = 'assets/images/health.jpg';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = 'General';
  categoryModel.image = 'assets/images/general.jpeg';
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  return category;
}
