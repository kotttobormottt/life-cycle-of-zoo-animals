import UIKit

//Создаём класс Animal
class Animal {
    
    var energy: Int
    var weight: Int
    var currentAge: Int = 0
    var maxAge: Int
    var name: String
    var isTooOld: Bool {
        currentAge >= maxAge
    }
    
    // Сон животного
    func sleep() {
        if isTooOld {
            print("Сон животного. \(name): Энергия - \(energy), Вес - \(weight), Возраст - \(currentAge), Максимальный возраст - \(maxAge)")
        } else {
            energy += 5
            currentAge += 1
            print("Питомец \(name) спит \n")
        }
    }
    
    //Питание животного
    func eat() {
        if isTooOld {
            print("Питание животного. \(name): Энергия - \(energy), Вес - \(weight), Возраст - \(currentAge), Максимальный возраст - \(maxAge)")
        } else {
            energy += 3
            weight += 1
            print("Питомец \(name) ест \n")
        }
    }
    
    //Передвижение животного
    func walk() {
        if !isTooOld && (energy + -5) > 0 && (weight + -1) > 0 {
            energy += -5
            weight += -1
            print("Питомец \(name) передвигается \n")
        } else {
            print("Передвижение животного. \(name) устал. \n")
        }
    }
    
    //Случайное изменение возраста
    private func tryIncrementAge() {
        if Bool.random() && !isTooOld {
            currentAge += 1
        }
    }
    
    //Рождение питомца
    func birth() -> Animal {
        let babyAnimalEnergy = Int.random(in: 1...10)
        let babyAnimalWeight = Int.random(in: 1...5)
        print("\(name) родил питомца. Пареметры: \(babyAnimalEnergy), \(babyAnimalWeight)")
        return Animal(babyAnimalEnergy, weight: babyAnimalWeight, maxAge: maxAge, name: name)
    }
    
    func info(){
        print("\(name): Энергия - \(energy), Вес - \(weight), Возраст - \(currentAge), Максимальный возраст - \(maxAge), Слишком стар - \(isTooOld ? "Да":"Нет")\n")
    }
    
    init(_ energy:Int, weight:Int, maxAge:Int, name: String) {
        self.energy = energy
        self.weight = weight
        self.maxAge = maxAge
        self.name = name
    }
}

//Создаём класс Bird
class Bird: Animal {
    
    override func walk() {
        super.walk()
        print("\(name) летит \n")
    }
        
    override func birth() -> Animal {
        let babyBirdEnergy = Int.random(in: 1...10)
        let babyBirdWeight = Int.random(in: 1...5)
        print("\(name) родил питомца - птичку. Энергия - \(babyBirdEnergy), Вес - \(babyBirdWeight) \n")
        return Bird(babyBirdEnergy, weight: babyBirdWeight, maxAge: maxAge, name: name)
    }
}

//Создаём класс Fish
class Fish: Animal {
    
    override func walk() {
        super.walk()
        print("\(name) плывёт \n")
    }
        
    override func birth() -> Animal {
        let babyFishEnergy = Int.random(in: 1...10)
        let babyFishWeight = Int.random(in: 1...5)
        print("\(name) родил питомца - рыбку. Энергия - \(babyFishEnergy), Вес - \(babyFishWeight) \n")
        return Fish(babyFishEnergy, weight: babyFishWeight, maxAge: maxAge, name: name)
    }
}

//Создаём класс Dog
class Dog: Animal {
    
    override func walk() {
        super.walk()
        print("\(name) бежит \n")
    }
        
    override func birth() -> Animal {
        let babyDogEnergy = Int.random(in: 1...10)
        let babyDogWeight = Int.random(in: 1...5)
        print("\(name) родил питомца - собачку. Энергия - \(babyDogEnergy), Вес - \(babyDogWeight) \n")
        return Fish(babyDogEnergy, weight: babyDogWeight, maxAge: maxAge, name: name)
    }
}

//Создаём класс Зоопарк
class NatureReserve{
    
    public var animals: [Animal] = [] //Массив животных
    
    init(_ animalCount: Int, _ birdCount: Int, _ fishCount: Int, _ dogCount: Int) {
        var i: Int = 1
        
        while (i <= animalCount) {
            self.animals.append(Animal(Int.random(in: 1...15), weight: Int.random(in: 1...10), maxAge: Int.random(in: 1...5), name: "Animal №" + String(i)))
            i += 1
        }
        i = 1
        while (i <= birdCount) {
            self.animals.append(Bird(Int.random(in: 1...15), weight: Int.random(in: 1...10), maxAge: Int.random(in: 1...5), name: "Bird №" + String(i)))
            i += 1
        }
        i = 1
        while (i <= fishCount) {
            self.animals.append(Fish(Int.random(in: 1...15), weight: Int.random(in: 1...10), maxAge: Int.random(in: 1...5), name: "Fish №" + String(i)))
            i += 1
        }
        i = 1
        while (i <= dogCount) {
            self.animals.append(Dog(Int.random(in: 1...15), weight: Int.random(in: 1...10), maxAge: Int.random(in: 1...5), name: "Dog №" + String(i)))
            i += 1
        }
    }
    
    //Функция случайного действия
    func randomAction(_ numberOfItreaction: Int) {
        
        for n in 1...numberOfItreaction{
        print("Количество животных в начале итерации - \(animals.count) | Итерация \(n)")
        print("__________________________________________________________________________\n")
        
        for value in animals {
            let randomCase = Int.random(in: 1...4)
            
            switch randomCase {
            case 1: value.walk()
            case 2: value.eat()
            case 3: value.sleep()
            case 4: animals.append(value.birth())
            default:
                print("Ничего")
            }
            
            for (key, number) in animals.enumerated() {
                if animals.count > 0 && number.isTooOld {
                    print("Животное покидает зоопарк: Максимальный возраст животного - \(number.maxAge) - Текущий возраст животного \(number.currentAge)")
                    print("Количество животных - \(animals.count)\n")
                    animals.remove(at: key)
                }
                else if animals.count == 0 {
                    print("Все животные умерли\n")
                    break
                }
            }
        }
    }
}
    
func info() {
    for number in animals {
        print("Число животных в заповеднике - \(animals.count)")
        number.info()
    }
}
}
let natureReserve1 = NatureReserve(2, 5, 3, 2) // Количество разных животных на старте
natureReserve1.info()

natureReserve1.randomAction(10) // Количество итераций
print("Количество животных в заповеднике в конце \(natureReserve1.animals.count)")
