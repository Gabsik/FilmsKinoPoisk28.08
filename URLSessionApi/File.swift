//
//  File.swift
//  URLSessionApi
//
//  Created by User on 30.07.2023.
//
//import Foundation
// MARK: - Films
struct Films: Codable {
    let docs: [Doc]
    let total, limit, page, pages: Int
}

// MARK: - Doc
struct Doc: Codable {
    let externalID: ExternalID // Внешний индефикатор??
    let rating, votes: Rating //рейтинг и голоса
    let movieLength, id: Int //длинна фильма
    let type: TypeEnum //тип фильм или мультик
    let name, description: String // название фильма и описание фильма
    let year: Int //год
    let poster: Poster //картинка
    let genres, countries: [Country] //жанр и страна
    let alternativeName, enName: String?
    let names: [Name] //чьи имена??
    let shortDescription: String  //краткое описание
    let logo: Logo
    let watchability: Watchability
    let color: String? //цвет чего????

    enum CodingKeys: String, CodingKey {
        case externalID = "externalId"
        case rating, votes, movieLength, id, type, name, description, year, poster, genres, countries, alternativeName, enName, names, shortDescription, logo, watchability, color
    }
}

// MARK: - Country
struct Country: Codable {
    let name: String
}

// MARK: - ExternalID
struct ExternalID: Codable {
    let kpHD, imdb: String
    let tmdb: Int
}

// MARK: - Logo
struct Logo: Codable {
    let url: String
}

// MARK: - Name
struct Name: Codable {
    let name: String
    let language: String?
    let type: String?
}

// MARK: - Poster
struct Poster: Codable {
    let url, previewURL: String

    enum CodingKeys: String, CodingKey {
        case url
        case previewURL = "previewUrl"
    }
}

// MARK: - Rating
struct Rating: Codable {
    let kp, imdb, filmCritics, russianFilmCritics: Double
    let ratingAwait: Int?

    enum CodingKeys: String, CodingKey {
        case kp, imdb, filmCritics, russianFilmCritics
        case ratingAwait = "await"
    }
}

enum TypeEnum: String, Codable {
    case cartoon = "cartoon"
    case movie = "movie"
}

// MARK: - Watchability
struct Watchability: Codable {
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let name: String
    let logo: Logo
    let url: String
}
