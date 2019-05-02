//
//  SMS.swift
//  ZhanHealth
//
//  Created by Yerbol on 4/25/19.
//  Copyright © 2019 Yerbol. All rights reserved.
//

import Foundation

class Sms {
  
  func send(message: String, phone: String) {
    guard let url = URL(string: "https://smsc.kz/sys/send.php") else { return }
    let parameters = ["login": "alisherktl",
                      "psw": "transavia22",
                      "phones": phone,
                      "mes": message,
                      "sender": "ZhanHealth"]
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    let postString = getPostString(params: parameters)
    request.httpBody = postString.data(using: .utf8)
    
    let session = URLSession.shared
    session.dataTask(with: request) { (data, response, error) in
      if let _ = response {
        }
      guard let data = data else { return }
      do {
        let _ = try? JSONSerialization.jsonObject(with: data, options: [])
      } catch {
          print(error)
        }
    }.resume()
  }
  
  private func getPostString(params:[String:Any]) -> String
  {
    var data = [String]()
    for(key, value) in params
    {
      data.append(key + "=\(value)")
    }
    return data.map { String($0) }.joined(separator: "&")
  }
  
}
