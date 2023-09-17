
timer--;

if ( timer <= 0 ){
	image_alpha = lerp( image_alpha , 0 , .5 );
	
	if (image_alpha <= 0)instance_destroy(self);

}
