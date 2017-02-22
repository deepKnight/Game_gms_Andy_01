current_health = instance_find(obj_health, 0);
if(current_health.current_health > 2 || current_health.current_health < 1)
{
    if(audio_is_playing(s_heartbit))
        audio_stop_sound(s_heartbit);
    if(audio_is_playing(s_heartbitfast))
        audio_stop_sound(s_heartbitfast);
}
else if(current_health.current_health = 2)
{
    if(audio_is_playing(s_heartbitfast))
        audio_stop_sound(s_heartbitfast);
    if(!audio_is_playing(s_heartbit))
        audio_play_sound(s_heartbit, 1, true);
}
else if(current_health.current_health = 1)
{
    if(audio_is_playing(s_heartbit))
        audio_stop_sound(s_heartbit);
    if(!audio_is_playing(s_heartbitfast))
        audio_play_sound(s_heartbitfast, 1, true);
}
