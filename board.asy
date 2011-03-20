unitsize(1mm);

real trianglesidelength = 138.0/3;
transform s = scale(trianglesidelength);
real extensionlength = 5.76;
real extensionfraction = extensionlength/trianglesidelength;

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

// Define the vertical lines
pair ext = extensionfraction*up;  // extension vector
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

// Define a hexagonal boundary for the board
pair hoc = a1-(dr+up); // Hexagon outer corner
path[] hexagon = hoc
				--rotate(60,boardcenter)*hoc
				--rotate(2*60,boardcenter)*hoc
				--rotate(3*60,boardcenter)*hoc
				--rotate(4*60,boardcenter)*hoc
				--rotate(5*60,boardcenter)*hoc
			--cycle;	

// Draw the outer edge as dots 
if(true){
	dot(s*b2);
	dot(s*b1);
	dot(s*c1);
	dot(s*d1);
	dot(s*e1);
	dot(s*f2);
	dot(s*g2);
	dot(s*h3);
	dot(s*i4);
	dot(s*j5);
	dot(s*j6);
	dot(s*k7);
	dot(s*k8);
	dot(s*k9);
	dot(s*k10);
	dot(s*j10);
	dot(s*j11);
	dot(s*i11);
	dot(s*h11);
	dot(s*g11);
	dot(s*f10);
	dot(s*e10);
	dot(s*d9);
	dot(s*c8);
	dot(s*b7);
	dot(s*b6);
	dot(s*a5);
	dot(s*a4);
	dot(s*a3);
	dot(s*a2);
}

// Draw the lines
draw(s*hexagon);
draw(s*uplines);
draw(s*uprightlines);
draw(s*upleftlines);

