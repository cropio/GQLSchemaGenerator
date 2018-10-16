
extension Swift {
    class Import: Containable {
        var parent: Containing?
        let module: String
        
        init(module: String) {
            self.module = module
        }
        
        var stringRepresentation: String {
            return "import \(self.module)\n"
        }
    }
}
