draw_self();

draw_sprite_ext(spr_player,anim_sprite,xpos,ypos,.8,.8,image_angle,image_blend,alpha_sprite)

gpu_set_fog(true, c_white, 0, 0);
		
	draw_sprite_ext(spr_player , anim_sprite , xpos , ypos , .8 , .8 , image_angle , c_white, alphaFog);
	
gpu_set_fog(false, c_white, 0, 0)


gpu_set_fog(true, c_lime, 0, 0);
		
	
	draw_sprite_ext(spr_player , anim_sprite , xpos , ypos , .8 , .8 , image_angle , c_white, alphaFogGreen);
	
gpu_set_fog(false, c_white, 0, 0)



