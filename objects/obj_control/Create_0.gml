randomise();

//variables
space_level = 1; //until 100
bar_positionX =  room_width-85; 
bar_positionY = undefined;

end_timer = room_speed * 5;

//screenshake
defaut_xport = view_xport;
defaut_yport = view_yport;
global.shake = 0;
screen_shake = true;

//events
state = "disable"
event0_timer = 0; 
event1_timer = 0; 
event2_timer = 0; 
event3_timer = 0;
event4_timer = 0; 

summon_timer_default = room_speed * 2.5;
summon_timer = 60;

random_number = 0;
compare_number = 0;

events_space = ds_list_create();

events_space[0] = 80 //meteorites
events_space[1] = 50 //falling objects
events_space[2] = 30 //explosion
events_space[3] = 25 //radar
events_space[4] = 10 //energy pack
//events_space[5] = 1 //louro josé

events_space_total = 0;

for(var i = 0 ; i < array_length(events_space) ; i++){
	events_space_total += events_space[i];
}

arraysize_space = array_length(events_space);


//visuals
screenshake = function(){
	if (screen_shake == true){
		if (global.shake > 0){
		view_xport[0]= random_range(-global.shake,global.shake);
		view_yport[0] = random_range(-global.shake,global.shake)
		}else{
		view_xport = defaut_xport;
		view_yport = defaut_yport;
		}
	
		if (global.shake > 0) global.shake--;	
	}
}
	
health_bar = function(){
	
	if(state= "space"){
		var _size = 0;
	
		if (instance_exists(obj_player)){
			_size  = (obj_player.hp*0.01);
			if ( _size  <= 0) _size = 0;
		}
		var positionX =  25; var positionY = room_height-30;
	
	
		draw_sprite_ext(spr_batery , 0 , positionX, positionY , .5 , .5 , image_angle, image_blend , .5);
		draw_sprite_ext(spr_batery , 1 , positionX, positionY , .5 , .5*_size , image_angle, image_blend , .5);
		draw_sprite_ext(spr_batery , 2 , positionX, positionY , .5 , .5 , image_angle, image_blend , .5);
	}
}
	
progress_bar = function(){
	
	if (state == "space"){
		bar_positionY = (room_height-38)+space_level;
	
		var _playerX = 0, _playerY = 0;
	
		var positionX =  room_width-85; 
		var positionY = room_height-38;
	
		draw_sprite_ext(spr_progress , 0 , positionX, positionY , 1 , 1 , image_angle, image_blend , .5);
		draw_sprite_ext(spr_progress , 1 , positionX, positionY , 1 , 1 , image_angle, image_blend , .5);
		draw_sprite_ext(spr_progress , 2 , positionX, positionY , 1 , 1 , image_angle, image_blend , .5);
		draw_sprite_ext(spr_progress , 3 , bar_positionX, bar_positionY , 1 , 1 , image_angle, image_blend , .5);
	}
}
