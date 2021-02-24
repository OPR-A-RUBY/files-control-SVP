# analizing_info

def analizing_info
	puts '4__Анализ информации из ХЕШа.'

	item = []
	@files.each do |key, value|
		arr = key.split('/')
		puts arr.inspect

		item = []
		if arr.size == 2								# файл лежит в корневой папке
			item[0] = arr[0]+'/'
			item[1] = 'empty'
			item[2] = arr[1]
			item[3] = value

		elsif arr.size == 3							# файл лежит в папке пункта
			item[0] = arr[0]+'/'+arr[1]
			item[1] = 'empty'
			item[2] = arr[2]
			item[3] = value		

		elsif arr.size == 4							# файл ледит в папке отдела ВЕРНО
			item[0] = arr[0]+'/'+arr[1]
			item[1] = arr[2]
			item[2] = arr[3]
			item[3] = value	
		
		elsif arr.size == 5							# файл лежит в папке отдела. ЭТО ВЕРНО.
			item[0] = arr[0]+'/'+arr[1]
			item[1] = arr[2]
			item[2] = arr[4]
			item[3] = value			
		
		end
		
		@tree << item

	end
	
	output_arr

end

def output_arr
	puts '==============================='
	@tree.each do |item|
		puts "#{item[0]} - #{item[1]} = #{item[2]}"
	end	
end	