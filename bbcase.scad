use <busblaster.scad>;
use <bowtie.scad>;

$fn=100;

height=2;
bbwidth=56;
bblength=90;
bbheight=1.6;


screw_r=1.6;
screw_offset=2.4;

sidewall=1;


module bottom(){


	difference(){
		translate([(-bbwidth)/2-sidewall,(-bblength)/2-sidewall,0]){
			cube([bbwidth+sidewall*2,bblength+sidewall*2,height]);
		}

		//main pins cutout
		translate([-26.8/2,bblength/2-5.8+1-7,height-1.69]){
			cube([26.8,5.8,1.7]);
		}

		//power jumper cutout
		translate([-bbwidth/2+7.4-1,bblength/2-5.8+1-7,height-1.69]){
			cube([3,5.8,1.7]);
		}

		//mode jumper cutout
		translate([-bbwidth/2+2.9-1,-bblength/2+28.9-1,height-1.69]){
			cube([3,8,1.7]);
		}

		//screw holes
		translate([-bbwidth/2+screw_r+screw_offset,-bblength/2+screw_r+screw_offset,-1]){
			cylinder(h=height+2,r=screw_r);
		}
		translate([bbwidth/2-screw_r-screw_offset,-bblength/2+screw_r+screw_offset,-1]){
			cylinder(h=height+2,r=screw_r);
		}
		translate([-bbwidth/2+screw_r+screw_offset,bblength/2-screw_r-screw_offset,-1]){
			cylinder(h=height+2,r=screw_r);
		}
		translate([bbwidth/2-screw_r-screw_offset,bblength/2-screw_r-screw_offset,-1]){
			cylinder(h=height+2,r=screw_r);
		}


	}
}

module top(){
	upper=6;
	sz=height+.2;
	L=34.2;
	
	difference(){


		//top plate and screw reinforcements
		union(){
			translate([(-bbwidth)/2-sidewall,(-bblength)/2-sidewall,upper+height]){
				cube([bbwidth+sidewall*2,bblength+sidewall*2,height]);
			}

			//screw guides
			translate([-bbwidth/2+screw_r+screw_offset,-bblength/2+screw_r+screw_offset,height+upper-2]){
				cylinder(h=2,r=screw_r+1.8);
			}
			translate([bbwidth/2-screw_r-screw_offset,-bblength/2+screw_r+screw_offset,height+upper-2]){
				cylinder(h=2,r=screw_r+1.8);
			}
			translate([-bbwidth/2+screw_r+screw_offset,bblength/2-screw_r-screw_offset,height+upper-2]){
				cylinder(h=2,r=screw_r+1.8);
			}
			translate([bbwidth/2-screw_r-screw_offset,bblength/2-screw_r-screw_offset,height+upper-2]){
				cylinder(h=2,r=screw_r+1.8);
			}
		}


		translate([0,bblength/2-30,upper+height+bbheight-1.61])
		scale(.2)
		bowtie(6,15);


		//main header
		translate([-33/2-.6,bblength/2-8.6-4.3-.6-2,upper+height-1]){
			cube([34.2,9.8+2,height+2]);
		}
		//viewing triangle for main header lableing
		translate([-33/2-.6,bblength/2-8.6-4.3-.6-2-height,upper+height-.1]){
			polyhedron(points=[
					[0,0,0],
					[0,sz,0],
					[0,sz,sz],
					[L,0,0],
					[L,sz,0],
					[L,sz,sz]
				],
				triangles=[
					[0,1,2],
					[3,5,4],
					[2,5,3],
					[0,2,3],
					[2,4,5],
					[2,1,4],
					[0,3,4],
					[0,4,1]
			]);
		}
		

		//power jumper
		translate([-33/2-2.35-2.3-.6,bblength/2-5-6.2-.6,upper+height-4]){
			cube([2.35+1.2,5+1.2,height+5]);
		}

		//mode jumper
		translate([-bbwidth/2+2.2-.6,-bblength/2+28.3-.6,upper+height-1]){
			cube([2.4+1.2,7.5+1.2,height+2]);
		}

		//screw holes
		translate([-bbwidth/2+screw_r+screw_offset,-bblength/2+screw_r+screw_offset,upper-.1]){
			cylinder(h=height+3,r=screw_r);
		}
		translate([bbwidth/2-screw_r-screw_offset,-bblength/2+screw_r+screw_offset,upper-.1]){
			cylinder(h=height+3,r=screw_r);
		}
		translate([-bbwidth/2+screw_r+screw_offset,bblength/2-screw_r-screw_offset,upper-.1]){
			cylinder(h=height+3,r=screw_r);
		}
		translate([bbwidth/2-screw_r-screw_offset,bblength/2-screw_r-screw_offset,upper-.1]){
			cylinder(h=height+3,r=screw_r);
		}
	}

	//back wall
	translate([-bbwidth/2-sidewall,bblength/2,height]){
		cube([bbwidth+sidewall*2,sidewall,upper]);
	}
	//blank side wall
	translate([-bbwidth/2-sidewall,-bblength/2-sidewall,height]){
		cube([sidewall,bblength+sidewall*2,upper]);
	}

	//USB wall
	difference(){
		translate([-bbwidth/2-sidewall,-bblength/2-sidewall,height]){
			cube([bbwidth+sidewall*2,sidewall,upper]);
		}
		translate([-8.5/2,-bblength/2-sidewall-1,height+bbheight-.5]){
			cube([8.5,sidewall+2,4.5]);
		}
	}


	//LED wall
	difference(){
		translate([bbwidth/2,-bblength/2-sidewall,height]){
			cube([sidewall,bblength+sidewall*2,upper]);
		}
		//power square cutout
		translate([bbwidth/2-1,-bblength/2+13-.6,+height+bbheight]){
			cube([sidewall+2,2.1+1.2,upper-bbheight+.1]);
		}


		//ACT square cutout
		translate([bbwidth/2-1,-bblength/2+32.3-.6,+height+bbheight]){
			cube([sidewall+2,2.1+1.2,upper-bbheight+.1]);
		}
	}
	//power LED reflector
	difference(){
		hull(){
			translate([bbwidth/2-1.25-1.8-.6-.5,-bblength/2+13-.6-0.5,height+bbheight]){
				cube([1.25+1.8+.6+.5,2.1+1.2+1,.1]);
			}
	
			translate([bbwidth/2-sidewall-.5,-bblength/2+13-.6-.5,upper+height]){
				cube([sidewall+.5,2.1+1.2+1,.1]);
			}
		}
		hull(){
			translate([bbwidth/2-1.25-1.8-.5,-bblength/2+13-.6,height+bbheight-.1]){
				cube([1.25+1.8+.6+.5,2.1+1.2,.4]);
			}
			translate([bbwidth/2-sidewall,-bblength/2+13-.6,upper+height+.1]){
				cube([sidewall,2.1+1.2,.1]);
			}
		}
	}


	//ACT LED reflector
	difference(){
		hull(){
			translate([bbwidth/2-1.25-1.8-.6-.5,-bblength/2+32.3-.6-0.5,height+bbheight]){
				cube([1.25+1.8+.6+.5,2.1+1.2+1,.1]);
			}
	
			translate([bbwidth/2-sidewall-.5,-bblength/2+32.3-.6-.5,upper+height]){
				cube([sidewall+.5,2.1+1.2+1,.1]);
			}
		}
		hull(){
			translate([bbwidth/2-1.25-1.8-.5,-bblength/2+32.3-.6,height+bbheight-.1]){
				cube([1.25+1.8+.6+.5,2.1+1.2,.4]);
			}
			translate([bbwidth/2-sidewall,-bblength/2+32.3-.6,upper+height+.1]){
				cube([sidewall,2.1+1.2,.1]);
			}
		}
	}	

	
}

//translate([0,0,height])
//bb();

color("ivory")
bottom();
color("ivory")

rotate(a=[180,0,0])
translate([-bbwidth-sidewall*2-10,0,-10])
top();
