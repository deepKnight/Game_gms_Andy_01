#define WizardCreate
//禁止旋转
phy_fixed_rotation = 1;

//巫师朝向的方向
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

