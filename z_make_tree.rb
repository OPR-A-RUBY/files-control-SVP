# make_tree

def make_tree
	puts '2__Make folders and files tree. Create data hach'
	Dir.children(@folder_name).each do |filename|
		puts "  = #{filename}"
	end 
end
