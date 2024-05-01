function fill_items(pRow, pItems, pJQ) {
	if (!l_row) return;
	
	for (index in pItems) {
		/*Если указали атрибут как конечный указатель, значит выбираем атирбут элемента как значение*/
		if (/\[\w+\]$/.test(pJQ[index])) {
			l_attr  = pJQ[index].match(/\[\w+\]$/)[0].slice(1,-1);
			l_value = $(pRow.querySelector(pJQ[index])).attr(l_attr);
		}
		/*в ином случае мы хотим взять текст элемента*/
		else {
			l_value = $(pRow.querySelector(pJQ[index])).text();
		}
		
		apex.item(pItems[index]).setValue(l_value);
	}
};

function set_irr_row_values(){
	l_items = this.action.attribute01.split(',');
	l_jQ	= this.action.attribute02.split(',');
	
	if (this.triggeringElement.tagName == 'TR')
		l_row = this.triggeringElement;
	else if (this.data.tagName == 'TR')
		l_row = this.data;
	
	fill_items(l_row, l_items, l_jQ);
	
	/*Успешное выполнение*/
	apex.da.resume(this.resumeCallback, false);
};