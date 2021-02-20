# 'Query folder adress'
# Процедура для получения адреса СТАРТОВОЙ папки для работы.

def get_path_folder
	puts '1__Получить_имя_топ-папки'
	
	loop do
		# Запрос имени топ-папки
		print 'Введите имя Стартовой папки: '
		@path_folder = gets.chomp

		
		# Проверка наличия папки
		if Dir.exist?(@path_folder)					# Есть папка с введённым именем?
			puts 'Папка найдена'
			puts Dir.children(@path_folder)   # 
			break															# Выходим. Получены данны введённые
		
		elsif @path_folder == ''						# Если пустой ввод, то будет ...
			@path_folder = 'fold' 						# ... папка по-умолчанию 'fold'
		
			if Dir.exist?('fold')							# Есть папка 'fold'?
				puts 'Выбрана папка fold'
				break														# Выходим. Получены данные по умолчанию
			else
				puts 'Ошибка'
				exit
			end	
		
		else
			puts 'Нет такой папки ... Проверьте имя'
																				# Повторим запрос папки
		end 

	end

end