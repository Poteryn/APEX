function plug_pdf_label() {
	vAjaxIdentifier = this.action.ajaxIdentifier;
	vResumeCallback = this.resumeCallback;
	vDataSet        = {};
	
	if (this.action.attribute03) {
		vArrItems    = this.action.attribute03.split(','); //ITEM(s) param value
		vLabelParam = '';
		
	    for(index in vArrItems){
            vLabelParam = vLabelParam + ";" + apex.item(vArrItems[index]).getValue();
        }
		
		if (vLabelParam) {
	        vLabelParam  = vLabelParam.replace(/^;/,'');
			vDataSet.x01 = vLabelParam; //переаем параметры в датасет
	    }
	}
	
	apex.server.plugin(
		vAjaxIdentifier,
		vDataSet, 
		{ 
			success: function(pData) { 
				let pdfWindow = window.open("");
				
                pdfWindow.document.write(
				    "<html><head><title>PrintLabel</title></head><body style='margin:0'>"
				    + "<iframe width='100%' height='100%' style='border-width:0' src='data:application/pdf;base64, " + encodeURI(pData.pdf_base64) + "'></iframe>"
				    + "</body></html>"
                );
				
				/*Сообщаем о выполнении процесса*/
	            apex.da.resume(vResumeCallback, false);
			},
            error: function(a,b,c){
				console.log('error PrintLabel');
				console.log(a,b,c);
				
				apex.message.alert("При формировании документа произошла ошибка. Попробуйте снова позднее.");
				
				/*Сообщаем о выполнении процесса*/
	            apex.da.resume(vResumeCallback, false);
			}
		}
	); 
}