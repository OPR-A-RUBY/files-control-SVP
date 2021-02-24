# safe_info

def safe_info
	puts '3__Safe hach information to file'

	# Создать папку listings для хранения файлов с деревом (Если такой дир-и здесь нет)
	list_folder = 'listings'
	Dir.mkdir(list_folder) if !Dir.exist?(list_folder) 

	# Создать имя файла (по "сейчас" дате и времени) с расширением .list
	listing_file = Time.now.strftime '%Y-%m-%d_%H:%M:%S_OPR' + '.list' 
	puts listing_file

	# @files.each do |key, value| 
	# 		puts "#{value} = from = #{key}"
	# end

end


# ---------------------------------------------------------------------

