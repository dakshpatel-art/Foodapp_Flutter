import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:zoody/models/cart_modle.dart';
import 'package:zoody/models/catogeries_model.dart';
import 'package:zoody/models/food_categories_modle.dart';
import 'package:zoody/models/food_modle.dart';

class Myprovider extends ChangeNotifier {
  List<catogeriesModle> burgerList = [];
  late catogeriesModle burgerModle;
  Future<void> getBurgerCatogery() async {
    List<catogeriesModle> newBurgerList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('RiH8f7YnFH5bf7octMH0')
        .collection('Burger')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerModle = catogeriesModle(
        image: (element.data() as dynamic)['image'],
        name: (element.data() as dynamic)['name'],
      );
      print(burgerModle.name);
      newBurgerList.add(burgerModle);
      burgerList = newBurgerList;
    });
  }

  get throwBurgerList {
    return burgerList;
  }

  ////////////2nd category/////////
  List<catogeriesModle> friesList = [];
  late catogeriesModle friesModle;
  Future<void> getFriescategory() async {
    List<catogeriesModle> newfriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('RiH8f7YnFH5bf7octMH0')
        .collection('Fries')
        .get();
    querySnapshot.docs.forEach((element) {
      friesModle = catogeriesModle(
        image: (element.data() as dynamic)['image'],
        name: (element.data() as dynamic)['name'],
      );
      print(friesModle.name);
      newfriesList.add(friesModle);
      friesList = newfriesList;
    });
  }

  get throwFriesList {
    return friesList;
  }

  ////////////3rd category/////////
  List<catogeriesModle> pizzaList = [];
  late catogeriesModle pizzaModle;
  Future<void> getpizzacategory() async {
    List<catogeriesModle> newPizzaList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('RiH8f7YnFH5bf7octMH0')
        .collection('Pizza')
        .get();
    querySnapshot.docs.forEach((element) {
      pizzaModle = catogeriesModle(
        image: (element.data() as dynamic)['image'],
        name: (element.data() as dynamic)['name'],
      );
      print(pizzaModle.name);
      newPizzaList.add(pizzaModle);
      pizzaList = newPizzaList;
    });
  }

  get throwPizzaList {
    return pizzaList;
  }

  ////////////4rd category/////////
  List<catogeriesModle> drinkList = [];
  late catogeriesModle drinkModle;
  Future<void> getdrinkcategory() async {
    List<catogeriesModle> newdrinkList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('RiH8f7YnFH5bf7octMH0')
        .collection('Drink')
        .get();
    querySnapshot.docs.forEach((element) {
      drinkModle = catogeriesModle(
        image: (element.data() as dynamic)['image'],
        name: (element.data() as dynamic)['name'],
      );
      print(drinkModle.name);
      newdrinkList.add(drinkModle);
      drinkList = newdrinkList;
    });
  }

  get throwDrinkList {
    return drinkList;
  }

  ////////////////     Single Food Item ///////

  List<FoodModle> foodModelList = [];
  late FoodModle foodModle;
  Future<void> getFoodList() async {
    List<FoodModle> newFoodModleList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Foods').get();
    querySnapshot.docs.forEach((element) {
      foodModle = FoodModle(
        image: (element.data() as dynamic)['image'],
        name: (element.data() as dynamic)['name'],
        price: (element.data() as dynamic)['price'],
      );
    });
    print(foodModle.name);
    newFoodModleList.add(foodModle);
    foodModelList = newFoodModleList;
  }

  get throwFoodModleList {
    return foodModelList;
  }

  ////////Burger Categories list//////////
  List<FoodCategoriesModle> burgerCatogeriesList = [];
  late FoodCategoriesModle burgerCategoriesModle;
  Future<void> getBurgerCatogeriesList() async {
    List<FoodCategoriesModle> newBurgerCatogeriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('FoodCategoriesFoodCategories')
        .doc('AxXSQ7hlxVPyDALvVTrB')
        .collection('Burger')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerCategoriesModle = FoodCategoriesModle(
          image: (element.data() as dynamic)['image'],
          name: (element.data() as dynamic)['name'],
          price: (element.data() as dynamic)['price']);

      newBurgerCatogeriesList.add(burgerCategoriesModle);
      burgerCatogeriesList = newBurgerCatogeriesList;
    });
    print(burgerCategoriesModle.name);
  }

  get throwBurgercateoriesList {
    return burgerCatogeriesList;
  }

  ////////Fries Categories list//////////
  List<FoodCategoriesModle> friesCatogeriesList = [];
  late FoodCategoriesModle friesCategoriesModle;
  Future<void> getFriesCatogeriesList() async {
    List<FoodCategoriesModle> newFriesCatogeriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('FoodCategories')
        .doc('AxXSQ7hlxVPyDALvVTrB')
        .collection('Fries')
        .get();
    querySnapshot.docs.forEach((element) {
      friesCategoriesModle = FoodCategoriesModle(
          image: (element.data() as dynamic)['image'],
          name: (element.data() as dynamic)['name'],
          price: (element.data() as dynamic)['price']);

      newFriesCatogeriesList.add(friesCategoriesModle);
      friesCatogeriesList = newFriesCatogeriesList;
    });
  }

  get throwFriescateoriesList {
    return friesCatogeriesList;
  }

  ////////Pizza Categories list//////////
  List<FoodCategoriesModle> pizzaCatogeriesList = [];
  late FoodCategoriesModle pizzaCategoriesModle;
  Future<void> getPizzaCatogeriesList() async {
    List<FoodCategoriesModle> newPizzaCatogeriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('FoodCategories')
        .doc('AxXSQ7hlxVPyDALvVTrB')
        .collection('Pizza')
        .get();
    querySnapshot.docs.forEach((element) {
      pizzaCategoriesModle = FoodCategoriesModle(
          image: (element.data() as dynamic)['image'],
          name: (element.data() as dynamic)['name'],
          price: (element.data() as dynamic)['price']);

      newPizzaCatogeriesList.add(pizzaCategoriesModle);
      pizzaCatogeriesList = newPizzaCatogeriesList;
    });
  }

  get throwPizzacateoriesList {
    return pizzaCatogeriesList;
  }

  ////////Drink Categories list//////////
  List<FoodCategoriesModle> drinkCatogeriesList = [];
  late FoodCategoriesModle drinkCategoriesModle;
  Future<void> getDrinkCatogeriesList() async {
    List<FoodCategoriesModle> newDrinkCatogeriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('FoodCategories')
        .doc('AxXSQ7hlxVPyDALvVTrB')
        .collection('Drink')
        .get();
    querySnapshot.docs.forEach((element) {
      drinkCategoriesModle = FoodCategoriesModle(
          image: (element.data() as dynamic)['image'],
          name: (element.data() as dynamic)['name'],
          price: (element.data() as dynamic)['price']);

      newDrinkCatogeriesList.add(drinkCategoriesModle);
      drinkCatogeriesList = newDrinkCatogeriesList;
    });
  }

  get throwDrinkcateoriesList {
    return drinkCatogeriesList;
  }

  ////////////// ADD to Cart //////////
  List<CartModle> cartList = [];
  List<CartModle> newCartList = [];
  late CartModle cartModle;
  void addTOCart({
    required String image,
    required String name,
    required int price,
    required int quantity,
  }) {
    cartModle = CartModle(
      image: image,
      name: name,
      price: price,
      quantity: quantity,
    );
    newCartList.add(cartModle);
    cartList = newCartList;
  }

  get throwCartList {
    return cartList;
  }

  int totalPrice() {
    int total = 1;
    cartList.forEach((element) {
      total += element.price * element.quantity;
    });
    return total;
  }

  late int deleteIndex;
  void getDeletendex(int index) {
    deleteIndex = index;
  }

  void delete() {
    cartList.removeAt(deleteIndex);
    notifyListeners();
  }
}
