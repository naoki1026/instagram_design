//
//  AppDelegate.swift
//  InstagramApp
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
      
      let tabController = UITabBarController()
      
      //storyboardをコードで定義している
      let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
      let searchStoryboard = UIStoryboard(name: "Search", bundle: nil)
      let newPostStoryboard = UIStoryboard(name: "NewPost", bundle: nil)
      let profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
      let activityStoryboard = UIStoryboard(name: "Activity", bundle: nil)
    
      //インスタンス（実体化）からViewControllerを取得している
      let homeVC = homeStoryboard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
      let searchVC = searchStoryboard.instantiateViewController(withIdentifier: "Search") as! SearchViewController
      let newPostVC = newPostStoryboard.instantiateViewController(withIdentifier: "NewPost") as! NewPostViewController
      let profileVC = profileStoryboard.instantiateViewController(withIdentifier: "Profile") as! ProfileViewController
      let activityVC = activityStoryboard.instantiateViewController(withIdentifier: "Activity") as! ActivityViewController
     
      //配列の中に、タプルで複数の型の値をまとめている
      let vcData : [(UIViewController, UIImage, UIImage)] = [
      
        (homeVC, UIImage(named: "home_tab_icon")!, UIImage(named: "home_selected_tab_icon")!),
        (searchVC, UIImage(named: "search_tab_icon")!, UIImage(named: "search_selected_tab_icon")!),
        (newPostVC, UIImage(named: "post_tab_icon")!, UIImage(named: "post_tab_icon")!),
        (activityVC, UIImage(named: "activity_tab_icon")!, UIImage(named: "activity_selected_tab_icon")!),
        (profileVC, UIImage(named: "profile_tab_icon")!, UIImage(named: "profile_selected_tab_icon")!)
      
      ]
      
      //クロージャーとmapを使っている//
      //homeVCをvc、UIImageの一つ目をdefaultImage、UIImageの２つ目をselectedImageとしている
      //こんな使い方があるんだな
      let vcs = vcData.map { (vc, defaultImage, selectedImage) -> UINavigationController in
    
        let nav  = UINavigationController(rootViewController: vc)
        nav.tabBarItem.image = defaultImage
        nav.tabBarItem.selectedImage = selectedImage
        
        return nav
        
      }
      
      tabController.viewControllers = vcs
      
      //ナビゲーションバーを透明にするかしないか
      tabController.tabBar.isTranslucent = false
      
      if let items = tabController.tabBar.items {
        
        for item in items {
          
          if let image = item.image {
            
            //画像が一色に塗りつぶされないようにするため、.alwaysOriginalでオリジナル画像を描画する
            item.image = image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            
          }
          
          if let selectedImage = item.selectedImage {
            
            item.selectedImage = selectedImage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            
          }
          
          //ビューの挿入距離、四角形の中で拡大したり縮小したりする、
          item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
          
        }
      }
      
      UINavigationBar.appearance().backgroundColor = UIColor.white
      window?.rootViewController = tabController
      return true
      
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

