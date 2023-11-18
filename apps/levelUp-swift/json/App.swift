
import Foundation

let json = """
  {
    "type": "US Robotics",
    "model": "Sportster"
  }
"""

let complexJson = """
  {
    "name": "BoJack Horseman",
    "seasons": 3,
    "rate": 8.6,
    "favorite": null,
    "genres":["Animation", "Comedy", "Drama"],
    "platform": {
      "name": "Netflix",
      "ceo": "Reed Hastings"
    },
    "url": "https://en.wikepedia"
  }
"""

struct Modem: Codable {
  let type: String
  let model: String
}

let jsonData = json.data(using: .utf8)! //

let result = try! JSONDecoder().decode(Modem.self, from: jsonData)

print(result)
print(result.type)


struct Show: Decodable {
  let name: String
  let seasons: Int
  let rate: Float
  let favorite: Bool?
  let genres: [String]
  let platform: Platform
  let url: String

  struct Platform: Decodable {
    let ceo: String
    let name: String
    
  }
}

let complexJsonData =  complexJson.data(using: .utf8)!
let showResult = try! JSONDecoder().decode(Show.self, from: complexJsonData)


let theUrl = URL(string: "https://jsonplaceholder.typicode.com/posts")!;

struct Post: Decodable {
  let body: String
  let title: String
}

enum NetworkError: Error {
  case domainError
  case decodingError
}

func fetchPosts(url: URL, completion: @escaping (Result<[Post], NetworkError>) -> Void) {
 
  URLSession.shared.dataTask(with: url) { data, response, error in

    guard let data = data, error == nil else {
      if let error = error as NSError?, error.domain == NSURLErrorDomain {
        completion(.failure(.domainError))
      }
      return
    }

    do {
      let posts = try JSONDecoder().decode([Post].self, from: data)
      completion(.success(posts))
    } catch {
      completion(.failure(.decodingError))
    }


  }.resume()
}


fetchPosts(url: theUrl) { result in 
  print(result)
  switch result {
    case .success(let posts):
      print(posts)
    case .failure(let error):
      print(error.localizedDescription)
  }
}