//variables
state = "move"
spd = 0;
direction = 0;
sprite_index = spr_radar;
boom_direc = undefined;

timer_stop_default = room_speed * 4
timer_stop = timer_stop_default;
if ( x < room_width/2){
	spd = 2;}
if (x > room_width/2){
	spd = -2;
	direction = 180;	
	}


move = function(){
	
	timer_stop--;
	x+= spd;
	
	if (timer_stop <= 0){
			state = "aim";
			timer_stop_default = room_speed * 4;
			timer_stop = timer_stop_default;
	}
}

aim = function(){
	timer_stop--;
	var _dir = undefined;
	var _plus = undefined
	
	if (instance_exists(obj_player)){
		//ESTUDAR A FRAÇÃO DE CÓDIGO ABAIXO, É SÉRIO : https://youtu.be/P7hlZc8Y9w4?si=gK0ni8KqvEOhjY70
		_dir = point_direction(x , y , obj_player.x , obj_player.y)
		_plus = angle_difference( _dir , direction);
		direction+= _plus * .02 
		 
	}
	
	if (timer_stop <= 0){
		state = "fire";
		timer_stop_default = room_speed * 1;
	}
	
}
	
fire = function(){
	
	timer_stop--;
	
	if ( timer_stop <= 0 ){
		
		var _beam = instance_create_layer( x , y , "obstacles" , obj_beam );
		_beam.sprite_index = spr_beam;
		_beam.direction = direction;
		_beam.image_angle = _beam.direction;
		timer_stop = room_speed * 1.4;
		state = "wait";
	}

}

wait = function(){
timer_stop--;

if (timer_stop <= 0){
	state = "out";
}

}

explode = function(){
	var _boom = undefined;
		
	if (state == "out"){
		_boom = instance_create_layer(x+boom_direc , y , "obstacles" , obj_explosion);		
		_boom.sprite_index = spr_boom2;
		instance_destroy(self);
	}

}



