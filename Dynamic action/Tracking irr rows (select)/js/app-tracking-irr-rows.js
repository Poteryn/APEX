function select_irr_row(p_current_row) {
    $(p_current_row).parent('tbody').children('.irr_row_selected').removeClass("irr_row_selected");
    $(p_current_row).addClass("irr_row_selected");
};

function add_event_tracking_rows(){
	/*Регион может быть только один, поэтому берем 0-ой элемент*/
    l_region = this.affectedElements[0];

    /*стандартный путь до строк IR*/
    l_rows_region = $('#' + l_region.id + '_data_panel .t-fht-tbody table.a-IRR-table tr');
	/*Для строк добавляем атрибут "id региона", чтобы не искать его в родительских элементах
	  Нужно для обратного вызова в кастомном событии "IR_ROW_SELECTED"
	*/
	l_rows_region.attr('IRR_region_id', l_region.id);
	
	/*Добвляем обработчик нажатия на строку IR*/
    l_rows_region.click(function() {
		l_region_id = $(this).attr('IRR_region_id');
		
        select_irr_row(this);
		
		/*Инициируем событие выбора строки региона, указав ссылку на выбранную строку*/
		apex.event.trigger('#' + l_region_id
		                 , 'CST_IR_ROW_SELECTED'
						 , this
	    );
    });
};