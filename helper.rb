# 

# Это мои процедуры для работы приложения
require './def/z_get_folder_name' 	# Подключаем процедуру получения адреса топ-папки
require './def/z_make_tree'					# Создание дерева из содержимого в топ-папке
require './def/z_safe_info'					# Сохраняем информацию в файл и Хеш
require './def/z_analizing_info'		# Анализ прочитанных данных (расфасовка) 
require './def/z_display_rezult'		# Вывод результата анализа

def list_from_dir
	d = Dir.children(@folder_name)

	Dir.chdir(@folder_name) do
		
		d.each do |filename|
		
			if Dir.exist?(filename) 
				print 'Dir_'
			else
				print 'file'
			end

			puts " = #{filename}"
			
		end

	end 
end