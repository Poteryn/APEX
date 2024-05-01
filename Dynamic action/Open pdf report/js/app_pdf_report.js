function make_finish(pTrigElem, pResumeCallback){
    if (pTrigElem.tagName == 'BUTTON')
		pTrigElem.disabled = false;
	
	/*Сообщаем о выполнении процесса*/
	apex.da.resume(pResumeCallback, false);
};

function plug_pdf_report() {		
	vAjaxIdentifier = this.action.ajaxIdentifier;
	vResumeCallback = this.resumeCallback;
	vDataSet        = {};
	vTrigElem	    = this.triggeringElement;
	
	if (vTrigElem.tagName == 'BUTTON')
        vTrigElem.disabled = true;
	
	if (this.action.attribute02) {
		vArrItems    = this.action.attribute02.split(','); //ITEM(s) param value
		vReportParam = '';
		
	    for(index in vArrItems){
            vReportParam = vReportParam + ";" + apex.item(vArrItems[index]).getValue();
        }
		
		if (vReportParam) {
	        vReportParam = vReportParam.replace(/^;/,'');
		    vDataSet.x01 = vReportParam;
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
				
				make_finish(vTrigElem, vResumeCallback);
			},
            error: function(a,b,c){
				console.log('error PrintLabel');
				console.log(a,b,c);
				
				apex.message.alert("При формировании документа произошла ошибка. Попробуйте снова позднее.");
				
				make_finish(vTrigElem, vResumeCallback);
			}
		}
	);
};