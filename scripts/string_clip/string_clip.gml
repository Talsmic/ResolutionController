///string_clip(input,max_length,[clip_note]);
/*
	>Returns {string}: Clipped [input]
*/
/// @arg input			{string}
/// @arg max_length		{integer}
/// @arg [clip_note]	{string}
var input = string(argument[0]);
var output = argument[0];
var max_length = argument[1];
var clip_note = "..";	if ( argument_count > 2 ) { clip_note = argument[2] };

if ( string_width(input) > max_length ) { 
	output += clip_note;
	while ( string_width(output) > max_length ) {
		output = string_delete(output,string_length(output)-string_length(clip_note),1+string_length(clip_note))+clip_note;
		};
		
	};
	
return output;