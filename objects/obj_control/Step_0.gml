if(keyboard_check_pressed(vk_f11)){ 
if window_get_fullscreen()
    {
        window_set_fullscreen(false);
    }
    else
    {
        window_set_fullscreen(true);
    }
}


switch(state){
	
	case  "disable": 
	
		//nothing happens
		
		events_count = 0;
		screen_shake = false;
		if (instance_exists(obj_alvo_global)){
			obj_alvo_global.image_alpha = lerp(obj_alvo_global.image_alpha , 0 , .5)
			if (obj_alvo_global.image_alpha <= 0)instance_destroy(obj_alvo_global);
		}
	break;
	
	case "space":
		
		#region level configs
		if (space_level < 420 ){space_level+= 0.042;}
		//0 = 0;
		//1 = 75
		//2 = 150
		//3 = 222
		//4 = 298
		//5= 370
		//final 420
	
		if (space_level < 25){
			
			event0_timer = room_speed * 3;
			event1_timer = room_speed * 0; 
			event2_timer = room_speed * 0;
			event3_timer = room_speed * 0;
			event4_timer = 0;
		}
		else if (space_level < 75){
			event0_timer = room_speed * 2.5;
			event1_timer = room_speed * 1.5; 
			event2_timer = room_speed * 0;
			event3_timer = room_speed * 0;
			event4_timer = 0;
		
		}
		else if (space_level < 125){
			event0_timer = room_speed * 2.5;
			event1_timer = room_speed * 1.5; 
			event2_timer = room_speed * 2.5;
			event3_timer = room_speed * 0;
			event4_timer = 0;
		
		}
		else if (space_level < 150){
			event0_timer = room_speed * 1.5;
			event1_timer = room_speed * 1.5; 
			event2_timer = room_speed * 2.5;
			event3_timer = room_speed * 0;
			event4_timer = 0;
		
		}
		else if (space_level < 186){
			event0_timer = room_speed * 1.5;
			event1_timer = room_speed * 1.5; 
			event2_timer = room_speed * 2.5;
			event3_timer = room_speed * 0;
			event4_timer = 0;
	
		}
		else if (space_level < 222){
			event0_timer = room_speed * 1.0;
			event1_timer = room_speed * 1.0; 
			event2_timer = room_speed * 2.5;
			event3_timer = room_speed * 0;
			event4_timer = 0;
		
		}
		else if (space_level < 260){
			event0_timer = room_speed * 1.0;
			event1_timer = room_speed * 1.0; 
			event2_timer = room_speed * 2.5;
			event3_timer = room_speed * 2.5;
			event4_timer = 0;
		
		}
		else if (space_level < 298){
			event0_timer = room_speed * 1.0;
			event1_timer = room_speed * 1.0; 
			event2_timer = room_speed * 2.5;
			event3_timer = room_speed * 1.5;
			event4_timer = 0;
		
		}
		else if (space_level < 370){
			event0_timer = room_speed * 1.0;
			event1_timer = room_speed * 1.0; 
			event2_timer = room_speed * 2.0;
			event3_timer = room_speed * 1.5;
			event4_timer = 0;
		
		}
		else if (space_level < 420){
			event0_timer = room_speed * 1.0;
			event1_timer = room_speed * 1.0; 
			event2_timer = room_speed * 1.5;
			event3_timer = room_speed * 1.5;
			event4_timer = 0;
		
		}else if (space_level >= 420){
		
			end_timer--;
			
			if (end_timer <= 0){
				game_end();
			}
		}
		#endregion
		
		screen_shake = true;
		screenshake();
		
		#region Events
		//turn on the timer
		if (summon_timer > 0 and space_level < 420) summon_timer--;  
		
		if (summon_timer <= 0 and space_level < 1000){
			if (random_number == 0) random_number = irandom_range(1, events_space_total);
			
			for(var i = 0 ; i < arraysize_space ; i++ ){
			
				compare_number += events_space[i];
			
				if ( random_number <= compare_number ){
					show_debug_message("the rarity is " + string(events_space[i]));
				
					switch(i){
					
					#region rocks
					
					case 0 : //rocks
					
					if (event0_timer != 0){
						summon_timer_default = event0_timer;
					}else{ 
						summon_timer_default = 0;
						break;
					}
					
					if(instance_number(obj_rock)  <= 16 ){
						repeat(irandom_range(3,5)){
							instance_create_layer(irandom_range(-100,-375) , irandom(room_height) , "obstacles" , obj_rock)
							instance_create_layer(irandom_range(room_width+100,room_width+375) , irandom(room_height) , "obstacles" , obj_rock)
						}
					}else{
						i = irandom_range( 1 , array_length(events_space));
					}
					
					
					break;
					#endregion
					
					#region comet
					case 1 : 
					
					if (event1_timer != 0){
						summon_timer_default = event0_timer;
					}else{ 
						summon_timer_default = 0;
						break;
					}
					
					repeat(3){
						var _positionX = 0 , _positionY = 0 , _random = 0;
						_positionY = irandom_range( -50 , -350 );
						_random = irandom_range(1,2);
					
						if(_random == 1){
							_positionX = irandom_range(-50 , -250);
						}else {
							_positionX = irandom_range(room_width+50, room_width+250)
						}
					
						var _comet = instance_create_layer(_positionX , _positionY, "obstacles", obj_comet);
						
						if _random == 1{
							_comet.direction = irandom_range(290 , 350);
						}else{
							_comet.direction = irandom_range(190, 250); }
							
						_comet.speed = 2;
						_comet.sprite_index = spr_comet;
						
					
					}
					
					summon_timer_default = event1_timer;
					
					break;
					#endregion
					
					#region bomb
					case 2 :
					
					if (event2_timer != 0){
						summon_timer_default = event0_timer;
					}else{ 
						summon_timer_default = 0;
						break;
					}
					
					var _bomb = 0;
					var _positionX = 0 , _positionY = 0;
					
					if (_positionX == 0) _positionX = choose(-250 , room_width+250);
					
					if (_positionY == 0) _positionY = irandom_range( -250 , room_height+250 );
					
					_bomb = instance_create_layer(_positionX , _positionY , "obstacles", obj_bomb);
					_bomb.sprite_index = spr_bomb;
					
					summon_timer_default = event2_timer;
					
					break;
					#endregion
					
					#region radar
					case 3 :
					
						if (event3_timer != 0){
							summon_timer_default = event0_timer;
						}else{ 
							summon_timer_default = 0;
							break;
						}
					
						var _radar = undefined , _posX = undefined , _posY = undefined;
						if (_posX == undefined) _posX = choose(-250 , room_width+250);
						if (_posY == undefined) _posY = irandom_range( 150 , room_height-150);
						
						_radar = instance_create_layer( _posX , _posY , "obstacles" , obj_radar);
						_radar.sprite_index = spr_radar;
						
					
						summon_timer_default = event3_timer;
						
					
					break;
					#endregion
					
					#region batery
						case 4 :
							var batery = undefined, posX = undefined, posY = undefined;
							if (posX == undefined)posX = irandom_range( 5, room_width-5);
							if (posY == undefined)posY = irandom_range( -100 , -150);
							
							batery = instance_create_layer( posX , posY , "obstacles" , obj_up_batery);
							
							summon_timer_default = 0;
						
					#endregion
					}

					random_number = 0;
					compare_number = 0;
					summon_timer = summon_timer_default;
					break;	
				}
			}
		}
		#endregion
	
	break;
	
}

if     (keyboard_check_pressed(vk_enter) and state == "disable"){ state = "space"; audio_play_sound(sn_space,1,true)
	}


