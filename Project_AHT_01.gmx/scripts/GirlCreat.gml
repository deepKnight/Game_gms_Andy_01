m_hp = 3;//生命值
walkspeed = 6;//行走速度控制
image_speed = 0.25;//sprite动画速度控制

m_attachedHitbox = instance_create(x, y, obj_girl_hitbox);
m_attachedHitbox.m_attachedParent = id;

enum PlayerDirection{
    UP,
    DOWN,
    LEFT,
    RIGHT
}
m_playerDirection = PlayerDirection.DOWN;
