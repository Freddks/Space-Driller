//variables
states = "move";
hp= 100;
anim_sprite = 0;

//inverted
timer_reverse_default = room_speed * 2.2;
timer_reverse = 0;

//draw
xpos = 0;
ypos = 0;
alphaFog = 0;
alpha_sprite = 1;

stateGreen = "disable"
alphaFogGreen = 0;

image_xscale = .5
image_yscale = .4

spdNormal = 9*1.2;
spdDiagonal = spdNormal * 0.8*1.2;
spdDown = 1;

right = undefined; left = undefined; up = undefined; down = undefined;
hori = undefined; vert = undefined;

//movement
move = function(){
	
	stateGreen = "disable";
	alphaFogGreen = 0;

	image_blend = c_white;
	var moveX, moveY;
	
	right = keyboard_check(ord("D")); 
	left = keyboard_check(ord("A"));
	up = keyboard_check(ord("W")); 
	down = keyboard_check(ord("S"));
	
	hori = (right - left);
	vert = (down - up);
	
	if (hori != 0 and vert != 0){
	
		moveX = hori*spdDiagonal;
		moveY = vert*(spdDiagonal);
	
	}else{
	
		moveX = hori*spdNormal;
		moveY = vert*(spdNormal);
	
	}
	
	 
        if place_meeting(x+moveX,y,obj_colisao)
        {
       
            while !place_meeting(x+sign(hori),y, obj_colisao) 
            {
       
                x+=sign(hori);
            }
            moveX = 0;
        }
       
        if place_meeting(x,y+moveY,obj_colisao) 
        {
            
            while !place_meeting(x,y+sign(vert), obj_colisao) 
            {              
                y+=sign(vert);
            }
            moveY = 0;
		}
	
	x+= moveX; y+= moveY;
	
if ( instance_exists (obj_beam)){
	if (place_meeting( x , y , obj_beam )){
		timer_reverse = timer_reverse_default;
		states = "evom";
		global.shake+= 10;
	}
}
	
	
}

evom = function(){

switch(stateGreen){

	case "disable":
		stateGreen = "enable"
	break;
	
	case "enable":
		alphaFogGreen = .5;
		if (timer_reverse <= .6 * room_speed){
			stateGreen = "fadding"
		}
	break;
	
	case "fadding":
		if (alphaFogGreen > 0 )alphaFogGreen-= .05
		if (alphaFogGreen <= 0) alphaFogGreen += .5;
	break;

}

var moveX, moveY;
	
	right = keyboard_check(ord("D")); 
	left = keyboard_check(ord("A"));
	up = keyboard_check(ord("W")); 
	down = keyboard_check(ord("S"));
	
	hori = (left - right);
	vert = (up - down);
	
	if (hori != 0 and vert != 0){
	
		moveX = hori*spdDiagonal;
		moveY = vert*(spdDiagonal);
	
	}else{
	
		moveX = hori*spdNormal;
		moveY = vert*(spdNormal);
	
	}
	
	 if place_meeting(x+moveX,y,obj_colisao)
        {
       
            while !place_meeting(x+sign(hori),y, obj_colisao) 
            {
       
                x+=sign(hori);
            }
            moveX = 0;
        }
       
        if place_meeting(x,y+moveY,obj_colisao) 
        {
            
            while !place_meeting(x,y+sign(vert), obj_colisao) 
            {              
                y+=sign(vert);
            }
            moveY = 0;
		}
	
	x+= moveX; y+= moveY;
	
	timer_reverse--;
	
	if (instance_place ( x , y , obj_beam ) ){
		timer_reverse = timer_reverse_default;
		
	}
	
}
	
//hp
taking_damage = function(){
	
	if (alphaFog > 0){
		alphaFog = lerp(alphaFog, 0, 0.5);
	}
	
	var _obstacle = instance_place(x , y , obj_alvo_global);

	if(_obstacle){ 
	
		if (_obstacle.damage == undefined) _obstacle.damage = 0;
		hp-= _obstacle.damage;
		alphaFog+= 100; 
		global.shake += 12;
		instance_destroy(_obstacle);
	}
	
	if (hp <= 0){ 
		alphaFog = 0;
		states = "idle"
	}
	
}
	
//animate
animate = function(){

	xpos = x+random_range(-1.5,1.5)
	ypos = y+random_range(-1.5,1.5)

}

