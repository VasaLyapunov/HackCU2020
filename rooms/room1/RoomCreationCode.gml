randomize();
bitmap[0]="00000000000000000000000000000000000000000021111200021111112001111111101111111111";
bitmap[1]="11001111112222222222000000000000000000000050000000000000000000000000001111111111";
bitmap[2]="22222222220000000000000000000000000001110000000022000000200011001111111100111111";

var i;
var j;
var nx;
var ny;
var time_since_drop = 0;
for(j=0; j<16; j++){
	trap = bitmap[choose(0,1,2)];
	if(time_since_drop > 3){
		trap = bitmap[2];
		time_since_drop =0;
	}
	time_since_drop += 1;
for(i=0;i<80;i++){
	nx = (i % 10)*64+((j%4)*640);
	ny = (i div 10)*64+((j div 4)*512);
	if(string_char_at(trap, i+1)=="1"){
		instance_create_layer(nx,ny,"Instances",ground1_obj);
		instance_create_layer(nx+32,ny,"Instances",ground1_obj);
		instance_create_layer(nx,ny+32,"Instances",ground1_obj);
		instance_create_layer(nx+32,ny+32,"Instances",ground1_obj);

	}
	else if(string_char_at(trap, i+1)=="2"){
		instance_create_layer(nx,ny,"Instances",variable_block);
	}
	else if(string_char_at(trap, i+1)=="3"){
		instance_create_layer(nx,ny,"Instances",spike_obj);	
	}
	else if(string_char_at(trap, i+1)=="5"){
		instance_create_layer(nx,ny,"Instances",danger_obstacle);	
	}
}
}