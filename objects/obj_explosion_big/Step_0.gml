
if (place_meeting(x,y, obj_player) and (image_index >= 2 and image_index < 6) and exploded == false){ 
	
	boom = true;
	if (boom == true ){
		
		obj_player.hp -= 40;
		boom = false;
		
		}
		
	exploded = true;
	
	}

if (image_index == 6) instance_destroy(self);


