function open_dict_list(pThis){
	dataSent = {
		x01: 110,
	    x02: 309,
		x03: 309,
		x04: 'P309_TABLE_NAME',
		x05: $(pThis).attr('table_name')
	};
	
	open_page(dataSent, '#' + pThis.id);
}

function set_selected_dict_val(e, data){
	l_item = e.target.id;
	apex.item(l_item).setValue(data.P309_ID, data.P309_VALUE);
	
	/*Инициируем событие установки значения*/
	apex.event.trigger('#' + l_item
					 , 'CST_SET_DICT_VALUE'
	);
}