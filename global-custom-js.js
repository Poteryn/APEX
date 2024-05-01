function set_value_items(pNames, pValues){
    l_arr_items  = pNames.split(';');
    l_arr_values = pValues.split(';');
    
    for(index in l_arr_items){
        apex.item(l_arr_items[index]).setValue(l_arr_values[index]);
    }
};

function open_page(pDataSet, pTriggeringElem) {
	ajaxCallback = {
		success: function (resp)
		{   
			l_url = resp.url;
			if (pTriggeringElem) {
				l_url = l_url.replace(
					/,this\);$/
				  , ', apex.jQuery("' + pTriggeringElem +'"));'
			    );
			}
			apex.navigation.redirect(l_url);
		},
		error: function(a,b,c){ console.log(a,b,c)}
	}
    
	apex.server.process(
	    'GET_URL'
	  , pDataSet
      , ajaxCallback
	);
}