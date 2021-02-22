# make_tree

def make_tree
	puts '2__Make folders and files tree. Create data hach'
	
	@path_ = @folder_name
	list_from_dir

	@files.each do |key, value| 
		puts "#{value} = from = #{key}"
	end

end
