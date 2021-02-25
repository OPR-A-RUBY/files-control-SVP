# safe_info

def safe_info
	puts '3__Сохранить информацию из Хеша в файл.'

	# Создать папку listings для хранения файлов с деревом (Если такой дир-и здесь нет)
	list_folder = 'listings'
	Dir.mkdir(list_folder) if !Dir.exist?(list_folder) 

	dirs = @tree.size.to_s
	files = 0
	@tree.each { |key, value| files += value.size }
	files = files.to_s

	# Создать уникальное имя файла (по "сейчас" дате и времени) с расширением .list	
	listing_file = Time.now.strftime '%Y-%m-%d__%H:%M:%S__(D-' + dirs + '_f-' + files + ')_.list' 
	puts '   | file_name: ' + listing_file

	# Дальше работаем в дирктории 'listings' (Заходим в блок do-end)
	Dir.chdir(list_folder) do
	
		# Открываем файл для записи с уникальным именем, созданным выше
		output_file = File.open(listing_file, "w") 
		# Запись служебной информации (имя файла, количество объектов)
		output_file.write "My name: #{listing_file}\n"
		output_file.write "I'm has: #{dirs} Dirs, #{files} files\n"
		output_file.write "----------------------------------\n"


		# Перебираем весь Хеш @files и пишем данные в файл (разделитель табуляция)
		@tree.each do |key, value| 
			output_file.write "#{key}\t#{value}\n"
		end

		# Кончился Хеш. Закрываем файл.
		output_file.close

		# Закрываем блок. Возвращаемся в исходную директорию
	end

end

def read_info
	# Получить информацию из файла в Хеша.

	# Получить имя файла OLD_.list	
	old_file = 'OLD_.list' 
	puts '   | file_name: ' + old_file

	# Дальше работаем в дирктории 'listings' (Заходим в блок do-end)
	list_dir = 'listings'
	Dir.chdir(list_dir) do
	
		# Открываем файл для чтения со специальным именем, см выше
		input_file = File.open(old_file, "r") 
		# Запись служебной информации (имя файла, количество объектов) ############ STOP ##################
		input_file.write "My name: #{listing_file}\n"
		input_file.write "I'm has: #{elements} objects\n"
		input_file.write "----------------------------------\n"

		while (line = input_file.gets)
		# Перебираем весь Хеш @files и пишем данные в файл (разделитель табуляция)
			@tree.each do |key, value| 
				output_file.write "#{key}\t#{value}\n"
			end
		end
			
		# Кончился Хеш. Закрываем файл.
		input_file.close

		# Закрываем блок. Возвращаемся в исходную директорию
	end

end