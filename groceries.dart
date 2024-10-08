import 'dart:io';
import 'dart:math';
// Create an empty list to store the grocery items.
// Create a method called "addItemToList" that takes an item as input and adds it to the list.
// Create a menu system that allows the user to choose between adding an item to the list, viewing the list, or ending the program.
// If the user chooses to add an item, prompt them for the item name and call the "addItemToList" method to add it to the list.
// If the user chooses to view the list, display the contents of the list.
// If the user chooses to end the program, exit the menu loop and end the program.
// Extra challenge - Remove an item from the list
// Use Methods (functions) !!! <3

List<String> groceries = [];
// String addItemToList = stdin.readLineSync();
// groceries.add(addItemToList);

void main () {
  print("Hi welcome to our grocery list app");
  print("Press '1' if you would like to add an item to your grocery list");
  print("Press '2' if you would like to view your list");
  print("Press '3' to remove an item from the list!");
  print("Press '4' if you would like to exit our app");

  while(true) {
  String? inputMenu = stdin.readLineSync();
  int? menu = inputMenu != null ? int.tryParse(inputMenu) : null;
  
  // Bæta hlutum á listann
  if(menu == 1) {
  add();

  } else if (menu == 2) {
  view();
  // --------------------------------------------------------------------------
  // --------------------------------------------------------------------------
  } else if (menu == 3) {
  remove();
  } else if (menu == 4) {
  exit(0);
  }else {
    print("Your input: $menu is invalid, pick '1', '2' or '3' based on what you want to do");
    continue;
  } }
}

// Secondary menu if users have already used the list before
void menu2 () {
  print("-----------------------------------------------------------------------------");
  print("Hi again, please choose one of the options below");
  print("Press '1' if you would like to add an item to your grocery list");
  print("Press '2' if you would like to view your list");
  print("Press '3' to remove an item from the list!");
  print("Press '4' if you would like to exit our app");

  String? inputMenu = stdin.readLineSync();
  int? menu = inputMenu != null ? int.tryParse(inputMenu) : null;

  if(menu == 1) {
  add();
  }
  else if (menu == 2) {
  view();

  } else if (menu == 3) {
  remove();
    
  } else if (menu == 4) {
  exit(0);
  } else {
  print("Your input: $menu is invalid, pick '1', '2' or '3' based on what you want to do");
  }
}
void addItemToList (String item) {
  if (item.isNotEmpty) {
    String fixedItem = item[0].toUpperCase() + item.substring(1).toLowerCase();
    groceries.add(fixedItem);
    print("-----------------------------------------------------------------------------");
    print("$item was added to your grocery list!");
  } else {
    print("Your input was invalid, please type in a valid item for your list or press '2' to go back to the menu");
    // Láta notendur stimpla aftur inn hlut fyrir listann án þess að prenta út sama textann úr void add
    String? input = stdin.readLineSync();
    // ef þeir stimpla inn ekkert eða null value þá heldur while loopan í main functioni áfram
    if (input == null || input.isEmpty) {
      print("No input provided. Please enter a valid item or press '2' to go back to the menu.");
      return;
    }
    String fixedItem2 = input[0].toUpperCase() + input.substring(1).toLowerCase();
    if (input == '2') {
      menu2();
    } else if (input != null && input != '2' && input.isNotEmpty) {
    String fixedItem2 = input[0].toUpperCase() + input.substring(1).toLowerCase();
    addItemToList(fixedItem2);
    } else {
    print("$input is not a valid input, please type in a valid item or '2' to go back to the menu");
  }
    
  }
}

void add () {
  print("Please type in the item you want to add to your grocery list or press '2' to go back to then menu!"); 
  while(true) {
  String? input = stdin.readLineSync(); 
  if(input == '2') {
    menu2();
  } else if (input != null && input != '2') {
    addItemToList(input);
  } 
  print("-----------------------------------------------------------------------------");
  print("Type in another item to add to your list or press '2' to go back to the menu");
  }
  }

void view () {
  print("Here is your grocery list!");
    for(int i = 0; i < groceries.length; i++) {
    print("${[i + 1]}. ${groceries[i]}");
    }
    print("If you would like to change your list, press '1' to add an item to the list, '2' to remove an item from the list and '3' to go back to the menu");
    String? inputMenu2 = stdin.readLineSync();
    int? InputMenu2 = inputMenu2 != null ? int.tryParse(inputMenu2) : null;
    if (InputMenu2 == 3) {
    menu2();
    } else if (InputMenu2 == 2) {
      remove();
    
    } else if (InputMenu2 == 1) {
    add();
    } 
}

void remove () {
  print("To remove an item from the list, you can either type the item exactly as it appears (with a capital letter at the start),");
  print("or, if you know the position of the item in the list, you can enter the corresponding number.");
  print("To go back to the menu, type in 'menu'");
  print("-----------------------------------------------------------------------------------------------------");
  while(true) {
  print("Here is your grocery list!");
  for(int i = 0; i < groceries.length; i++) {
  print("${[i + 1]}. ${groceries[i]}");
  }
  print("Remove the item you don't want or type in 'menu' to go back to the menu");
  String? removeInput = stdin.readLineSync();
  int? location = removeInput != null ? int.tryParse(removeInput) : null;
  // Checka hvort input sé tala eða string og ef það er tala sjá til þess að talan sé í takti við rangeið á listanum. Byrja listann á 1 svo hann sé notendavænni
  if (location != null && location > 0 && location <= groceries.length) {
    // gerum -1 svo ef notandi ætlar að velja fyrsta hlut í listanum þá fær hann actually fyrsta hlutinn við að skrifa ´1´ í staðinn fyrir '0'
  String removeLocation = groceries.removeAt(location - 1);
  print("$removeLocation has been removed from the list");
  } else if (removeInput != null && groceries.contains(removeInput)) {
    groceries.remove(removeInput);
    print("$removeInput has been removed from the list");
  } else if (removeInput == "menu") {
    menu2();
  }else {
    print("Your input was invalid please try again!");
    continue;
  }
    
} 
}








// Kóðinn hér að neðan hefði virkað en hefði verið ónauðsynlega langur. Ég vildi reyna gera þetta aðeins flóknara eitthvað en þetta hefði verði mjög ljótur kóði
// Þannig gerði þetta bara með fleirri functions í staðinn eins og ég gerði í verkefni 1



// void addItemToList (String item) {
//   if (item.isNotEmpty) {
//     String fixedItem = item[0].toUpperCase() + item.substring(1).toLowerCase();
//     groceries.add(fixedItem);
//     print("$item was added to your grocery list!");
//   } else {
//     print("Your input was invalid, please type in a valid item for your list or press '2' to go back to the menu");
//     // Messy I know, Láta notendur stimpla aftur inn hlut fyrir listann
//     String? input = stdin.readLineSync();
//     // ef þeir stimpla inn ekkert eða null value þá heldur while loopan í main functioni áfram
//     if (input == null || input.isEmpty) {
//       print("No input provided. Please enter a valid item or press '2' to go back to the menu.");
//       return;
//     }
//     String fixedItem2 = input[0].toUpperCase() + input.substring(1).toLowerCase();
//     if (input == '2') {
//       menu2();
//     } else if (input != null && input != '2' && input.isNotEmpty) {
//     String fixedItem2 = input[0].toUpperCase() + input.substring(1).toLowerCase();
//     addItemToList(fixedItem2);
//     } else {
//     print("$input is not a valid input, please type in a valid item or '2' to go back to the menu");
//   }
    
//   }
// }


// void main () {
//   print("Hi welcome to our grocery list app");
//   print("Press '1' if you would like to add an item to your grocery list");
//   print("Press '2' if you would like to view your list");
//   print("Press '3' to remove an item from the list!");
//   print("Press '4' if you would like to exit our app");

//   String? inputMenu = stdin.readLineSync();
//   int? menu = inputMenu != null ? int.tryParse(inputMenu) : null;
  
//   // Bæta hlutum á listann
//   if(menu == 1) {
//   print("Please type in the item you want to add to your grocery list or press '2' to go back to then menu!"); 
//   while(true) {
//   String? input = stdin.readLineSync(); 
//   if(input == '2') {
//     menu2();
//   } else if (input != null && input != '2') {
//     addItemToList(input);
//   } else {
//     print("Your input was invalid or empty, please type in a valid item to put on your list or press '2' to go back to the menu");
//   }
//   print("To add another item, type it in or press '2' to go back to the menu");
//   }
//   // ---------------------------------------------------------------------------
//   // ---------------------------------------------------------------------------

//   // Skoða listann og getur einnig breytt honum ef þú vilt eftir á 
//   } else if (menu == 2) {
//     print("Here is your grocery list!");
//     for(int i = 0; i < groceries.length; i++) {
//     print("${[i]}. ${groceries[i]}");
//     }
//     print("If you would like to change your list, press '1' to add an item to the list, '2' to remove and item from the list and '3' to go back to the menu");
//     String? inputMenu2 = stdin.readLineSync();
//     int? InputMenu2 = inputMenu2 != null ? int.tryParse(inputMenu2) : null;
//     if (InputMenu2 == 3) {
//     menu2();
//     } else if (InputMenu2 == 2) {
      
    
//     } else if (InputMenu2 == 1) {
//       print("Please type in the item you want to add to your grocery list or press '2' to go back to then menu!"); 
//     while(true) {
//     String? input = stdin.readLineSync(); 
//     if(input == '2') {
//     menu2();
//     } else if (input != null && input != '2') {
//     addItemToList(input);
//     } else {
//     print("Your input was invalid or empty, please type in a valid item to put on your list or press '2' to go back to the menu");
//     }
//     print("To add another item, type it in or press '2' to go back to the menu");
//     } 
//     }
//   // --------------------------------------------------------------------------
//   // --------------------------------------------------------------------------
//   } else if (menu == 3) {
//     print("To remove a word from the list you can either type the word out exactly as it is in the list");
//     print("or if you know the position of the item in your list you can type the number in");
//     print("-----------------------------------------------------------------------------------------------------");
    
//   } else {
//     print("Your input: $menu is invalid, pick '1', '2' or '3' based on what you want to do");
//   }
// }

// // Secondary menu if users have already used the list before
// void menu2 () {
//   print("-----------------------------------------------------------------------------");
//   print("Hi again, please choose one of the options below");
//   print("Press '1' if you would like to add an item to your grocery list");
//   print("Press '2' if you would like to view your list");
//   print("Press '3' to remove an item from the list!");
//   print("Press '4' if you would like to exit our app");

//   String? inputMenu = stdin.readLineSync();
//   int? menu = inputMenu != null ? int.tryParse(inputMenu) : null;

//   if(menu == 1) {
//   while(true) {
//   print("Please type in the item you want to add to your grocery list or type '2' to go back to menu!"); 
//   String? input = stdin.readLineSync().toString(); 
//   addItemToList(input);
//   if(input == '2') {
//    menu2();
//   } 
//   }
//   // ---------------------------------------------------------------------------
//   // ---------------------------------------------------------------------------

  
//   } else if (menu == 2) {
//     print("Here is your grocery list!");
//     for(int i = 0; i < groceries.length; i++) {
//     print("${[i]}. ${groceries[i]}");
//     }
//     print("If you would like to change your list, press '1' to add an item to the list, '2' to remove and item from the list and '3' to go back to the menu");
//     String? inputMenu2 = stdin.readLineSync();
//     int? InputMenu2 = inputMenu2 != null ? int.tryParse(inputMenu2) : null;
//     if (InputMenu2 == 3) {
//     menu2();
//     } else if (InputMenu2 == 1) {
//       print("Please type in the item you want to add to your grocery list or press '2' to go back to then menu!"); 
//     while(true) {
//     String? input = stdin.readLineSync(); 
//     if(input == '2') {
//     menu2();
//     } else if (input != null && input != '2') {
//     addItemToList(input);
//     } else {
//     print("Your input was invalid or empty, please type in a valid item to put on your list or press '2' to go back to the menu");
//     }
//     print("To add another item, type it in or press '2' to go back to the menu");
//     } 
//     }
  
//   } else if (menu == 3) {

    
//   } else if (menu == 4) {
//     exit(0);
//   } else {
//     print("Your input: $menu is invalid, pick '1', '2' or '3' based on what you want to do");
//   }
// }