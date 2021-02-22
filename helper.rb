# 

# Это мои процедуры для работы приложения
require './def/z_get_folder_name' 	# Подключаем процедуру получения адреса топ-папки
require './def/z_make_tree'					# Создание дерева из содержимого в топ-папке
require './def/z_safe_info'					# Сохраняем информацию в файл и Хеш
require './def/z_analizing_info'		# Анализ прочитанных данных (расфасовка) 
require './def/z_display_rezult'		# Вывод результата анализа

# ======================================================================================
# Формируем список файлов в заданной дтректории 
#                (папка и путь)  
def read_from_dir folder, path      # имя папки и путь к ней 
	d = Dir.children(folder)					# Получаем массив дочерних файлов

	Dir.chdir(folder) do							# Заходим в папку, чтобы там делать:
		
		d.each do |filename|						# Перебираем все файлы в папке

			path_cur = path + '/' + filename	# Путь + / + файл = уникальный ключ (для хеша) 
			### print @path_cur

			if Dir.exist?(filename) 			# этот файл - есть директория?
				# It is DIR
				read_from_dir filename, path_cur # тогда РЕКУРСИВНО за пускае себя с нов. парам.
			else
				# It is file
				@files[path_cur] = filename if filename != 'Thumbs.db' # иначе пишем файл в хеш
				#                           исключаем паразитов 'Thumbs.db' из учёта в список (!)                
			end
			### puts " = #{filename}"

		end

	end  
end

# ======================================================================================
#  - Показать, хеш файлов полученный после полного прохода всех паппок
def view_files_hash

	@files.each do |key, value| 
	
		puts "#{value} = from = #{key}"
	
	end

end