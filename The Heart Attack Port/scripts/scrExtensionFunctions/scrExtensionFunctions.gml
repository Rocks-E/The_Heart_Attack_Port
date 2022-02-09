function getInstancesOf(_objType){
	
	var inst_list;
	var c;
	
	for(c = 0; c < instance_number(_objType); c++) {
		inst_list[c] = instance_find(_objType, c);	
	}
	
	return inst_list;
	
}