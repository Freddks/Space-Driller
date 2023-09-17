if(instance_exists(obj_player)){
	var _valor = 100 - obj_player.hp;
	
	if (_valor > 25) _valor = 25; 
	
	if (place_meeting(x,y, obj_player)){
		obj_player.hp+= _valor;
		instance_destroy(self);
	}
}

	if (x > room_height)instance_destroy(self);


