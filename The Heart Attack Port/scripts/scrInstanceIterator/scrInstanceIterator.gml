function getInstancesOf(_objType){
	
	var inst_list = array_create(0);
	var c;
	
	for(c = 0; c < instance_number(_objType); c++) {
		array_push(inst_list, instance_find(_objType, c));	
	}
	
	return inst_list;
	
}