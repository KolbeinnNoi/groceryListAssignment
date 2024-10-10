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


void add () {
  print("Please type in the item you want to add to your grocery list or press '2' to go back to the menu!");
  print("To add more than 1x of each item lets say for example 5 apples, type it like this '5x apples'.");
  // Ég er með nokkur function sem eru að nota bool = true en vildi hafa eitt while (true). Engin ástæða tbh
  while(true) {
  String? input = stdin.readLineSync(); 
  if(input == '2') {
    menu2();
    break;
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
  bool removeFunction = true;
  while(removeFunction) {
  print("-------------------------------------------------------");
  print("Here is your grocery list!");
  // i stækkar frá 0 upp í hvað sem listinn er langur og hækkar um 1 fyrir hvert item og þá prentast út [1]. fyrsti hlutur  [2]. annar hlutur  etc...
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
    removeFunction = false;
  }else {
    print("Your input was invalid please try again!");
  }
    
} 
}


void menuText () {
  print("Press '1' if you would like to add an item to your grocery list");
  print("Press '2' if you would like to view your list");
  print("Press '3' to remove an item from the list!");
  print("Press '4' if you would like to exit our app");
}

// Set þetta fyrir utan functionið svo þetta virki líka í menu2()
// Gat lika notað exit(0); en vildi prufa þetta
bool mainFunction = true;
void main () {
  print("Hi welcome to our grocery list app");
  menuText();
  

  
  while(mainFunction) {
  String? inputMenu = stdin.readLineSync();
  int? menu = inputMenu != null ? int.tryParse(inputMenu) : null;
  
  // Switch statement var meira clean hérna en if og else
  
  switch (menu) {
    case 1:
      add();
      break;
    case 2:
      view();
      break;
    case 3:
      remove();
      break;
    case 4:
      print("Exiting the app..");
      mainFunction = false;
      break;
    default:
      print("Invalid input... please select '1', '2', '3' or '4'.");  
  
    }
  }
}

void menu2 () {
  print("-----------------------------------------------------------------------------");
  print("Hi again, please choose one of the options below");
  menuText();


  String? inputMenu = stdin.readLineSync();
  int? menu = inputMenu != null ? int.tryParse(inputMenu) : null;

  // Einfoldum þetta með switch statement líka
  switch (menu) {
    case 1:
      add();
      break;
    case 2:
      view();
      break;
    case 3:
      remove();
      break;
    case 4:
      print("Exiting the app..");
      mainFunction = false;
      break;
    default:
      print("Invalid input... please select '1', '2', '3' or '4'.");  
  
    }
}

void addItemToList (String item) {
  if (item.isNotEmpty) {
    // Þetta lætur fyrsta stafinn verða að stórum staf og restin af stöfunum verða litlir
    String fixedItem = item[0].toUpperCase() + item.substring(1).toLowerCase();
    groceries.add(fixedItem);
    print("-----------------------------------------------------------------------------");
    print("You have added $item to your list");
  } else {
    print("Your input was invalid, please type in a valid item for your list or press '2' to go back to the menu");
    // Láta notendur stimpla aftur inn hlut fyrir listann án þess að prenta út sama textann úr void add
    String? input = stdin.readLineSync();
    // ef þeir stimpla inn ekkert eða null value þá heldur while loopan í main functioni áfram
    if (input == null || input.isEmpty) {
      print("No input provided.");
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