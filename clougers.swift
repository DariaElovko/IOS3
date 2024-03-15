import Foundation

// Сортировка массива с помощью замыкания
var numbers = [2, 1, 5, 9, 3, 7, 6, 4, 8]

// Сортировка в одну сторону
let sorted_abs = numbers.sorted {$0 < $1}
print("Сортировка в порядке возрастания:", sorted_abs)

// Сортировка в обратную сторону
let sorted_desc = numbers.sorted {$0 > $1}
print("Сортировка в порядке убывания:", sorted_desc)


// Класс для Разных действий с именами
class Names{
    var list_of_names: [String] = []

    // Метод для добавления имен
    func addNames(_ names: String...){
        list_of_names += names
    }
    // Метод для сортировки имен (возрастание)
    func sortNamesAbs (){
        list_of_names.sort {$0.count < $1.count}
    }
    // Метод для сортировки имен (убывание)
    func sortNamesDesc (){
        list_of_names.sort {$1.count < $0.count}
    }
    // Метод создания словаря
    func createDictionary() -> [Int: [String]]{
        var names_Dictionary: [Int: [String]] = [:]
        
        for name in list_of_names{
            let count = name.count
            if names_Dictionary[count] == nil{
                names_Dictionary[count] = [name]
            }
            else{
                names_Dictionary[count]?.append(name)
            }
        }
        return names_Dictionary
    }
}

// Создание списка имен
var friends_names = Names()
friends_names.addNames("Геннадий","Анна", "Антон", "Галина", "Марина", "Василий", "Яна")
print("\nСписок имен друзей:", friends_names.list_of_names)
friends_names.sortNamesAbs()
print("Список имен в порядке возрастания букв:", friends_names.list_of_names)
friends_names.sortNamesDesc()
print("Список имен в порядке убывания букв:", friends_names.list_of_names)

// Создание словаря
let friends_dictionary = friends_names.createDictionary()

// Проверка заполнения словаря
for (key,value) in friends_dictionary{
    print("Ключ: \(key), Значение: \(value)")
}

// Функция, которая выводит полученный ключ и значение
func printKeyValue(dictionary: [Int:[String]], forKey key: Int){
    if let value = dictionary[key]{
        print("Ключ: \(key), Значение: \(value)")
    }
    else{
        print("Ключ: \(key) не найден в словаре!")
    }
}

// Проверка работы функции
printKeyValue(dictionary: friends_dictionary, forKey: 3)
printKeyValue(dictionary: friends_dictionary, forKey: 5)
printKeyValue(dictionary: friends_dictionary, forKey: 1)

// Функция для проверки и вывода массивов
func checkAndPrint(_ string_array: inout [String],_ number_array: inout [Int]) {
    // Проверка на пустоту строкового массива
    if string_array.isEmpty {
        print("Строковый массив пуст. Добавляем значение.")
        string_array.append("Добавили какую-то строку")
        }
    print("Строковый массив:", string_array)

    // Проверка на пустоту числового массива
    if number_array.isEmpty {
        print("Числовой массив пуст. Добавляем значение.")
        number_array.append(42)
    } else {
        print("Числовой массив:", number_array)
    }
}

// Пример использования функции
var empty_string_array: [String] = []
var non_empty_number_array: [Int] = [1, 2, 3]

checkAndPrint(&empty_string_array,&non_empty_number_array)