//variables
damage = 5;
spd = 3;
alpha_fog = 0;
image_xscale = .95;
image_yscale = image_xscale;
direction = point_direction(x, y, room_width/2, room_height/2);


color = c_grey;
timer_default = room_speed * .5;
timer = timer_default;
sprite_index = spr_bomb;

distance_follow = 600;
distance_close = 300;

boom = false;

follow = function(){
	
	speed = spd;
	
	if (instance_exists(obj_player)){
		var _distance = point_distance(x , y , obj_player.x , obj_player.y);

	
		
		if ( _distance < distance_follow){
			var _dir = point_direction(x , y , obj_player.x , obj_player.y);
			direction = _dir;
			
			if(_distance < distance_close){
				
				boom = true;
			
			}
			
		}
		
		if (boom == true){
			spd = lerp(spd , 10 , .025);
			timer_default = .21 * room_speed;
		}
	}

}

explode = function(){
	
	if (alpha_fog  >= 1.6){
		
	instance_destroy(self);
	
	
	}

	

}

tick = function(){
	if (alpha_fog > 0) alpha_fog -= .05;
	timer--;
	
	if (timer <= 0){
		alpha_fog+= .8;
		timer = timer_default;
	
	}

}