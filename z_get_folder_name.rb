# 'Query folder adress'
# Процедура для получения адреса СТАРТОВОЙ папки для работы.

def get_folder_name
	puts '1__Получить_имя_топ-папки'
	
	loop do
		# Запрос имени топ-папки
		print 'Введите имя Стартовой папки: '
		@folder_name = gets.chomp

		
		# Проверка наличия папки
		if Dir.exist?(@folder_name)					# Есть папка с введённым именем?
			puts 'Папка найдена'
			puts Dir.children(@folder_name)   # 
			break															# Выходим. Получены данны введённые
		
		elsif @folder_name == ''						# Если пустой ввод, то будет ...
			@folder_name = 'fold' 						# ... папка по-умолчанию 'fold'
		
			if Dir.exist?('fold')							# Есть папка 'fold'?
				puts 'Выбрана папка по умолчанию: "fold"'
				break														# Выходим. Получены данные по умолчанию
			else
				puts 'Ошибка'
				puts 'Отсутствует папка по умолчанию "fold"'
				exit
			end	
		
		else
			puts 'Нет такой папки ... Проверьте имя'
																				# Повторим запрос папки
		end 

	end

end