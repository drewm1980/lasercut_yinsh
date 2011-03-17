unitsize(1inch);
real paperwidth=24inches;
real paperheight=24inches;
size(paperwidth,paperheight,IgnoreAspect);

// You might need to adjust this for your laser cutter
pen cutpen = black+linewidth(.001inches);

// This code is based on an up, downright coordinate system centered at a1.
// (a1 is actually just off the lower-left corner of the board; not a legal position)
pair dr = rotate(60)*down;
pair a1 = (0,0); // also one corner of the bounding hexagon

// We first define the board edge points, going clockwise around the board.

// Funny inner corner 
pair b2 = 1*dr + 1*up;

// Bottom-left edge
pair b1 = 1*dr + 0*up; 
pair c1 = 2*dr + 0*up;
pair d1 = 3*dr + 0*up;
pair e1 = 4*dr + 0*up;

// Funny inner corner
pair f2 = 5*dr + 1*up; 
 
// Bottom-right edge
pair g2 = 6*dr + 1*up;
pair h3 = 7*dr + 2*up;
pair i4 = 8*dr + 3*up;
pair j5 = 9*dr + 4*up;

// Funny inner corner
pair j6 = 9*dr + 5*up;

// Right edge of the board
pair k7 = 10*dr + 6*up;
pair k8 = 10*dr + 7*up;
pair k9 = 10*dr + 8*up;
pair k10 = 10*dr + 9*up;

// Funny inner corner
pair j10 = 9*dr + 9*up;
 
// Top-right edge
pair j11 = 9*dr + 10*up;
pair i11 = 8*dr + 10*up;
pair h11 = 7*dr + 10*up;
pair g11 = 6*dr + 10*up;

// Funny inner corner
pair f10 = 5*dr + 9*up;

// Top-left edge
pair e10 = 4*dr + 9*up;
pair d9 = 3*dr + 8*up;
pair c8 = 2*dr + 7*up;
pair b7 = 1*dr + 6*up;

// Funny inner corner
pair b6 = 1*dr + 5*up;

// Left edge
pair a5 = 0*dr + 4*up;
pair a4 = 0*dr + 3*up;
pair a3 = 0*dr + 2*up;
pair a2 = 0*dr + 1*up;

// Print the outer edge as dots as a sanity check
if(true){
	dot(b2);
	dot(b1);
	dot(c1);
	dot(d1);
	dot(e1);
	dot(f2);
	dot(g2);
	dot(h3);
	dot(i4);
	dot(j5);
	dot(j6);
	dot(k7);
	dot(k8);
	dot(k9);
	dot(k10);
	dot(j10);
	dot(j11);
	dot(i11);
	dot(h11);
	dot(g11);
	dot(f10);
	dot(e10);
	dot(d9);
	dot(c8);
	dot(b7);
	dot(b6);
	dot(a5);
	dot(a4);
	dot(a3);
	dot(a2);
}

// Define the vertical lines
pair ext = 0.15*up;  // extension vector
path[] uplines = a2-ext -- a5+ext
				^^b1-ext -- b7+ext
				^^c1-ext -- c8+ext
				^^d1-ext -- d9+ext
				^^e1-ext -- e10+ext
				^^f2-ext -- f10+ext
				^^g2-ext -- g11+ext
				^^h3-ext -- h11+ext
				^^i4-ext -- i11+ext
				^^j5-ext -- j11+ext
				^^k7-ext -- k10+ext;

// Define the other lines by rotation about the board center.
pair boardcenter = f2 + 4*up;
path[] uprightlines = rotate(-60, boardcenter)*uplines;
path[] upleftlines = rotate(60, boardcenter)*uplines;

draw(uplines);
draw(uprightlines);
draw(upleftlines);

