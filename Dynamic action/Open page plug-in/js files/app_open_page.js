function plug_open_page() { 
    l_triggeringElem = this.action.attribute07;
	
	dataSet = {
	    x01: this.action.attribute01,
		x02: this.action.attribute02,
		x03: this.action.attribute03,
		x04: this.action.attribute04,
		x05: this.action.attribute05,
		x06: this.action.attribute06
	}
    
	open_page(dataSet, l_triggeringElem);
}