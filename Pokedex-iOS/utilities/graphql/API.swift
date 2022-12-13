import Apollo
import Foundation

public final class HomePageQuery: GraphQLQuery {
  // The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query homePage {
      species: pokemon_v2_pokemonspecies(order_by: {id: asc}, limit: 898) {
        __typename
        id
        name
        generation: pokemon_v2_generation {
          __typename
          id
          name
        }
        pokemon_details: pokemon_v2_pokemons(order_by: {id: asc}, limit: 1) {
          __typename
          name
          height
          weight
          types: pokemon_v2_pokemontypes {
            __typename
            type: pokemon_v2_type {
              __typename
              id
              name
            }
          }
          stats: pokemon_v2_pokemonstats {
            __typename
            effort
            base_stat
            stat_name: pokemon_v2_stat {
              __typename
              name
            }
          }
        }
        gender_rate
        hatch_counter
        egg_groups: pokemon_v2_pokemonegggroups {
          __typename
          egg_group: pokemon_v2_egggroup {
            __typename
            name
          }
        }
        pokedex_numbers: pokemon_v2_pokemondexnumbers {
          __typename
          pokedexes: pokemon_v2_pokedex {
            __typename
            pokedexes_descriptions: pokemon_v2_pokedexdescriptions(
              where: {language_id: {_eq: 9}}
            ) {
              __typename
              language_id
              description
            }
          }
          pokedex_number
        }
        evolves_from_species_id
        evolution_chain_id
        evolutions: pokemon_v2_pokemonevolutions {
          __typename
          evolution_trigger_id
          evolved_species_id
          min_level
          trigger: pokemon_v2_evolutiontrigger {
            __typename
            name
          }
        }
      }
    }
    """

  public let operationName: String = "homePage"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("pokemon_v2_pokemonspecies", alias: "species", arguments: ["order_by": ["id": "asc"], "limit": 898], type: .nonNull(.list(.nonNull(.object(Species.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(species: [Species]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "species": species.map { (value: Species) -> ResultMap in value.resultMap }])
    }

    /// An array relationship
    public var species: [Species] {
      get {
        return (resultMap["species"] as! [ResultMap]).map { (value: ResultMap) -> Species in Species(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Species) -> ResultMap in value.resultMap }, forKey: "species")
      }
    }

    public struct Species: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["pokemon_v2_pokemonspecies"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("pokemon_v2_generation", alias: "generation", type: .object(Generation.selections)),
          GraphQLField("pokemon_v2_pokemons", alias: "pokemon_details", arguments: ["order_by": ["id": "asc"], "limit": 1], type: .nonNull(.list(.nonNull(.object(PokemonDetail.selections))))),
          GraphQLField("gender_rate", type: .scalar(Int.self)),
          GraphQLField("hatch_counter", type: .scalar(Int.self)),
          GraphQLField("pokemon_v2_pokemonegggroups", alias: "egg_groups", type: .nonNull(.list(.nonNull(.object(EggGroup.selections))))),
          GraphQLField("pokemon_v2_pokemondexnumbers", alias: "pokedex_numbers", type: .nonNull(.list(.nonNull(.object(PokedexNumber.selections))))),
          GraphQLField("evolves_from_species_id", type: .scalar(Int.self)),
          GraphQLField("evolution_chain_id", type: .scalar(Int.self)),
          GraphQLField("pokemon_v2_pokemonevolutions", alias: "evolutions", type: .nonNull(.list(.nonNull(.object(Evolution.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String, generation: Generation? = nil, pokemonDetails: [PokemonDetail], genderRate: Int? = nil, hatchCounter: Int? = nil, eggGroups: [EggGroup], pokedexNumbers: [PokedexNumber], evolvesFromSpeciesId: Int? = nil, evolutionChainId: Int? = nil, evolutions: [Evolution]) {
        self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonspecies", "id": id, "name": name, "generation": generation.flatMap { (value: Generation) -> ResultMap in value.resultMap }, "pokemon_details": pokemonDetails.map { (value: PokemonDetail) -> ResultMap in value.resultMap }, "gender_rate": genderRate, "hatch_counter": hatchCounter, "egg_groups": eggGroups.map { (value: EggGroup) -> ResultMap in value.resultMap }, "pokedex_numbers": pokedexNumbers.map { (value: PokedexNumber) -> ResultMap in value.resultMap }, "evolves_from_species_id": evolvesFromSpeciesId, "evolution_chain_id": evolutionChainId, "evolutions": evolutions.map { (value: Evolution) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// An object relationship
      public var generation: Generation? {
        get {
          return (resultMap["generation"] as? ResultMap).flatMap { Generation(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "generation")
        }
      }

      /// An array relationship
      public var pokemonDetails: [PokemonDetail] {
        get {
          return (resultMap["pokemon_details"] as! [ResultMap]).map { (value: ResultMap) -> PokemonDetail in PokemonDetail(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: PokemonDetail) -> ResultMap in value.resultMap }, forKey: "pokemon_details")
        }
      }

      public var genderRate: Int? {
        get {
          return resultMap["gender_rate"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender_rate")
        }
      }

      public var hatchCounter: Int? {
        get {
          return resultMap["hatch_counter"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "hatch_counter")
        }
      }

      /// An array relationship
      public var eggGroups: [EggGroup] {
        get {
          return (resultMap["egg_groups"] as! [ResultMap]).map { (value: ResultMap) -> EggGroup in EggGroup(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: EggGroup) -> ResultMap in value.resultMap }, forKey: "egg_groups")
        }
      }

      /// An array relationship
      public var pokedexNumbers: [PokedexNumber] {
        get {
          return (resultMap["pokedex_numbers"] as! [ResultMap]).map { (value: ResultMap) -> PokedexNumber in PokedexNumber(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: PokedexNumber) -> ResultMap in value.resultMap }, forKey: "pokedex_numbers")
        }
      }

      public var evolvesFromSpeciesId: Int? {
        get {
          return resultMap["evolves_from_species_id"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "evolves_from_species_id")
        }
      }

      public var evolutionChainId: Int? {
        get {
          return resultMap["evolution_chain_id"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "evolution_chain_id")
        }
      }

      /// An array relationship
      public var evolutions: [Evolution] {
        get {
          return (resultMap["evolutions"] as! [ResultMap]).map { (value: ResultMap) -> Evolution in Evolution(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Evolution) -> ResultMap in value.resultMap }, forKey: "evolutions")
        }
      }

      public struct Generation: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_generation"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, name: String) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_generation", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }

      public struct PokemonDetail: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemon"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("height", type: .scalar(Int.self)),
            GraphQLField("weight", type: .scalar(Int.self)),
            GraphQLField("pokemon_v2_pokemontypes", alias: "types", type: .nonNull(.list(.nonNull(.object(`Type`.selections))))),
            GraphQLField("pokemon_v2_pokemonstats", alias: "stats", type: .nonNull(.list(.nonNull(.object(Stat.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, height: Int? = nil, weight: Int? = nil, types: [`Type`], stats: [Stat]) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemon", "name": name, "height": height, "weight": weight, "types": types.map { (value: `Type`) -> ResultMap in value.resultMap }, "stats": stats.map { (value: Stat) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var height: Int? {
          get {
            return resultMap["height"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "height")
          }
        }

        public var weight: Int? {
          get {
            return resultMap["weight"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "weight")
          }
        }

        /// An array relationship
        public var types: [`Type`] {
          get {
            return (resultMap["types"] as! [ResultMap]).map { (value: ResultMap) -> `Type` in `Type`(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: `Type`) -> ResultMap in value.resultMap }, forKey: "types")
          }
        }

        /// An array relationship
        public var stats: [Stat] {
          get {
            return (resultMap["stats"] as! [ResultMap]).map { (value: ResultMap) -> Stat in Stat(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Stat) -> ResultMap in value.resultMap }, forKey: "stats")
          }
        }

        public struct `Type`: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_pokemontype"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("pokemon_v2_type", alias: "type", type: .object(`Type`.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(type: `Type`? = nil) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemontype", "type": type.flatMap { (value: `Type`) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// An object relationship
          public var type: `Type`? {
            get {
              return (resultMap["type"] as? ResultMap).flatMap { `Type`(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "type")
            }
          }

          public struct `Type`: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["pokemon_v2_type"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, name: String) {
              self.init(unsafeResultMap: ["__typename": "pokemon_v2_type", "id": id, "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }
        }

        public struct Stat: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_pokemonstat"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("effort", type: .nonNull(.scalar(Int.self))),
              GraphQLField("base_stat", type: .nonNull(.scalar(Int.self))),
              GraphQLField("pokemon_v2_stat", alias: "stat_name", type: .object(StatName.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(effort: Int, baseStat: Int, statName: StatName? = nil) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonstat", "effort": effort, "base_stat": baseStat, "stat_name": statName.flatMap { (value: StatName) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var effort: Int {
            get {
              return resultMap["effort"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "effort")
            }
          }

          public var baseStat: Int {
            get {
              return resultMap["base_stat"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "base_stat")
            }
          }

          /// An object relationship
          public var statName: StatName? {
            get {
              return (resultMap["stat_name"] as? ResultMap).flatMap { StatName(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "stat_name")
            }
          }

          public struct StatName: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["pokemon_v2_stat"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String) {
              self.init(unsafeResultMap: ["__typename": "pokemon_v2_stat", "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }
        }
      }

      public struct EggGroup: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemonegggroup"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pokemon_v2_egggroup", alias: "egg_group", type: .object(EggGroup.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(eggGroup: EggGroup? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonegggroup", "egg_group": eggGroup.flatMap { (value: EggGroup) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var eggGroup: EggGroup? {
          get {
            return (resultMap["egg_group"] as? ResultMap).flatMap { EggGroup(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "egg_group")
          }
        }

        public struct EggGroup: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_egggroup"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_egggroup", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }

      public struct PokedexNumber: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemondexnumber"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("pokemon_v2_pokedex", alias: "pokedexes", type: .object(Pokedex.selections)),
            GraphQLField("pokedex_number", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pokedexes: Pokedex? = nil, pokedexNumber: Int) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemondexnumber", "pokedexes": pokedexes.flatMap { (value: Pokedex) -> ResultMap in value.resultMap }, "pokedex_number": pokedexNumber])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var pokedexes: Pokedex? {
          get {
            return (resultMap["pokedexes"] as? ResultMap).flatMap { Pokedex(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "pokedexes")
          }
        }

        public var pokedexNumber: Int {
          get {
            return resultMap["pokedex_number"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "pokedex_number")
          }
        }

        public struct Pokedex: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_pokedex"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("pokemon_v2_pokedexdescriptions", alias: "pokedexes_descriptions", arguments: ["where": ["language_id": ["_eq": 9]]], type: .nonNull(.list(.nonNull(.object(PokedexesDescription.selections))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(pokedexesDescriptions: [PokedexesDescription]) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokedex", "pokedexes_descriptions": pokedexesDescriptions.map { (value: PokedexesDescription) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// An array relationship
          public var pokedexesDescriptions: [PokedexesDescription] {
            get {
              return (resultMap["pokedexes_descriptions"] as! [ResultMap]).map { (value: ResultMap) -> PokedexesDescription in PokedexesDescription(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: PokedexesDescription) -> ResultMap in value.resultMap }, forKey: "pokedexes_descriptions")
            }
          }

          public struct PokedexesDescription: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["pokemon_v2_pokedexdescription"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("language_id", type: .scalar(Int.self)),
                GraphQLField("description", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(languageId: Int? = nil, description: String) {
              self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokedexdescription", "language_id": languageId, "description": description])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var languageId: Int? {
              get {
                return resultMap["language_id"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "language_id")
              }
            }

            public var description: String {
              get {
                return resultMap["description"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "description")
              }
            }
          }
        }
      }

      public struct Evolution: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["pokemon_v2_pokemonevolution"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("evolution_trigger_id", type: .scalar(Int.self)),
            GraphQLField("evolved_species_id", type: .scalar(Int.self)),
            GraphQLField("min_level", type: .scalar(Int.self)),
            GraphQLField("pokemon_v2_evolutiontrigger", alias: "trigger", type: .object(Trigger.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(evolutionTriggerId: Int? = nil, evolvedSpeciesId: Int? = nil, minLevel: Int? = nil, trigger: Trigger? = nil) {
          self.init(unsafeResultMap: ["__typename": "pokemon_v2_pokemonevolution", "evolution_trigger_id": evolutionTriggerId, "evolved_species_id": evolvedSpeciesId, "min_level": minLevel, "trigger": trigger.flatMap { (value: Trigger) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var evolutionTriggerId: Int? {
          get {
            return resultMap["evolution_trigger_id"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "evolution_trigger_id")
          }
        }

        public var evolvedSpeciesId: Int? {
          get {
            return resultMap["evolved_species_id"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "evolved_species_id")
          }
        }

        public var minLevel: Int? {
          get {
            return resultMap["min_level"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "min_level")
          }
        }

        /// An object relationship
        public var trigger: Trigger? {
          get {
            return (resultMap["trigger"] as? ResultMap).flatMap { Trigger(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "trigger")
          }
        }

        public struct Trigger: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["pokemon_v2_evolutiontrigger"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "pokemon_v2_evolutiontrigger", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }
    }
  }
}
