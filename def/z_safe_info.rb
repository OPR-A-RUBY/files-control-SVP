# safe_info

def safe_info
	puts '3__Safe hach information to file'

	# Создать папку listings для хранения файлов с деревом (Если такой дир-и здесь нет)
	list_folder = 'listings'
	Dir.mkdir(list_folder) if !Dir.exist?(list_folder) 

	# Создать уникальное имя файла (по "сейчас" дате и времени) с расширением .list
	listing_file = Time.now.strftime '%Y-%m-%d__%H:%M:%S__' + '.list' 
	puts listing_file

	# Дальше работаем в дирктории 'listings' (Заходим в блок do-end)
	Dir.chdir(list_folder) do
	
		# Открываем файл для записи с уникальным именем, созданным выше
		output_file = File.open(listing_file, "w") 

		# Перебираем весь Хеш @files и пишем данные в файл (разделитель табуляция)
		@files.each do |key, value| 
			output_file.write "#{value}\t#{key}\n"
		end

		# Кончился Хеш. Закрываем файл.
		output_file.close

		# Закрываем блок. Возвращаемся в исходную директорию
	end

end


# ---------------------------------------------------------------------

