//variables
image_xscale = .4;
image_yscale = image_xscale;

damage = 25;

timer_default = room_speed*10;
timer = timer_default;

//exist
exist = function(){
	
	image_yscale = image_xscale
	image_xscale = lerp(image_xscale, 1.6, .015);
	image_angle = direction;

	speed = lerp(speed, 12, .025)
	
	timer--
	if (timer <= 0 and (x > room_width+100 or x < -100)){
		instance_destroy(self);

	}

}
