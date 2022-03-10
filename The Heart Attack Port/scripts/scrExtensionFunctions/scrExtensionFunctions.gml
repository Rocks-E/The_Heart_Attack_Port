function getInstancesOf(_objType){
	
	var inst_list = array_create(instance_number(_objType), noone);
	var c;
	
	for(c = 0; c < instance_number(_objType); c++) {
		inst_list[c] = instance_find(_objType, c);	
	}
	
	return inst_list;
	
}

function reverseArray(_arr) {

	var c;
	var result = array_create(array_length(_arr));
	
	for(c = array_length(_arr) - 1; c > -1; c--) {
		result[array_length(_arr) - 1 - c] = _arr[c];
	}
	
	return _arr;

}