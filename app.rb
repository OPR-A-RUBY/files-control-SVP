# Программа сбора информации о файлах
require './helper.rb'

system('clear')
puts '0__Start application'

puts '1__Query folder adress'
get_path_folder
puts "Получен путь: #{@path_folder}"

puts '2__Make folders and files tree. Create data hach'
create_tree

### '3__Safe hach information to file'
safe_info

puts '4__Analiz informations from hach'

puts '5__Display rezult'