# safe_info

def safe_info
	puts '3__Сохранить информацию из Хеша в файл.'

	# Создать папку listings для хранения файлов с деревом (Если такой дир-и здесь нет)
	list_folder = 'listings'
	Dir.mkdir(list_folder) if !Dir.exist?(list_folder) 

	# Создать уникальное имя файла (по "сейчас" дате и времени) с расширением .list
	elements = @tree.size.to_s
	listing_file = Time.now.strftime '%Y-%m-%d__%H:%M:%S__(' + elements + ')_.list' 
	puts '   | file_name: ' + listing_file

	# Дальше работаем в дирктории 'listings' (Заходим в блок do-end)
	Dir.chdir(list_folder) do
	
		# Открываем файл для записи с уникальным именем, созданным выше
		output_file = File.open(listing_file, "w") 
		# Запись служебной информации (имя файла, количество объектов)
		output_file.write "My name: #{listing_file}\n"
		output_file.write "I'm has: #{elements} objects\n"
		output_file.write "----------------------------------\n"


		# Перебираем весь Хеш @files и пишем данные в файл (разделитель табуляция)
		@tree.each do |key, value| 
			output_file.write "#{value}\t#{key}\n"
		end

		# Кончился Хеш. Закрываем файл.
		output_file.close

		# Закрываем блок. Возвращаемся в исходную директорию
	end

end
