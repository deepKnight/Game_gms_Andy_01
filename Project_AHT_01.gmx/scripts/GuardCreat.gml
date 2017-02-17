m_hp = 4;//生命值
walkspeed = 2;//行走速度控制
image_speed = 0.35;//sprite动画速度控制

m_attachedHitbox = instance_create(x, y, obj_guard_hitbox);
m_attachedHitbox.m_attachedParent = id;

