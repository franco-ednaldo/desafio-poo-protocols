import UIKit

enum Sexo:String {
    case FEMALE = "F"
    case MALE = "M"
}

enum TypePessoa:String {
    case FISICA = "F"
    case JURIDICA = "J"
}

class Pessoa {
    var nome:String
    
    init(nome:String) {
        self.nome = nome
    }
    
}

class PersonFisica: Pessoa {
    let codigo:Int
    let idade:Int
    let sexo: Sexo
    
    init(codigo:Int, nome:String, idade:Int, sexo: Sexo) {
        self.codigo = codigo
        self.idade = idade
        self.sexo = sexo
        super.init(nome: nome)
    }
    
    func getSexo() -> String {
        return sexo.rawValue
    }
}

class PersonJuridica: Pessoa {
    let anoFundacao:Int
    let socios:[Pessoa]
    
    init(razaoSocial:String, anoFundacao:Int, socios: [Pessoa]) {
        self.anoFundacao = anoFundacao
        self.socios = socios
        super.init(nome: razaoSocial)
    }
}

let fotos = [
    1: "client1.png",
    2: "client2.png"
]

func buscarFotoCliente(from codigo:Int) async -> String {
    do {
        try await Task.sleep(for: .seconds(2))
    } catch {}
    
    return fotos[codigo] ?? ""
}

let p1 = PersonFisica(codigo: 1, nome: "João Batista", idade: 23, sexo: .MALE)
let p2 = PersonFisica(codigo: 2, nome: "Maria dos Santos", idade: 30, sexo: .FEMALE)
print("Código: \(p1.codigo), Nome: \(p1.nome), idade: \(p1.idade), Sexo: \(p1.getSexo())")
print("Código: \(p2.codigo), Nome: \(p2.nome), idade: \(p2.idade), Sexo: \(p2.getSexo())")
print("----------------------------------------------")


let pj = PersonJuridica(razaoSocial: "Turismo LTDA", anoFundacao: 2001, socios: [p1, p2])
print("Razao Social: \(pj.nome), Ano de fundaçao: \(pj.anoFundacao), socios: \(pj.socios.map({ person in return person.nome }))")

print("----------------------------------------------")

Task {
    let foto1 = await buscarFotoCliente(from: p1.codigo)
    let foto2 = await buscarFotoCliente(from: p2.codigo)
    print("Foto cliente 1: \(foto1)")
    print("Foto cliente 2: \(foto2)")
}
