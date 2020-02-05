import UIKit

/* Первое задание: Напишите своими словами, что такое pure function.
 Это функция, которая принимает параметры и работает с ними, не изменяя их и внешнюю среду.
 */

// Второе задание: Отсортируйте массив чисел по возрастанию используя функцию sorted

var sortedArray = [3, 6, 2, 15, 7, 5, 1].sorted()

// Третье задание: Переведите массив числе в массив строк с помощью функции map

var stringArray = [2, 4, 3, 7, 15, 247].map{ "\($0)" }
stringArray

// Четвертое задание: Переведите массив строк с именами людей в одну строку, содержащую все эти имена, с помощью функции reduce

let nameArray = ["Mikhail", "Nikita", "Alex", "Regina", "Natasha"]
let nameString = nameArray.reduce("", { "\($0) \($1)" })
nameString

// Пятое задание: Напишите функцию, которая принимает в себя функцию c типом (Void) -> Void, которая будет вызвана с задержкой в 2 секунды

func delayFunc(delay: Double = 2.0, function: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
        function()
    })
}

// Шестое задание: Напишите функцию, которая принимает в себя две функции и возвращает функцию, которая при вызове выполнит первые две функции

func sumFunc(_ firstFunc: @escaping () -> Void, _ secondFunc: @escaping (Bool) -> Void) -> ((Bool) -> Void) {
    return { bool in
        firstFunc()
        secondFunc(bool)
    }
}

// Седьмое задание: Напишите функцию, которая сортирует массив по переданному алгоритму: принимает в себя массив чисел и функцию, которая берет на вход два числа и возвращает Bool (должно ли первое число идти после второго) и возвращает массив, отсортированный по этому алгоритму

func sortArray(array: [Int], sortFunc: @escaping (Int, Int) -> Bool) -> [Int] {
    var sortingArray = array

    for i in 0..<(sortingArray.count - 1) {
        for j in i+1..<sortingArray.count {
            if sortFunc(sortingArray[i], sortingArray[j]) {
                let buffer = sortingArray[i]
                sortingArray[i] = sortingArray[j]
                sortingArray[j] = buffer
            }
        }
    }
    return sortingArray
}

let array = [2, 6, 1, 7, 8, 4, 5, 3]
let sortingArray = sortArray(array: array, sortFunc: { $0 > $1 })
sortingArray

/* Восьмое задание: Напишите своими словами что такое infix, suffix, prefix операторы
 infix - между двумя переменными
 prefix - перед переменной
 suffix - после переменной
Все эти операторы можно переопределять для работы с разными видами переменных
 */
