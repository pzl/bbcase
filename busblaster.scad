$fn=100;

module bb(){
	width=56;
	length=90;
	height=1.6;

	edge_radius=3.7;
	screw_r=1.6;

	screw_offset=2.4;
	

	difference(){
		//main PCB rectangle
		color("red")
		hull(){
			translate([-width/2+edge_radius,-length/2+edge_radius,0]){
				cylinder(h=height,r=edge_radius);
			}
			translate([-width/2+edge_radius,length/2-edge_radius,0]){
				cylinder(h=height,r=edge_radius);
			}
			translate([width/2-edge_radius,-length/2+edge_radius,0]){
				cylinder(h=height,r=edge_radius);
			}
			translate([width/2-edge_radius,length/2-edge_radius,0]){
				cylinder(h=height,r=edge_radius);
			}
		}

		//screw holes
		translate([-width/2+screw_r+screw_offset,-length/2+screw_r+screw_offset,-0.5]){
			color("orange")
			cylinder(h=height+1,r=screw_r);
		}
		translate([-width/2+screw_r+screw_offset,length/2-screw_r-screw_offset,-0.5]){
			color("orange")
			cylinder(h=height+1,r=screw_r);
		}
		translate([width/2-screw_r-screw_offset,-length/2+screw_r+screw_offset,-0.5]){
			color("orange")
			cylinder(h=height+1,r=screw_r);
		}
		translate([width/2-screw_r-screw_offset,length/2-screw_r-screw_offset,-0.5]){
			color("orange")
			cylinder(h=height+1,r=screw_r);
		}

	}
	
	//USB
	translate([-7.6/2,-length/2-0.6,height]){
		color("silver")
		cube([7.6,9.1,3.7]);
	}

	//pin header
	difference(){
		translate([-33/2,length/2-8.6-4.3,height]){
			color("darkslategrey")
			cube([33,8.6,10.6-height]);
		}
		//hollow center
		translate([-31/2,length/2-6.6-5.3,height+2.4]){
			color("darkslategrey")
			cube([31,6.6,10-height]);
		}
		//polarity notch
		translate([-4.5/2,length/2-13.8,height+2.15]){
			color("darkslategrey")
			cube([4.5,2,12]);
		}

		//side holes
		translate([33/2-1.02,length/2-8.6-3.3/2,height-0.1]){
			color("darkslategrey")
			cube([1.03,3.3,6.46]);
		}
		translate([-33/2-.01,length/2-8.6-3.3/2,height-0.1]){
			color("darkslategrey")
			cube([1.03,3.3,6.46]);
		}
	}

	//power jumper
	translate([-33/2-2.35-2.3,length/2-5-6.2,height]){
		color("darkslategrey")
		cube([2.35,5,10.2-height]);
	}

	//mode jumper
	translate([-width/2+2.2,-length/2+28.3,height]){
		color("darkslategrey")
		cube([2.4,7.5,10.2-height]);
	}



	//power led
	translate([width/2-1.25-1.8,-length/2+13,height]){
		color("white")
		cube([1.25,2.1,2.5-height]);
	}
	//resistor
	translate([width/2-.81-2,-length/2+9.2,height]){
		color("darkslategrey")
		cube([.81,1.7,0.35]);
	}

	//act led
	translate([width/2-1.25-1.8,-length/2+32.3,height]){
		color("white")
		cube([1.25,2.1,2.5-height]);
	}
	//resistor
	translate([width/2-.81-2,-length/2+32.3+4,height]){
		color("darkslategrey")
		cube([.81,1.7,0.35]);
	}


	//button
	translate([width/2-5.3-1.8,-length/2+20.6,height]){
		color("silver")
		cube([5.3,5.3,3.2-height]);
	}

	//crystal
	translate([-width/2+3.5/2+14.9,-length/2+3.5/2+7,height+4-2.8]){
		color("silver")
		hull(){
			cylinder(r=3.5/2,h=2.8);
			translate([0,9.9-3.5,0]){
				cylinder(r=3.5/2,h=2.8);
			}
		}
	}
	translate([-width/2+4.44/2+14.2,-length/2+4.44/2+6.1,height+4-2.8]){
		color("silver")
		hull(){
			cylinder(r=4.44/2,h=0.2);
			translate([0,11.2-4.44,0]){
				cylinder(r=4.44/2,h=0.2);
			}
		}
	}
	translate([-width/2+14.2,-length/2+6.1,height]){
		color("darkslategrey")
		cube([4.44,11.2,4-2.8]);
	}
	

	//UNDERSIDE

	//power jumper
	translate([-width/2+0.6+7.4,length/2-0.6-7,-1.3]){
		color("silver")
		cylinder(h=1.3,r1=0.25,r2=0.6);
	}
	translate([-width/2+0.6+7.4,length/2-0.6-7-2.7,-1.3]){
		color("silver")
		cylinder(h=1.3,r1=0.25,r2=0.6);
	}
	


	//mode jumper
	translate([-width/2+0.6+2.9,-length/2+28.9+0.6,-1.3]){
		color("silver")
		cylinder(h=1.3,r1=0.25,r2=0.6);
	}
	translate([-width/2+0.6+2.9,-length/2+28.9+0.6+2.4,-1.3]){
		color("silver")
		cylinder(h=1.3,r1=0.25,r2=0.6);
	}
	translate([-width/2+0.6+2.9,-length/2+28.9+0.6+2.4+2.7,-1.3]){
		color("silver")
		cylinder(h=1.3,r1=0.25,r2=0.6);
	}
	

	//header pins
	for (i=[0:9]){
		translate([-width/2+0.6+7.4+8.4+2.7*i,length/2-0.6-7,-1.3]){
			color("silver")
			cylinder(h=1.3,r1=0.25,r2=0.6);
		}
		translate([-width/2+0.6+7.4+8.4+2.7*i,length/2-0.6-7-2.7,-1.3]){
			color("silver")
			cylinder(h=1.3,r1=0.25,r2=0.6);
		}
	}



}

bb();
