//
//  WeatherManager.swift
//  Clima
//
//  Created by Veldanov, Anton on 10/12/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation



struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric&appid=7636ee5a3761e06a869b130e641380e9"
    
    func fetchWeather(cityName:String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    
    
    func performRequest(urlString: String){
        
        //1. create a URL
        if let url = URL(string: urlString){
            //2. Create a URL Session // .default - default config to persist data
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task (fetches data)
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            //4. Start the task
            task.resume()
        }

    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?){
        if error != nil{
            print("ERROR: ",error!)
            return
        }
        if let safeData = data{
            let dataString = String(data: safeData, encoding: .utf8)
            print("SUCCESS: ",dataString)
        }
    }
    
}
