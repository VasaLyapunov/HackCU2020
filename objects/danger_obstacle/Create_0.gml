/// @description Insert description here
// You can write your code in this editor
randomize();
bitmap[0]="000000010231133";
bitmap[1]="003330111122222";
bitmap[2]="222221111122222";
bitmap[3]="000000202013331";

var i;
var nx;
var ny;
trap = bitmap[choose(0,1,2,3)];
for(i=0;i<15;i++){
	nx = (i % 5)*64;
	ny = (i div 5)*64;
	if(string_char_at(trap, i)=="1"){
		instance_create_layer(x+nx,y+ny,"Instances",ground1_obj);
		instance_create_layer(x+nx+32,y+ny,"Instances",ground1_obj);
		instance_create_layer(x+nx,y+ny+32,"Instances",ground1_obj);
		instance_create_layer(x+nx+32,y+ny+32,"Instances",ground1_obj);
	}
	else if(string_char_at(trap, i)=="2"){
		instance_create_layer(x+nx,y+ny,"Instances",variable_block);	
	}
	else if(string_char_at(trap, i)=="3"){
		instance_create_layer(x+nx,y+ny,"Instances",spike_obj);	
	}
}