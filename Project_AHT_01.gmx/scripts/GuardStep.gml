if(m_isDead)
    return 0;
    
if(m_hp == 0){
    m_isDead = true;
    sprite_index = spr_guard_die;
    return 0;
}

if(m_isAttacking == false)
{
    var player = instance_find(obj_girl, 0);
    var deltaX = player.x - x;
    var deltaY = player.y - y;
    var mySpeed = walkspeed;
    if(deltaX > mySpeed){
        phy_position_x += mySpeed;
        sprite_index = spr_guard_walk_L_UP;
    }
    else if(deltaX < -mySpeed){
        phy_position_x -= mySpeed;
        sprite_index = spr_guard_walk_R_D;
    }
    else{
        phy_position_x += deltaX;
    }
    
    if(deltaY > mySpeed){
        phy_position_y += mySpeed;
    }
    else if(deltaY < -mySpeed){
        phy_position_y -= mySpeed;
    }
    else{
        phy_position_y += deltaY;
    }
    if(deltaX > 0){
        sprite_index = spr_guard_walk_R_D;
    }
    else if(deltaX < 0){
        sprite_index = spr_guard_walk_L_UP;
    }

}


if(sprite_index == spr_guard_attack_L_UP
|| sprite_index == spr_guard_attack_R_D){
    if(image_index > 2 && m_fired == false){
        var Bullet = instance_create(x, y, obj_girl_attack_bullet);
        var deltaX = 0;
        var deltaY = 0;
        switch(m_playerDirection){
        case PlayerDirection.UP:
          Bullet.m_speedY = -15;
          Bullet.image_angle = 270;
          deltaY = -95;
          break;
        case PlayerDirection.DOWN:
          Bullet.m_speedY = 15;
          Bullet.image_angle = 90;
          deltaY = 15;
          break;
        case PlayerDirection.LEFT:
          Bullet.m_speedX = -15;
          deltaX = -50;
          deltaY = -35;
          break;
        case PlayerDirection.RIGHT:
          Bullet.m_speedX = 15;
          Bullet.image_angle = 180;
          deltaX = 50;
          deltaY = -35;
          break;
        } 
        Bullet.x += deltaX;
        Bullet.y += deltaY;
        m_fired = true;
    }
}

//距离Player 1000像素以内时，守卫走动时使地面震动,越近越震动剧烈
distance = sqrt(power(player.phy_position_x - phy_position_x, 2) + power(player.phy_position_y - phy_position_y, 2));
if((sprite_index == spr_guard_walk_L_UP || sprite_index == spr_guard_walk_R_D) 
        && image_index >= 3 && image_index <= 3.5)
{
    if(distance <= 2000 && distance >800)
    {
        view_yview[0] += 3;
    }
    else if(distance <= 800 && distance >600)
    {
        view_yview[0] += 4;
    }
    else if(distance <= 600 && distance >400)
    {
        view_yview[0] += 6;
    }
    else if(distance <= 400 && distance >200)
    {
        view_yview[0] += 8;
    }
    else if(distance <= 200)
    {
        view_yview[0] += 11;
    }
}

//防止守卫走出房间
if(phy_position_x < 0)
    phy_position_x = 0;
if(phy_position_y < 0)
    phy_position_y = 0;
if(phy_position_x > room_width)
    phy_position_x = room_width;
if(phy_position_y > room_height)
    phy_position_y = room_height;



