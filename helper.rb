# 

# Это мои процедуры для работы приложения
require './def/z_get_folder_name' 	# Подключаем процедуру получения адреса топ-папки
require './def/z_make_tree'					# Создание дерева из содержимого в топ-папке
require './def/z_safe_info'					# Сохраняем информацию в файл и Хеш
require './def/z_analizing_info'		# Анализ прочитанных данных (расфасовка) 
require './def/z_display_rezult'		# Вывод результата анализа

def list_from_dir folder, path 
	d = Dir.children(folder)

	Dir.chdir(folder) do
		
		d.each do |filename|

			path_cur = path + '/' + filename
			# print @path_cur

			if Dir.exist?(filename) 
				# It is DIR
				list_from_dir filename, path_cur
			else
				# It is file
				@files[path_cur] = filename
			end

			# puts " = #{filename}"

		end

	end 
end