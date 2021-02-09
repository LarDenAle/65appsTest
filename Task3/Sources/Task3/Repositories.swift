import Foundation

class Repositories: Decodable, CustomStringConvertible {
    let name: String
    enum CodingKeys: String, CodingKey {
        case name
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: CodingKeys.name)
    }
    var description: String {
        return name
    }
}
