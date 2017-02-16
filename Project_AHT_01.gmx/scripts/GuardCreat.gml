phy_fixed_rotation = 1;
m_isAttacking = false;
m_fired = false;
m_hp = 2;//生命值
m_isDead = false;
m_attachedHitbox = instance_create(x, y, obj_guard_hitbox);
m_attachedHitbox.m_attachedParent = id;
/*
enum PlayerDirection{
    UP,
    DOWN,
    LEFT,
    RIGHT
}
m_playerDirection = PlayerDirection.DOWN;
*/
