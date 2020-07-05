//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Afsal's Macbook Pro on 03/07/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//


import Foundation

struct WeatherInformationDTO : Codable {
    
    var coordinates : Coordinates?
    var weatherCondition : [WeatherCondition]?
    var atmosphericInformation : AtmosphericInformation?
    var windInformation : WindInformation?
    var cloudCoverage : Clouds?
    var dayInformation : DayInformation?
    var cityID : Int?
    var cityName : String?
    let date : Double?
     let dt_txt : String?
    
    enum CodingKeys: String, CodingKey {
        
        case coordinates = "coord"
        case weatherCondition = "weather"
        case atmosphericInformation = "main"
        case windInformation = "wind"
        case cloudCoverage = "clouds"
        case dayInformation = "sys"
        case cityID = "id"
        case cityName = "name"
        case date = "dt"
        case dt_txt = "dt_txt"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        coordinates = try values.decodeIfPresent(Coordinates.self, forKey: .coordinates)
        weatherCondition = try values.decodeIfPresent([WeatherCondition].self, forKey: .weatherCondition)
        atmosphericInformation = try values.decodeIfPresent(AtmosphericInformation.self, forKey: .atmosphericInformation)
        windInformation = try values.decodeIfPresent(WindInformation.self, forKey: .windInformation)
        cloudCoverage = try values.decodeIfPresent(Clouds.self, forKey: .cloudCoverage)
        dayInformation = try values.decodeIfPresent(DayInformation.self, forKey: .dayInformation)
        cityID = try values.decodeIfPresent(Int.self, forKey: .cityID)
        cityName = try values.decodeIfPresent(String.self, forKey: .cityName)
        date = try values.decodeIfPresent(Double.self, forKey: .date)
        dt_txt = try values.decodeIfPresent(String.self, forKey: .dt_txt)
    }
    
    static func make(data: Data) -> WeatherInformationDTO? {
        return try? JSONDecoder().decode(WeatherInformationDTO.self, from: data)
    }
    
}

struct AtmosphericInformation : Codable {
    let temperatureKelvin : Double?
    let pressurePsi : Int?
    let humidity : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case temperatureKelvin = "temp"
        case pressurePsi = "pressure"
        case humidity = "humidity"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        temperatureKelvin = try values.decodeIfPresent(Double.self, forKey: .temperatureKelvin)
        pressurePsi = try values.decodeIfPresent(Int.self, forKey: .pressurePsi)
        humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
    }
    
}

struct WeatherCondition : Codable {
    let identifier : Int?
    let conditionName : String?
    let description : String?
    let icon : String?
    
    enum CodingKeys: String, CodingKey {
        
        case identifier = "id"
        case conditionName = "main"
        case description = "description"
        case icon = "icon"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        identifier = try values.decodeIfPresent(Int.self, forKey: .identifier)
        conditionName = try values.decodeIfPresent(String.self, forKey: .conditionName)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
    }
    
}

struct WindInformation : Codable {
    let windSpeed : Double?
    let degree : Int?
    
    enum CodingKeys: String, CodingKey {
        case windSpeed = "speed"
        case degree = "deg"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        windSpeed = try values.decodeIfPresent(Double.self, forKey: .windSpeed)
        degree = try values.decodeIfPresent(Int.self, forKey: .degree)
    }
    
}

struct DayInformation : Codable {
    let type : Int?
    let id : Int?
    let country : String?
    let sunrise : Double?
    let sunset : Double?
    
    enum CodingKeys: String, CodingKey {
        
        case type = "type"
        case id = "id"
        case country = "country"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(Int.self, forKey: .type)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        sunrise = try values.decodeIfPresent(Double.self, forKey: .sunrise)
        sunset = try values.decodeIfPresent(Double.self, forKey: .sunset)
    }
    
}

struct Clouds : Codable {
       let coverage : Int?
       
       enum CodingKeys: String, CodingKey {
           
           case coverage = "all"
       }
       
       init(from decoder: Decoder) throws {
           let values = try decoder.container(keyedBy: CodingKeys.self)
           coverage = try values.decodeIfPresent(Int.self, forKey: .coverage)
       }
       
   }

struct Coordinates : Codable {
    let longitude : Double?
    let latitude : Double?
    
    enum CodingKeys: String, CodingKey {
        
        case longitude = "lon"
        case latitude = "lat"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
        latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
    }
    
}
