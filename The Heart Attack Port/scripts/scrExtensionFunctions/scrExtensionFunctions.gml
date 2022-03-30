function getInstancesOf(_objType){
	
	var inst_list = array_create(instance_number(_objType), noone);
	var c;
	
	for(c = 0; c < instance_number(_objType); c++) {
		inst_list[c] = instance_find(_objType, c);	
	}
	
	return inst_list;
	
}

function reverseArray(_arr) {
	
	var result = array_create(0);
	
	var arrCopy = array_create(0);
	array_copy(arrCopy, 0, _arr, 0, array_length(_arr));
	
	while(array_length(arrCopy) > 0) {
		array_push(result, array_pop(arrCopy));
	}
	
	return result;

}