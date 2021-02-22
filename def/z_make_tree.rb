# make_tree

def make_tree
	puts '2__Make folders and files tree. Create data hach'
	
	list_from_dir @folder_name, @folder_name

	# TMP - Показать, что получилось ...
	@files.each do |key, value| 
		puts "#{value} = from = #{key}"
	end

end
