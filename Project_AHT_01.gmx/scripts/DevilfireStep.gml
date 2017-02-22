var player = instance_find(obj_girl, 0);
distance = sqrt(power(player.phy_position_x - x, 2) + power(player.phy_position_y - y, 2));

if(m_isDead)
    return 0;
    
if(m_hp == 0){
    m_isDead = true;
    instance_destroy();//不一定写在这里
    return 0;
}

if(distance < 1000)
{
    var deltaX = player.x - x;
    var deltaY = player.y - y;
    var mySpeed = walkspeed;
    if(deltaX > mySpeed){
        x += mySpeed;
        sprite_index = spr_devilfire_all;
    }
    else if(deltaX < -mySpeed){
        x -= mySpeed;
        sprite_index = spr_devilfire_all;
    }
    else{
        x += deltaX;
    }
    
    if(deltaY > mySpeed){
        y += mySpeed;
    }
    else if(deltaY < -mySpeed){
        y -= mySpeed;
    }
    else{
        y += deltaY;
    }
    if(deltaX > 0){
        sprite_index = spr_devilfire_all;
    }
    else if(deltaX < 0){
        sprite_index = spr_devilfire_all;
    }
}



//防止守卫走出房间
if(x < 0)
    x = 0;
if(y < 0)
    y = 0;
if(x > room_width)
    x = room_width;
if(y > room_height)
    y = room_height;



