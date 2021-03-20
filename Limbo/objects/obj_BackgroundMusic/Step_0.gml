/// @description ???

if( !audio_is_playing(music[current]))
{
	current++;
	if(current >= array_length_1d(music)) 
	{
		current = 0;
	}
	
	audio_play_sound(music[current], 100, false);
}
