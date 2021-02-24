# make_tree

def make_tree
	puts '2__Make folders and files tree. Create data hach'
	
	read_from_dir @folder_name, @folder_name		# Сформировать список файлов

	view_files_hash															# Показать полученный список

end



# ======================================================================================
# Формируем список файлов в заданной дтректории                            (РЕКУРСИВНЫЙ)
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