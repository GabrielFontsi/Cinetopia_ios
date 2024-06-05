//
//  SceneDelegate.swift
//  Cinetopia
//
//  Created by Gabriel Fontenele da Silva on 07/05/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: SplashViewController())
        window?.makeKeyAndVisible()
      
        //guard let windowScene = (scene as? UIWindowScene) else { return }
        //Esta linha de código verifica se a cena (scene) passada para a função é realmente uma UIWindowScene, que é necessária para criar uma janela na tela do dispositivo. Se não for, o código dentro do bloco {} é executado, e provavelmente a função retorna, abortando a inicialização.
        
        //window = UIWindow(windowScene: windowScene)
        //Aqui, uma instância de UIWindow é criada usando a UIWindowScene obtida anteriormente. Esta é a janela principal do aplicativo, que é onde todo o conteúdo do aplicativo será exibido.
        
        //window?.rootViewController = UINavigationController(rootViewController: SplashViewController())
        //Aqui, estamos configurando o controlador de visualização raiz (rootViewController) da janela. Estamos envolvendo nosso ViewController em um UINavigationController (controlador de navegação) para fornecer navegação entre diferentes telas no aplicativo. Isso é útil se o aplicativo tiver várias telas que os usuários podem percorrer.
        
        //window?.makeKeyAndVisible()
        //Finalmente, estamos tornando a janela visível e chave (key window), o que significa que ela será a janela principal com a qual o usuário interage. Sem isso, a janela pode ser criada, mas não será exibida na tela do dispositivo.
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

