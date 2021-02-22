# make_tree

def make_tree
	puts '2__Make folders and files tree. Create data hach'
	
	read_from_dir @folder_name, @folder_name		# Сформировать список файлов

	view_files_hash															# Показать полученный список

end
