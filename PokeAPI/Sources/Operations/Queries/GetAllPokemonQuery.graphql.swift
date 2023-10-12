// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetAllPokemonQuery: GraphQLQuery {
  public static let operationName: String = "GetAllPokemon"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetAllPokemon { allPokemon(limit: 10) { __typename name generation id pokedex_entries { __typename game { __typename name generation regions { __typename name } } } } }"#
    ))

  public init() {}

  public struct Data: PokeAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PokeAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("allPokemon", [AllPokemon?]?.self, arguments: ["limit": 10]),
    ] }

    public var allPokemon: [AllPokemon?]? { __data["allPokemon"] }

    /// AllPokemon
    ///
    /// Parent Type: `Pokemon`
    public struct AllPokemon: PokeAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PokeAPI.Objects.Pokemon }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String?.self),
        .field("generation", String?.self),
        .field("id", Int?.self),
        .field("pokedex_entries", [Pokedex_entry?]?.self),
      ] }

      public var name: String? { __data["name"] }
      public var generation: String? { __data["generation"] }
      public var id: Int? { __data["id"] }
      public var pokedex_entries: [Pokedex_entry?]? { __data["pokedex_entries"] }

      /// AllPokemon.Pokedex_entry
      ///
      /// Parent Type: `DexEntry`
      public struct Pokedex_entry: PokeAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PokeAPI.Objects.DexEntry }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("game", Game?.self),
        ] }

        public var game: Game? { __data["game"] }

        /// AllPokemon.Pokedex_entry.Game
        ///
        /// Parent Type: `Game`
        public struct Game: PokeAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PokeAPI.Objects.Game }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String?.self),
            .field("generation", String?.self),
            .field("regions", [Region?]?.self),
          ] }

          public var name: String? { __data["name"] }
          public var generation: String? { __data["generation"] }
          public var regions: [Region?]? { __data["regions"] }

          /// AllPokemon.Pokedex_entry.Game.Region
          ///
          /// Parent Type: `Region`
          public struct Region: PokeAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { PokeAPI.Objects.Region }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String?.self),
            ] }

            public var name: String? { __data["name"] }
          }
        }
      }
    }
  }
}
