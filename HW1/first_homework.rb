DEFAULT = (-4..12).to_a.shuffle

p "1) Дан целочисленный массив. Необходимо вывести вначале его элементы с четными индексами, а затем - с нечетными."
p DEFAULT
resolt = []
DEFAULT.each_with_index { |value, index| index.even? ? resolt.unshift(value) : resolt.push(value) }
p resolt
p "--------------------------------"

p "2) Дан целочисленный массив. Необходимо вывести вначале его элементы с нечетными индексами, а затем - четными."
p DEFAULT
p DEFAULT.sort
resolt = []
DEFAULT.each_with_index { |value, index| index.odd? ? resolt.unshift(value) : resolt.push(value) }
p resolt
p "--------------------------------"

p "3) Дан целочисленный массив. Вывести номер первого из тех его элементов, которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ]."
p DEFAULT
p DEFAULT.select { |value| value if (DEFAULT[0] < value) && (value < DEFAULT[-1]) }.first || []
p "--------------------------------"

p "4) Дан целочисленный массив. Вывести номер последнего из тех его элементов, которые удовлетворяют двойному неравенству: A[0] < A[i] < A[-1]. Если таких элементов нет, то вывести [ ]."
p DEFAULT
p DEFAULT.select { |value| value if (DEFAULT[0] < value) && (value < DEFAULT[-1]) }.first || []
p "--------------------------------"

p "5) Дан целочисленный массив. Преобразовать его, прибавив к четным числам первый элемент. Первый и последний элементы массива не изменять."
p DEFAULT
resolt = []
DEFAULT.each do |value|
  if (DEFAULT.rindex(value)).between?(1, DEFAULT.rindex(DEFAULT[-2]))
    value.even? ? resolt.push(value + DEFAULT[0]) : resolt.push(value)
  else
    resolt.push(value)
  end
end
p resolt
p "--------------------------------"

p "6) Дан целочисленный массив. Преобразовать его, прибавив к четным числам последний элемент. Первый и последний элементы массива не изменять."
p DEFAULT
resolt = []
DEFAULT.each do |value|
  if (DEFAULT.rindex(value)).between?(1, DEFAULT.rindex(DEFAULT[-2]))
    value.even? ? resolt.push(value + DEFAULT[-1]) : resolt.push(value)
  else
    resolt.push(value)
  end
end
p resolt
p "--------------------------------"

p "7) Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам последний элемент. Первый и последний элементы массива не изменять."
p DEFAULT
resolt = []
DEFAULT.each do |value|
  if (DEFAULT.rindex(value)).between?(1, DEFAULT.rindex(DEFAULT[-2]))
    value.odd? ? resolt.push(value + DEFAULT[-1]) : resolt.push(value)
  else
    resolt.push(value)
  end
end
p resolt
p "--------------------------------"

p "8) Дан целочисленный массив. Преобразовать его, прибавив к нечетным числам первый элемент. Первый и последний элементы массива не изменять."
p DEFAULT
resolt = []
DEFAULT.each do |value|
  if (DEFAULT.rindex(value)).between?(1, DEFAULT.rindex(DEFAULT[-2]))
    value.odd? ? resolt.push(value + DEFAULT[0]) : resolt.push(value)
  else
    resolt.push(value)
  end
end
p resolt
p "--------------------------------"

p "9) Дан целочисленный массив. Заменить все положительные элементы на значение минимального."
p DEFAULT
resolt = []
DEFAULT.each { |value| (value > 0) ? resolt.push(DEFAULT.min) : resolt.push(value) }
p resolt
p "--------------------------------"

p "10) Дан целочисленный массив. Заменить все положительные элементы на значение максимального."
p DEFAULT
resolt = []
DEFAULT.each { |value| (value > 0) ? resolt.push(DEFAULT.max) : resolt.push(value) }
p resolt
p "--------------------------------"

p "11) Дан целочисленный массив. Заменить все отрицательные элементы на значение минимального."
p DEFAULT
resolt = []
DEFAULT.each { |value| (value < 0) ? resolt.push(DEFAULT.min) : resolt.push(value) }
p resolt
p "--------------------------------"

p "12) Дан целочисленный массив. Заменить все отрицательные элементы на значение максимального."
p DEFAULT
resolt = []
DEFAULT.each { |value| (value < 0) ? resolt.push(DEFAULT.max) : resolt.push(value) }
p resolt
p "--------------------------------"

p "13) Дан целочисленный массив. Осуществить циклический сдвиг элементов массива влево на одну позицию."
p DEFAULT
p DEFAULT.rotate
p "--------------------------------"

p "14) Дан целочисленный массив. Осуществить циклический сдвиг элементов массива вправо на одну позицию."
p DEFAULT
p DEFAULT.rotate(-1)
p "--------------------------------"

p "15) Дан целочисленный массив. Преобразовать его, вставив перед каждым положительным элементом нулевой элемент."
p DEFAULT
resolt = []
DEFAULT.each do |value|
  resolt.push(value)
  resolt.insert(resolt.index(value), DEFAULT[0]) if value > 0
end
p resolt
p "--------------------------------"

p "16) Дан целочисленный массив. Преобразовать его, вставив перед каждым отрицательным элементом нулевой элемент."
p DEFAULT
resolt = []
DEFAULT.each do |value|
  resolt.push(value)
  resolt.insert(resolt.index(value), DEFAULT[0]) if value < 0
end
p resolt
p "--------------------------------"

p "17) Дан целочисленный массив. Преобразовать его, вставив после каждого положительного элемента нулевой элемент."
p DEFAULT
resolt = []
DEFAULT.each do |value|
  resolt.push(value)
  resolt.push(DEFAULT[0]) if value > 0
end
p resolt
p "--------------------------------"

p "18) Дан целочисленный массив. Преобразовать его, вставив после каждого отрицательного элемента нулевой элемент."
p DEFAULT
resolt = []
DEFAULT.each do |value|
  resolt.push(value)
  resolt.push(DEFAULT[0]) if value < 0
end
p resolt
p "--------------------------------"

p "19) Дан целочисленный массив. Упорядочить его по возрастанию"
p DEFAULT
p DEFAULT.sort
p "--------------------------------"

p "20) Дан целочисленный массив. Упорядочить его по убыванию."
p DEFAULT
p DEFAULT.sort.reverse
p "--------------------------------"
DEFAULT = (-8..8).to_a.shuffle
p "21) Дан целочисленный массив. Найти индекс минимального элемента."
p DEFAULT
p DEFAULT.index(DEFAULT.min)
p "--------------------------------"

p "22) Дан целочисленный массив. Найти индекс максимального элемента."
p DEFAULT
p DEFAULT.index(DEFAULT.max)
p "--------------------------------"

p "23) Дан целочисленный массив. Найти индекс первого минимального элемента."
p DEFAULT
p DEFAULT.min(2).first
p "--------------------------------"

p "24) Дан целочисленный массив. Найти индекс первого максимального элемента."
p DEFAULT
p DEFAULT.max(2).first
p "--------------------------------"

p "25) Дан целочисленный массив. Найти индекс последнего минимального элемента."
p DEFAULT
p DEFAULT.min(2).last
p "--------------------------------"

p "26) Дан целочисленный массив. Найти индекс последнего максимального элемента."
p DEFAULT
p DEFAULT.max(2).last
p "--------------------------------"

p "27) Дан целочисленный массив. Найти количество минимальных элементов."
p DEFAULT
p DEFAULT.min(DEFAULT.sample.abs).count
p "--------------------------------"

p "28) Дан целочисленный массив. Найти количество максимальных элементов."
p DEFAULT
p DEFAULT.max(DEFAULT.sample.abs).count
p "--------------------------------"

p "29) Дан целочисленный массив. Найти минимальный четный элемент."
p DEFAULT
p DEFAULT.select { |value| value.even? }.min
p "--------------------------------"

p "30) Дан целочисленный массив. Найти минимальный нечетный элемент."
p DEFAULT
p DEFAULT.select { |value| value.odd? }.min
p "--------------------------------"

p "31) Дан целочисленный массив. Найти максимальный четный элемент."
p DEFAULT
p DEFAULT.select { |value| value.even? }.max
p "--------------------------------"

p "32) Дан целочисленный массив. Найти максимальный нечетный элемент."
p DEFAULT
p DEFAULT.select { |value| value.odd? }.max
p "--------------------------------"

p "33) Дан целочисленный массив. Найти минимальный положительный элемент."
p DEFAULT
p DEFAULT.select { |value| value > 0 }.min
p "--------------------------------"

p "34) Дан целочисленный массив. Найти максимальный отрицательный элемент."
p DEFAULT
p DEFAULT.select { |value| value < 0 }.max
p "--------------------------------"

p "35) Дан целочисленный массив и интервал a..b. Найти минимальный из элементов в этом интервале."
p DEFAULT
p DEFAULT[3..-2].min
p "--------------------------------"

p "36) Дан целочисленный массив и интервал a..b. Найти максимальный из элементов в этом интервале."
p DEFAULT
p DEFAULT[3..-2].max
p "--------------------------------"

p "37) Дан целочисленный массив. Найти количество элементов, расположенных перед первым минимальным."
p DEFAULT
first_min_index = DEFAULT.index(DEFAULT.min(DEFAULT.sample.abs).first )
p DEFAULT[0..(first_min_index - 1)].count
p "--------------------------------"

p "38) Дан целочисленный массив. Найти количество элементов, расположенных перед первым максимальным."
p DEFAULT
first_max_index = DEFAULT.index(DEFAULT.max(DEFAULT.sample.abs).first)
p DEFAULT[0..(first_max_index - 1)].count
p "--------------------------------"

p "39) Дан целочисленный массив. Найти количество элементов, расположенных перед последним максимальным."
p DEFAULT
last_max_index = DEFAULT.index(DEFAULT.max(DEFAULT.sample.abs).last)
p DEFAULT[0..(last_max_index - 1)].count
p "--------------------------------"

p "40) Дан целочисленный массив. Найти количество элементов, расположенных перед последним минимальным."
p DEFAULT
last_min_index = DEFAULT.index(DEFAULT.min(DEFAULT.sample.abs).last)
p DEFAULT[0..(last_min_index - 1)].count
p "--------------------------------"

p "41) Дан целочисленный массив. Найти два наибольших элемента."
p DEFAULT
p DEFAULT.max(2)
p "--------------------------------"

p "42) Дан целочисленный массив. Найти два наименьших элемента."
p DEFAULT
p DEFAULT.min(2)
p "--------------------------------"

p "43) Дан целочисленный массив. Вывести вначале все его четные элементы, а затем - нечетные."
p DEFAULT
resolt = []
DEFAULT.each { |value| value.even? ? resolt.unshift(value) : resolt.push(value) }
p resolt
p "--------------------------------"

p "44) Дан целочисленный массив. Вывести вначале все его нечетные элементы, а затем - четные."
p DEFAULT
resolt = []
DEFAULT.each { |value| value.odd? ? resolt.unshift(value) : resolt.push(value) }
p resolt
p "--------------------------------"

p "45) Дано целое число. Найти сумму его цифр."
p DEFAULT
resolt = 0
DEFAULT.each { |value| resolt += value }
p resolt
p "--------------------------------"

p "46) Дан целочисленный массив. Найти среднее арифметическое его элементов."
p DEFAULT
resolt = 0
DEFAULT.each { |value| resolt += value }
p resolt / DEFAULT.count
p "--------------------------------"

p "47) Дан целочисленный массив. Найти все четные элементы."
p DEFAULT
resolt = []
DEFAULT.each { |value| resolt.push(value) if value.even? }
p resolt
p "--------------------------------"

p "48) Дан целочисленный массив. Найти количество четных элементов."
p DEFAULT
resolt = []
DEFAULT.each { |value| resolt.push(value) if value.even? }
p resolt.count
p "--------------------------------"

p "49) Дан целочисленный массив. Найти все нечетные элементы."
p DEFAULT
resolt = []
DEFAULT.each { |value| resolt.push(value) if value.odd? }
p resolt
p "--------------------------------"

p "50) Дан целочисленный массив. Найти количество нечетных элементов."
p DEFAULT
resolt = []
DEFAULT.each { |value| resolt.push(value) if value.odd? }
p resolt.count
p "--------------------------------"
