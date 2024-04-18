protocol CharacterUseCaseProtocol {
    func getCharactersAndNextPage(for page: Int) async throws -> ([Character], Bool)
    func getCharactersAndNextPageWhenSearching(this name: String, for page: Int) async throws -> ([Character], Bool)
}
