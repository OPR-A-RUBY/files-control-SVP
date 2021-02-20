# 'Query folder adress'
# Процедура для получения адреса СТАРТОВОЙ папки для работы.

def get_path_folder
	puts '1__Query folder adress'
	print 'Введите полный адрес Стартовой папки: '
	@path_folder = gets.chomp
	# Проверка наличия папки
	@path_folder
end