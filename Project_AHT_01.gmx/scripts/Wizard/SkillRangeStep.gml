#define SkillRangeStep
image_angle += 1;
if(image_xscale < 1)
    {
    image_xscale += 4/30.0;
    image_yscale += 4/30.0;
    }

//������Χָʾ�� �ļ�ʱ��
m_Time += 1/30.0;
if(m_Time >= 10)
    m_Time = 0;

