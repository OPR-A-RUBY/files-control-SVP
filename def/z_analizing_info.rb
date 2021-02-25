# analizing_info

def analizing_info
	puts '4__Анализ информации из ХЕШа.'

	item = []
	@tree.each do |key, value|
		arr = key.split('/')
		# puts arr.inspect

		item = []
		

		if arr.size >= 4							# файлs лежит в ПОД-папке службы "Фото"
			item[0] = arr[0]+'/'+arr[1]	# - пункт
			item[1] = arr[2]						# - служба
			item[2] = value.size				# - кол-во файлов
			item[3] = value							# - имена файлов

			# Будем искать "старые_данные" в массиве
			f = 0
			@tree_.each do |old_item|		# перечислим массив.  
				if old_item[0] == item[0] && old_item[1] == item[1] # Если пункт и служба совпали
					old_item[2] += item[2]			# то добавим новые данные к старым
					old_item[3] += item[3]
					f = 1 	
				end	
			end # поиск закончился. 
			@tree_ << item	if f == 0		# Если старых данных в массиве нет f=0, 
																	# то пишем в массив свои данные. Теперь есть.

		else
			
			if arr.size == 3							# файл лежит в папке службы СТАНДАРТ
				item[0] = arr[0]+'/'+arr[1]
				item[1] = arr[2]
				item[2] = value.size
				item[3] = value	

			elsif arr.size == 2							# файлs лежит в папке пункта СТАНДАРТ
				item[0] = arr[0]+'/'+arr[1]
				item[1] = '----------------------'
				item[2] = value.size
				item[3] = value		

			elsif arr.size == 1							# файлs лежит в корневой папке 
				item[0] = arr[0]+'/'
				item[1] = '----------------------'
				item[2] = value.size
				item[3] = value	
			end	

			@tree_ << item
		end
		
		

	end
	
	output_arr

end

def output_arr
	puts '==============================='
	@tree_.each do |item|
		if item[2] == 0
			print ' - '
		else
			print ' + '
		end	
		puts "#{item[0]} - (#{item[2]}) #{item[1]}: #{item[3]}"
	end	
end	