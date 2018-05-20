//Check Keypress
var MoveLeft =	keyboard_check( ord("A") );
var MoveRight = keyboard_check( ord("D") );
var MoveUp =	keyboard_check( ord("W") );
var MoveDown =	keyboard_check( ord("S") );

//Move
if ( MoveLeft )		{	x -= MovementSpeed; image_angle = 90;	};
if ( MoveRight )	{	x += MovementSpeed; image_angle = 270;	};
if ( MoveUp )		{	y -= MovementSpeed; image_angle = 0;	};
if ( MoveDown )		{	y += MovementSpeed; image_angle = 180;	};

//Snap
if ( x < 16 ) { x = 16 };
if ( x > room_width - 16 ) { x = room_width - 16 };
if ( y < 16 ) { y = 16 };
if ( y > room_height - 16 ) { y = room_height - 16 };