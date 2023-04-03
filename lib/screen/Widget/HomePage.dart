import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoody/models/catogeries_model.dart';
import 'package:zoody/models/food_categories_modle.dart';
import 'package:zoody/models/food_modle.dart';
import 'package:zoody/provider/my_provider.dart';
import 'package:zoody/screen/Widget/bottom_container.dart';
import 'package:zoody/screen/Widget/detail_page.dart';
import 'package:zoody/screen/categories.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<catogeriesModle> burgerList = [];
  List<catogeriesModle> friesList = [];
  List<catogeriesModle> pizzaList = [];
  List<catogeriesModle> drinkList = [];
  List<FoodCategoriesModle> burgerCategoriesList = [];
  List<FoodCategoriesModle> friesCategoriesList = [];
  List<FoodCategoriesModle> pizzaCategoriesList = [];
  List<FoodCategoriesModle> drinkCategoriesList = [];

  List<FoodModle> singleFoodList = [];

  Widget categoriesContainer(
      {required Function onTap, required String name, required String image}) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap(),
          child: Container(
            margin: EdgeInsets.only(left: 20),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(image)),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 20, color: Colors.white),
        )
      ],
    );
  }

  Widget drawer({required String name, required IconData iconData}) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Colors.white,
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget burger() {
    return Row(
      children: burgerList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        Categories(list: burgerCategoriesList)));
              }))
          .toList(),
    );
  }

  Widget fries() {
    return Row(
      children: friesList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        Categories(list: friesCategoriesList)));
              }))
          .toList(),
    );
  }

  Widget pizza() {
    return Row(
      children: pizzaList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        Categories(list: pizzaCategoriesList)));
              }))
          .toList(),
    );
  }

  Widget drink() {
    return Row(
      children: drinkList
          .map((e) => categoriesContainer(
              image: e.image,
              name: e.name,
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        Categories(list: drinkCategoriesList)));
              }))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Myprovider provider = Provider.of<Myprovider>(context);
    provider.getBurgerCatogery();
    burgerList = provider.throwBurgerList;
    provider.getFriescategory();
    friesList = provider.throwFriesList;
    provider.getpizzacategory();
    pizzaList = provider.throwPizzaList;
    provider.getdrinkcategory();
    drinkList = provider.throwDrinkList;

    ///////////////  SIngle Food List ///////////
    provider.getFoodList();
    singleFoodList = provider.throwFoodModleList;
    provider.getBurgerCatogeriesList();
    burgerCategoriesList = provider.throwBurgercateoriesList;
    provider.getFriesCatogeriesList();
    friesCategoriesList = provider.throwFriescateoriesList;
    provider.getPizzaCatogeriesList();
    pizzaCategoriesList = provider.throwPizzacateoriesList;
    provider.getDrinkCatogeriesList();
    drinkCategoriesList = provider.throwDrinkcateoriesList;

    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Color(0xff3a3e3e),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("images/background.jpg"))),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("images/profile.jpg"),
                    ),
                    accountName: Text("data"),
                    accountEmail: Text("data")),
                drawer(name: "Profile", iconData: Icons.person),
                drawer(name: "Cart", iconData: Icons.add_shopping_cart),
                drawer(name: "Order", iconData: Icons.shop),
                Divider(
                  thickness: 3,
                  color: Colors.white,
                ),
                ListTile(
                  leading: Text(
                    "Communicate",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                drawer(name: "Change", iconData: Icons.lock),
                drawer(name: "Log Out", iconData: Icons.exit_to_app),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('images/profile.jpg'),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search Food",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  filled: true,
                  fillColor: Color(0xff3a3e3e),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                burger(),
                fries(),
                pizza(),
                drink(),
                // categoriesContainer(image: "images/pizza.jpg", name: "All"),
                // categoriesContainer(image: "images/burger.jpg", name: "Burger"),
                // categoriesContainer(image: "images/fries.jpg", name: "Fries"),
                // categoriesContainer(image: "images/pizza.jpg", name: "Pizza"),
                // categoriesContainer(image: "images/drinks.jpg", name: "Drinks"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 510,
            child: GridView.count(
                shrinkWrap: false,
                primary: false,
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: singleFoodList
                    .map(
                      (e) => BottomContainer(
                        image: e.image,
                        price: e.price,
                        name: e.name,
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                        image: e.image,
                                        name: e.name,
                                        price: e.price,
                                      )));
                        },
                      ),
                    )
                    .toList()

                // children: <Widget>[
                //   bottonContainer(
                //       images: "images/pizza.jpg", price: 12, name: "Pizza"),
                //   bottonContainer(
                //       images: "images/burger.jpg", price: 12, name: "Burger"),
                //   bottonContainer(
                //       images: "images/fries.jpg", price: 12, name: "Fries"),
                //   bottonContainer(
                //       images: "images/drinks.jpg", price: 12, name: "Drinks"),
                //   bottonContainer(
                //       images: "images/burger.jpg", price: 12, name: "Burger"),
                //   bottonContainer(
                //       images: "images/burger.jpg", price: 12, name: "Burger"),
                // ],
                ),
          ),
        ],
      ),
    );
  }
}
