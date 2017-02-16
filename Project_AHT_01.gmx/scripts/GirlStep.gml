var walkspeed = 4;//行走速度控制
image_speed = 0.25;//sprite动画速度控制

if(m_isAttacking == false)
{
if(keyboard_check(ord('J'))){
  m_isAttacking = true;
  switch(m_playerDirection)
  {
  case PlayerDirection.UP:
    sprite_index = spr_girl_attack_back;
    break;
  case PlayerDirection.DOWN:
    sprite_index = spr_girl_attack_front;
    break;
  case PlayerDirection.LEFT:
    sprite_index = spr_girl_attack_side;
    break;
  case PlayerDirection.RIGHT:
    sprite_index = spr_girl_attack_side;
    break;
  }
  image_index = 0;
  m_fired = false;
}

else if(keyboard_check(ord('A')))
{
    phy_position_x = phy_position_x - walkspeed;
    sprite_index = spr_girl_walk_side;
    image_xscale = 1;
    m_playerDirection = PlayerDirection.LEFT;
}
else if(keyboard_check(ord('D')))
{
    phy_position_x = phy_position_x + walkspeed;
    sprite_index = spr_girl_walk_side;
    image_xscale = -1;
    m_playerDirection = PlayerDirection.RIGHT;
}
else if(keyboard_check(ord('W')))
{
    phy_position_y = phy_position_y - walkspeed;
    sprite_index = spr_girl_walk_back;
    m_playerDirection = PlayerDirection.UP;
}

else if(keyboard_check(ord('S')))
{
    phy_position_y = phy_position_y + walkspeed;
    sprite_index = spr_girl_walk_front;
    m_playerDirection = PlayerDirection.DOWN    ;
}
else
{
    sprite_index = spr_girl_stand;
}
}
if(sprite_index == spr_girl_attack_side
|| sprite_index == spr_girl_attack_front
|| sprite_index == spr_girl_attack_back){
    if(image_index > 2 && m_fired == false){
        var Bullet = instance_create(phy_position_x, phy_position_y, obj_girl_attack_bullet);
        var deltaX = 0;
        var deltaY = 0;
        switch(m_playerDirection){
        case PlayerDirection.UP:
          Bullet.m_speedY = -15;
          deltaY = -95;
          Bullet.phy_rotation = 90;
          break;
        case PlayerDirection.DOWN:
          Bullet.m_speedY = 15;
          deltaY = 15;
          Bullet.phy_rotation = 270;
          break;
        case PlayerDirection.LEFT:
          Bullet.m_speedX = -15;
          deltaX = -50;
          deltaY = -35;
          break;
        case PlayerDirection.RIGHT:
          Bullet.m_speedX = 15;
          deltaX = 50;
          deltaY = -35;
          Bullet.phy_rotation = 180;
          break;
        } 
        Bullet.phy_position_x += deltaX;
        Bullet.phy_position_y += deltaY;
        m_fired = true;
    }
}


