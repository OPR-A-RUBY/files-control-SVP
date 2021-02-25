# analizing_info

def analizing_info
	puts '4__Анализ информации из ХЕШа.'

	# Получаем массив @arr из Хеша @tree
	create_array @tree, @arr

	output_array

end

def create_array hh, array
	item = []
	hh.each do |key, value|
		arr = key.split('/')					# Разделим путь на папки
		### puts arr.inspect

		item = []
		
		if arr.size >= 4							# файлs лежит в ПОД-папке службы. Например "Фото"
			item[0] = arr[0]+'/'+arr[1]	# - пункт мероприятия
			item[1] = arr[2]						# - служба
			item[2] = value.size				# - кол-во файлов
			item[3] = value							# - имена файлов

			# Будем искать "старые_данные" в массиве
			f = 0	
			array.each do |old_item|			# перечислим массив.  
				if old_item[0] == item[0] && old_item[1] == item[1] # Если пункт и служба совпали
					old_item[2] += item[2]		# то добавим новые данные к старым
					old_item[3] += item[3]
					f = 1 	
				end	
			end # поиск закончился. 

			array << item	if f == 0				# Если старых данных в массиве нет f=0, 
																	# то пишем в массив свои данные. Теперь есть.

		else	# Если же файлы лежат не глубоко, то рассмотрим варианты: 	
			if arr.size == 3							# файл лежит в папке службы СТАНДАРТ
				item[0] = arr[0]+'/'+arr[1]
				item[1] = arr[2]
				item[2] = value.size
				item[3] = value	

			elsif arr.size == 2							# файлs лежит в папке пункта НЕ ХОРОШО
				item[0] = arr[0]+'/'+arr[1]
				item[1] = '----------------------'
				item[2] = value.size
				item[3] = value		

			elsif arr.size == 1							# файлs лежит в корневой папке ПЛОХО 
				item[0] = arr[0]+'/'
				item[1] = '----------------------'
				item[2] = value.size
				item[3] = value	
			end	

			array << item		# Для всех ТРЁХ случаев: записываем массив item в массив arr
		end
	end 
end

def output_array
	puts '==============================='
	@arr.each do |item|
		if item[2] == 0
			print ' - '
		else
			print ' + '
		end	
		puts "#{item[0]} - (#{item[2]}) #{item[1]}: #{item[3]}"
	end	
end	