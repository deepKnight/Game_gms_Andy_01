var walkspeed = 2;//行走速度控制
image_speed = 0.35;//sprite动画速度控制

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
        image_xscale = -1;
    }
    else if(deltaX < 0){
        image_xscale = 1;
    }
    sprite_index = spr_guard_walk_L_UP;

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




