# NewsApp-swift
this is a news app with swift 


# MovieApp Swift PROGRAMATICALLY with Core Data Save Data Online and Offline 
This is a app with Swift, Programatically, RestApi, Generics, CoreData and Allow to user Save online and Offline

## How To use This app

## Entregables 

- [x] List top Top Stories
- [x] List to News 
- [x] Pantalla de buscador donde retro-alimente al usuario cuando
   - El campo de texto del buscador está vacío.
   - Los resultados son nulos o vacíos
   - La búsqueda tiene resultados exitosos
- [x] Pantalla Detalle del anime (mínimo título, imagen, si está al aire, rating, y si desea agregar mas detalles es un Plus).
- [x] Agregue al menos una animación de transición de vistas, color o tamaño

## Extras 

- [x] Vista PROGRAMATICALLY SearchBar y Animacion del Buscador 
- [x] Trasiciones, Animacion UX/UX Aplicado a cada Vista de Un controlador a otro
- [x] Animacion de colores cambia cada vez aleatoriamente 
- [x] Testing performance, testing aplicado al llamado a la api y llamados asincronos
- [x] funciones personalizadas que permiten la reutilizacion de las vistas sin afectar el performance
- [x] Genericos 

## Next Implementation 

### Bindings to Desing Pattern MVVM Observables 

```
    
 class observable<T> {
  
  var value: T? {
    didset {
        listerner?(value)
    }
  }
  
  init(_ value: T?) {
    self.value = value 
  }
  
  private var listerner: ((T?) -> Void) {
    listerner(Value)
    
    self.listener = listener
  }
  
  }


  struct ListViewModel {
    var top : Obervable<[ViewCellModel]> = observable([])
  }

  struct ViewCellModel {
    let name : string
  }
```



## Advanced Coordinates to push ViewController into Views Desing pattern 
   ```
      protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        // this pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)

        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]

        // load our storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = ViewController.instantiate()
        navigationController.pushViewController(vc, animated: false)
    }
}

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // create the main navigation controller to be used for our app
    let navController = UINavigationController()

    // send that into our coordinator so that it can display view controllers
    coordinator = MainCoordinator(navigationController: navController)

    // tell the coordinator to take over control
    coordinator?.start()

    // create a basic UIWindow and activate it
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = navController
    window?.makeKeyAndVisible()

    return true
}

weak var coordinator: MainCoordinator?

func start() {
    let vc = ViewController.instantiate()
    vc.coordinator = self        
    navigationController.pushViewController(vc, animated: false)
}

func buySubscription() {
    let vc = BuyViewController.instantiate()
    vc.coordinator = self
    navigationController.pushViewController(vc, animated: true)
}

func createAccount() {
    let vc = CreateAccountViewController.instantiate()
    vc.coordinator = self
    navigationController.pushViewController(vc, animated: true)
}
 
   ```




## new Implementation UITableViewDiffableDataSource to create tableView

```
dataSource = UITableViewDiffableDataSource<Int, UUID>(tableView: tableView) {
    (tableView: UITableView, indexPath: IndexPath, itemIdentifier: UUID) -> UITableViewCell? in
    // configure and return cell
}
```

## Video example Light Mode

![](https://github.com/memof90/FoodPin1-Swift/blob/master/FoodPin/images/Simulator%20Screen%20Recording%20-%20iPhone%2012%20Pro%20-%202021-07-29%20at%2011.56.54.gif?raw=true)

## Image example Light Mode

<img src="https://github.com/memof90/FoodPin1-Swift/blob/master/FoodPin/images/Simulator%20Screen%20Shot%20-%20iPhone%2012%20Pro%20-%202021-07-29%20at%2011.54.38.png?raw=true" width="200" height="400">

## Image Dark Mode 

<img src="https://github.com/memof90/FoodPin1-Swift/blob/master/FoodPin/images/Simulator%20Screen%20Shot%20-%20iPhone%2012%20Pro%20-%202021-07-29%20at%2011.54.57.png?raw=true" width="200" height="400">



## Patron de Diseño 
 I CAN USE MVVM in future implement better implementation VIPER to aplication Offline 
  
## Demo App 

<table>
  <tr>
    <td>Demo One</td>
  </tr>
  <tr>
    <td><img src="https://github.com/memof90/screenProjects/blob/master/AnimateApp/AppVideo/WhatsApp%20Video%202021-10-07%20at%2010.26.42%20PM.gif?raw=true" width=270 height=480></td>
  </tr>
 </table>

- Go to the folder AnimeApp and install Pods to project 

```
pod install

```

- Now Open tmdMovie.xcworkspace. into to Xcode
- **Note:** If any problem to remove pods the project and reinstall to Pods with the comand 

```
pod install

```

- Finally Build with cmd + B in the keyboard and Run the app in the Simulator or Phone 
- **Note:** The Phone when I can use is Iphone 7 to Phone and Simulator 13 Pro ios 15

## Project 
### Api 

```
https://developer.nytimes.com

```
### ScreenShot Project
#### Home View with View searchBar and TableView to list News projects

<table>
  <tr>
    <td>HomeView</td>
     <td>View With searchBar</td>
     <td>Search Online</td>
     <td>Search Online</td>
  </tr>
  <tr>
    <td><img src="https://github.com/memof90/screenProjects/blob/master/AnimateApp/screenApp/Simulator%20Screen%20Shot%20-%20iPhone%2013%20Pro%20-%202021-10-08%20at%2014.00.52.png?raw=true" width=270 height=480></td>
    <td><img src="https://github.com/memof90/screenProjects/blob/master/AnimateApp/screenApp/Simulator%20Screen%20Shot%20-%20iPhone%2013%20Pro%20-%202021-10-08%20at%2014.00.57.png?raw=true" width=270 height=480></td>
    <td><img src="https://github.com/memof90/screenProjects/blob/master/AnimateApp/screenApp/Simulator%20Screen%20Shot%20-%20iPhone%2013%20Pro%20-%202021-10-08%20at%2014.01.18.png?raw=true" width=270 height=480></td>
     <td><img src="https://github.com/memof90/screenProjects/blob/master/AnimateApp/screenApp/Simulator%20Screen%20Shot%20-%20iPhone%2013%20Pro%20-%202021-10-08%20at%2014.01.36.png?raw=true" width=270 height=480></td>
  </tr>
 </table>

#### Views Details each section Top Storieas and Top List News

<table>
  <tr>
    <td>Detail Top Stories</td>
    <td>Detail List News</td>
     <td> Animation Colors </td>
     <td> Animation Colors </td>
  </tr>
  <tr>
    <td><img src="https://github.com/memof90/screenProjects/blob/master/AnimateApp/screenApp/Simulator%20Screen%20Shot%20-%20iPhone%2013%20Pro%20-%202021-10-08%20at%2014.01.41.png?raw=true" width=270 height=480></td>
    <td><img src="https://github.com/memof90/screenProjects/blob/master/AnimateApp/screenApp/Simulator%20Screen%20Shot%20-%20iPhone%2013%20Pro%20-%202021-10-08%20at%2014.02.05.png?raw=true" width=270 height=480 ></td>
    <td><img src="https://github.com/memof90/screenProjects/blob/master/AnimateApp/screenApp/Simulator%20Screen%20Shot%20-%20iPhone%2013%20Pro%20-%202021-10-08%20at%2014.02.16.png?raw=true" width=270 height=480></td>
    <td><img src="https://github.com/memof90/screenProjects/blob/master/AnimateApp/screenApp/Simulator%20Screen%20Shot%20-%20iPhone%2013%20Pro%20-%202021-10-08%20at%2014.02.25.png?raw=true" width=270 height=480></td>
  </tr>
 </table>
 
 ## General principal Interface 
 
 <img src="https://github.com/memof90/screenProjects/blob/master/AnimateApp/screenApp/Simulator%20Screen%20Shot%20-%20iPhone%2013%20Pro%20-%202021-10-08%20at%2014.03.08.png?raw=true" width=270 height=480>


### Information to Project 

the project only use Two Libraries External **Kingfisher** to consume image and save in cache the api and **Youtube-ios-player-helper** to consume Video to app not more the consume to the app is only with **Generics** and **URLSession** that provides APi to apple to save the Data in the Storage I can Use **CoreData** and NSManagedObject to strutured the Model To the  View I don't Use StoryBoard and SwiftUI all View is Doing with **PROGRAMATICALLY**

<img src="https://github.com/memof90/MovieApp-Swift-Offline-Online-restApi/blob/master/tmdMovie/ScreenApp/Captura%20de%20Pantalla%202021-09-16%20a%20la(s)%203.41.43%20p.%C2%A0m..png?raw=true" width="200" height="400">

## Views Strutures 

To estructurtes the Views I use **PROGRAMATICALLY**

### View The movies the Section Detail and Section Movies

<table>
  <tr>
    <td>Popular</td>
     <td>Detailn</td>
  </tr>
  <tr>
    <td><img src="https://github.com/memof90/MovieApp-Swift-Offline-Online-restApi/blob/master/tmdMovie/ScreenApp/Captura%20de%20Pantalla%202021-09-16%20a%20la(s)%203.55.40%20p.%C2%A0m..png?raw=true" width=270 height=480></td>
    <td><img src="https://github.com/memof90/MovieApp-Swift-Offline-Online-restApi/blob/master/tmdMovie/ScreenApp/Captura%20de%20Pantalla%202021-09-16%20a%20la(s)%203.55.28%20p.%C2%A0m..png?raw=true" width=270 height=480></td>
  </tr>
 </table>


## Folders To App

### Helpers

This Help me to Layout Views the App

<img src="https://github.com/memof90/MovieApp-Swift-Offline-Online-restApi/blob/master/tmdMovie/ScreenApp/Captura%20de%20Pantalla%202021-09-16%20a%20la(s)%203.45.14%20p.%C2%A0m..png?raw=true">

### Services

Help me to consume APIRest and pass data to coreData

** File **PopularservicesModel...** Contain the model to save data to api and fetch core Data to save Storage 
** File **NetworkServices** conatin the services to consume api with URLSession and decode data to Api 

<img src="https://github.com/memof90/MovieApp-Swift-Offline-Online-restApi/blob/master/tmdMovie/ScreenApp/Captura%20de%20Pantalla%202021-09-16%20a%20la(s)%203.44.31%20p.%C2%A0m..png?raw=true">

### Controllers 

Help me to managed Protocol and state the app 

- **BaseTabController:** contain the all Controller principal **Popular**, **Toprated**, **Upcomming** and **Search** 
- **BaseListController:** An abstract class that serves as the basis for objects that enable archiving and distribution of other objects.
- **DetailController:** Contain the Detail managed to each View

<img src="https://github.com/memof90/MovieApp-Swift-Offline-Online-restApi/blob/master/tmdMovie/ScreenApp/Captura%20de%20Pantalla%202021-09-16%20a%20la(s)%203.43.37%20p.%C2%A0m..png?raw=true">

### Views 

Help me to managed View the cell to each View SearhViewCell, PopularViewCell, UpcommingViewCell, TopRatedViewCell and Detail To each ViewCell

- **ViewCell:** contain the all Controller principal **Popular**, **Toprated**, **Upcomming** and **Search** 
- **DetailViewCell:** contain the all Controller principal **Popular**, **Toprated**, **Upcomming** and **Search** 

<img src="https://github.com/memof90/MovieApp-Swift-Offline-Online-restApi/blob/master/tmdMovie/ScreenApp/Captura%20de%20Pantalla%202021-09-16%20a%20la(s)%203.43.01%20p.%C2%A0m..png?raw=true">

### Model 

Help me to managed Model and Strutured the data to Decode and save to pass Controllers Searh Popular, Upcomming, TopRated and DBManager to local Database in this case CoreData

- **Model:** contain the all Model strurture principal **Popular**, **Toprated**, **Upcomming** and **Search** 
- **DBManager:** contain Managed local database  

<img src="https://github.com/memof90/MovieApp-Swift-Offline-Online-restApi/blob/master/tmdMovie/ScreenApp/Captura%20de%20Pantalla%202021-09-16%20a%20la(s)%203.42.31%20p.%C2%A0m..png?raw=true">

## Tools Help Me 

<table>
  <tr>
    <td>Postman</td>
     <td>Xcode</td>
     <td>CoreData</td>
  </tr>
  <tr>
    <td><img src="https://github.com/memof90/MovieApp-Swift-Offline-Online-restApi/blob/master/tmdMovie/ScreenApp/Captura%20de%20Pantalla%202021-09-16%20a%20la(s)%203.41.06%20p.%C2%A0m..png?raw=true"></td>
    <td><img src="https://cutt.ly/rEtzcha"></td>
    <td><img src="https://github.com/memof90/MovieApp-Swift-Offline-Online-restApi/blob/master/tmdMovie/ScreenApp/Captura%20de%20Pantalla%202021-09-16%20a%20la(s)%203.40.10%20p.%C2%A0m..png?raw=true"></td>
  </tr>
 </table>
 
 ## Testing 

<table>
  <tr>
    <td>Tesing Api status code 200</td>
     <td>Testing Performance</td>
  </tr>
  <tr>
    <td><img src="https://github.com/memof90/MovieApp-Swift-Offline-Online-restApi/blob/master/tmdMovie/ScreenApp/Captura%20de%20Pantalla%202021-09-16%20a%20la(s)%203.13.15%20p.%C2%A0m..png?raw=true"></td>
    <td><img src="https://github.com/memof90/MovieApp-Swift-Offline-Online-restApi/blob/master/tmdMovie/ScreenApp/Captura%20de%20Pantalla%202021-09-16%20a%20la(s)%203.27.21%20p.%C2%A0m..png?raw=true"></td>
  </tr>
 </table>

 ## Testing 
 
 <table>
  <tr>
     <td>Testing Api</td>
     <td>Testing</td>
  </tr>
  <tr>
    <td><img src="https://github.com/memof90/MovieApp-Swift-Offline-Online-restApi/blob/master/tmdMovie/ScreenApp/Captura%20de%20Pantalla%202021-09-16%20a%20la(s)%203.28.30%20p.%C2%A0m..png?raw=true"></td>
    <td><img src="https://github.com/memof90/MovieApp-Swift-Offline-Online-restApi/blob/master/tmdMovie/ScreenApp/Captura%20de%20Pantalla%202021-09-16%20a%20la(s)%203.31.34%20p.%C2%A0m..png?raw=true"></td>
  </tr>
 </table>
 

## NEW FREATURES UPComing 

- [ ] Implemeting Videos into App
- [ ] Create new Better model maybe to LocalDataBase
- [ ] Create Interface with Figma to create better Interface 
- [ ] Create more Animations to Views 
- [x] Animations to View and detailViews

## Example NEW Implementaion 


<img src="https://pbs.twimg.com/media/E-URuLaWEAIT8sI?format=jpg&name=medium">










