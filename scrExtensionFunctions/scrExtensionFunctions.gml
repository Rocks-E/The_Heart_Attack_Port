function getInstancesOf(_objType){
	var c;
	if(instance_number(_objType)>=1){
		var inst_list=[-1];
		
	}	
	else
	var inst_list=noone;
	
	for(c = 0; c < instance_number(_objType); c++) {
		inst_list[c] = instance_find(_objType, c);	
	}
	
	return inst_list;
	
}