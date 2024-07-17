// import 'package:flutter_test/flutter_test.dart';
// import 'package:dio/dio.dart';
// import 'package:recipes_app/data/repo/repository.dart';
 
// import 'package:recipes_app/data/service/meal_service.dart';
 

 
// // group: Testleri gruplamak için kullanılır.
// // setUp: Her testten önce çalıştırılır, ortak hazırlık işlemleri için kullanılır.
// // test: Her bir test senaryosu burada tanımlanır.
// // expect: Gerçek değer ile beklenen değeri karşılaştırır.
// void main() {
//   group('MealDetailsRepository', () {
//     late MealDetailsRepository repository;
//     late MealService mealService;

//     setUp(() {
//       mealService = MealService(Dio());
//       repository = MealDetailsRepository(mealService);
//     });

//     test('fetchMealDetails verilen kimliğe ilişkin yemek ayrıntılarını döndürür', () async {
 
//       final mealDetails = await repository.fetchMealDetails('52772');
//       expect(mealDetails.meals!.first.strMeal, 'Teriyaki Chicken Casserole');
//     });

//     test('fetchMealDetails, hizmet başarısız olduğunda istisna atar', () async {
//       try {
//         await repository.fetchMealDetails('invalid_id');
//       } catch (e) {
//         expect(e, isException);
//       }
//     });
//   });
// }


// // void main(){
// // group('MealDetailsRepository Test', () {
  
// // },);

// // group('SearchRepository Test', () {
  
// // },);

// // group('MealFilterRepository Test', () {
  
// // },);

// // group('AreaFilterRepository Test', () {
  
// // },);


// // group('RandomRepository Test', () {
  
// // },);


// // }

 

 