m_hp = 3;//生命值控制
walkspeed = 2;//行走速度控制
image_speed = 0.25;//动画速度控制
skill_f = 80;//技能预算距离

//禁止旋转
phy_fixed_rotation = 1;

//变量，保存巫师是否被挤到墙边
collision = false;

//绑定hitbox
m_attachedHitbox = instance_create(x, y, obj_wizard_hitbox);
m_attachedHitbox.m_attachedParent = id;

//巫师朝向的方向，默认向下
enum WizardDirection{
    UP,
    DOWN,
    LEFT,
    RIGHT
}
m_wizardDirection = WizardDirection.DOWN;

//巫师正在行走
m_isWalking = false;

//巫师正在攻击
m_isAttacking = false;

//巫师正在闪现
m_isFlashing = false;

//时间
m_Time = 0;
m_FlashTime = 0;

