//variables
state = "idle";
image_xscale = .79;
image_yscale = image_xscale;

damage = 10;

timer_default = room_speed*10;
timer = timer_default;

//selecting sprite
appearence = ds_list_create(); ds_list_clear(appearence);
ds_list_add(appearence, spr_rock1 , spr_rock2 , spr_rock3)	

var _image = (random(3)-1)
sprite_index = appearence[| _image]


//movement
_side = 0;
if (x < 960) { _side = 1 } else { _side = -1; } 

spd = random_range(1.5,4)*_side;

moving = function(){
	x+= (lerp(spd,(spd*10),.25))

	timer--
	if (timer <= 0 and (x > room_width+100 or x < -100)){
		instance_destroy(self);
	}

}

//animation and optimization
_turn = irandom_range(-1, 1);
if (_turn >= -0.9 and _turn <= 0.9)_turn = random_range(-1, 1);

rotating = function(){
	var _dir = 0;
	
	if (_dir == 0) _dir = (random_range(.2 , 1.8)) * _turn;
	
	image_angle-= _dir;
	
}

