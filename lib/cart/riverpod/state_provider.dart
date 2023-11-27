import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItems extends StateNotifier<List> {
  CartItems() : super([]);

  void additem(Map data) {
    var present;
    for (int i = 0; i < state.length; i++) {
      if (state[i]["name"] == data["name"]) {
        present = state[i];
      }
    }
    if (present != null) {
      increase_quantity(present["name"]);
    } else {
      final nc = data['price'] * data['quantity'];
      state = [
        ...state,
        {
          "name": data["name"],
          "icon": data["image"],
          "price": double.parse(data["price"].toStringAsFixed(2)),
          "cost": double.parse(nc.toStringAsFixed(2)),
          "quantity": data["quantity"],
          "addons": data['addon'] == null ? null : data['addon']
        }
      ];
    }
  }

  void increase_quantity(String name) {
    print("in state");

    final nl = state.map((e) {
      if (e["name"] == name) {
        return {
          ...e,
          "cost": e["price"] * (e["quantity"] + 1),
          "quantity": e["quantity"] + 1
        };
      }
      return e;
    });

    state = nl.toList();
    print(state);
  }

  void remove_item(String name) {
    var count = 1;
    final nl = state.map((e) {
      if (e["name"] != name) {
        return e;
      }
    }).toList();
    nl.removeWhere((element) => element == null);
    state = nl;
    // for(int i=0;i<nl.length;i++){
    //   if(nl[i]!=null){
    //     newl.add(nl[i]);
    //   }
    // }
    // state=newl;

    // var nl=[];
    // for(int i=0;i<state.length;i++){
    //   if(state[i]["id"]!=id){
    //     nl.add(state[i]);
    //   }
    // }
    // state=nl;
  }

  void decrease_quantity(String name) {
    final nl = state.map((e) {
      if (e["name"] == name) {
        return {
          ...e,
          "cost": e["price"] * (e["quantity"] - 1 < 0 ? 0 : e["quantity"] - 1),
          "quantity": e["quantity"] - 1 < 0 ? 0 : e["quantity"] - 1
        };
      }
      return e;
    });

    state = nl.toList();
    print(state);
  }
}

final CartProvider =
    StateNotifierProvider<CartItems, List>((ref) => CartItems());
