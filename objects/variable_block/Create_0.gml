/// @description Insert description here
// You can write your code in this editor
randomize();
if(random(10)>5){
	instance_create_layer(x,y,"Instances",ground1_obj);
	instance_create_layer(x+32,y,"Instances",ground1_obj);
	instance_create_layer(x,y+32,"Instances",ground1_obj);
	instance_create_layer(x+32,y+32,"Instances",ground1_obj);

}