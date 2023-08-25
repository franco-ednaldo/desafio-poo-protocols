import UIKit

protocol Veiculo {
    var numeroDeRodas: Int { get }
    func ligarMotor()
    func desligarMotor()
}

class Carro: Veiculo {
    var numeroDeRodas: Int = 4
    
    func ligarMotor() {
        print("Motor do carro ligado")
    }
    
    func desligarMotor() {
        print("Motor do carro desligado")
    }
}

class Bicicleta: Veiculo {
    var numeroDeRodas: Int = 2
    
    func ligarMotor() {
        print("Bicicleta não possui motor")
    }
    
    func desligarMotor() {
        print("Bicicleta não possui motor")
    }
}

let meuCarro: Veiculo = Carro()
let minhaBicicleta: Veiculo = Bicicleta()

if meuCarro is Carro {
    print("O veículo é um carro")
} else if meuCarro is Bicicleta {
    print("O veículo é uma bicicleta")
}

switch minhaBicicleta {
case is Carro:
    print("A bicicleta é na verdade um carro")
case is Bicicleta:
    print("O veículo é uma bicicleta")
default:
    print("Tipo de veículo desconhecido")
}

if let carro = meuCarro as? Carro {
    carro.ligarMotor()
} else if let bicicleta = meuCarro as? Bicicleta {
    bicicleta.ligarMotor()
}

switch minhaBicicleta {
case let carro as Carro:
    carro.ligarMotor()
case let bicicleta as Bicicleta:
    bicicleta.ligarMotor()
default:
    break
}
