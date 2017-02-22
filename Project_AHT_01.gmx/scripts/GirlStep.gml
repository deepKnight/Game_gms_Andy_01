if(m_isDead)
    return 0;
    
if(m_hp == 0){
    m_isDead = true;
    sprite_index = spr_girl_die;
    return 0;
}

if(m_isAttacking == false)
{
if(keyboard_check(ord('J'))){
  audio_play_sound(s_girl_attack1, 2, false);
  audio_play_sound(s_girl_attack2, 2, false);

  m_isAttacking = true;
  switch(m_playerDirection)
  {
  case PlayerDirection.UP:
    sprite_index = spr_girl_attack_back;
    image_speed = 0.4;
    break;
  case PlayerDirection.DOWN:
    sprite_index = spr_girl_attack_front;
    image_speed = 0.4;
    break;
  case PlayerDirection.LEFT:
    sprite_index = spr_girl_attack_side;
    image_speed = 0.4;
    break;
  case PlayerDirection.RIGHT:
    sprite_index = spr_girl_attack_side;
    image_speed = 0.4;
    break;
  }
  image_index = 0;
  m_fired = false;
  image_speed = 0.25;
}

else if(keyboard_check(ord('A')))
{
    phy_position_x = phy_position_x - walkspeed;
    sprite_index = spr_girl_walk_side;
    image_xscale = 1;
    m_playerDirection = PlayerDirection.LEFT;
    GirlWalkSound();
}
else if(keyboard_check(ord('D')))
{
    phy_position_x = phy_position_x + walkspeed;
    sprite_index = spr_girl_walk_side;
    image_xscale = -1;
    m_playerDirection = PlayerDirection.RIGHT;
    GirlWalkSound();
}
else if(keyboard_check(ord('W')))
{
    phy_position_y = phy_position_y - walkspeed;
    sprite_index = spr_girl_walk_back;
    m_playerDirection = PlayerDirection.UP;
    GirlWalkSound();
}

else if(keyboard_check(ord('S')))
{
    phy_position_y = phy_position_y + walkspeed;
    sprite_index = spr_girl_walk_front;
    m_playerDirection = PlayerDirection.DOWN    ;
    GirlWalkSound();
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

//防止女孩走出房间
if(phy_position_x < 0)
    phy_position_x = 0;
if(phy_position_y < 0)
    phy_position_y = 0;
if(phy_position_x > room_width)
    phy_position_x = room_width;
if(phy_position_y > room_height)
    phy_position_y = room_height;

