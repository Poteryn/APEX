var G_LOCK_SUBMIT;

function plug_submit() {	
	if (!G_LOCK_SUBMIT) {		
		G_LOCK_SUBMIT = true;
		
		var showWait;

		if (this.action.attribute02 == "Y")
			showWait = true;
		else
			showWait = false;
		
		/*Деактивириуем возможность случайного нажатия*/
		if (this.triggeringElement.tagName == 'INPUT')
			this.triggeringElement.setAttribute("readonly", "")
		else if (this.triggeringElement.tagName == 'BUTTON')
			this.triggeringElement.setAttribute("disabled", "")
		
		apex.page.submit({
			request:  this.action.attribute01,
			showWait: showWait,
		});
    }
	else
		console.log("Поторная операция не выполненна - подобная операция уже выполняется!")
}