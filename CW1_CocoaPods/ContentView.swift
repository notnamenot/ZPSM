//
//  ContentView.swift
//  CW1_CocoaPods
//
//  Created by Student on 12/10/2021.
//

import SwiftUI
import Alamofire
import SwiftyJSON
//import JSONDecoder

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            Button("Title") {
                AF.request("https://www.metaweather.com/api/location/44418/")
                    //.response {
                    //    response in debugPrint(response)
                    //}
                    .responseJSON { response in
                        //let cond = response["consolidated_weather"]
                        //print(response)
                        //print(response.request as Any)

                        //let json = try? JSON(response.result.value!)
                        
                        switch response.result
                        {
                            case .success(let result):
                                let json = JSON(result)
                                print("hurra")
                                print(json)
                                //guard let json = try? JSON(data: result) else {print("x")  }
                                /*let id = json["_id"].stringValue
                                let color = json["avatarColor"].stringValue
                                let avatarName = json["avatarName"].stringValue
                                let email = json["email"].stringValue
                                let name = json["name"].stringValue*/
                            
                                debugPrint(response.result as Any)
                                //UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: name)
                                //completion(true)

                            case .failure(let error):
                                 //completion(false)
                                 debugPrint(response.result as Any)
                        }
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

 
