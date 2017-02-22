m_hp = 1;//生命值
walkspeed = 2;//行走速度控制
image_speed = 0.35;//sprite动画速度控制

//下段引用charactor
m_isAttacking = false;
m_fired = false;
m_isDead = false;

m_attachedHitbox = instance_create(x, y, obj_devilfire_hitbox);
m_attachedHitbox.m_attachedParent = id;
