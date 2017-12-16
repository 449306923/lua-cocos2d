--region *.lua
--Date
--此文件由[BabeLua]插件自动生成
module("kunsan",package.seeall)

MASK_CHI_HU_RIGHT = 0x0fffffff

INDEX_REPLACE_CARD    =MAX_INDEX

--逻辑掩码
MASK_COLOR =0xF0     --花色掩码
MASK_VALUE =0x0F     --数值掩码

--动作定义

--动作标志
WIK_NULL    =0x00      --没有类型
WIK_LEFT    =0x01      --左吃类型
WIK_CHENTER =0x02    --中吃类型
WIK_RIGHT   =0x04    --右吃类型
WIK_PENG    =0x08    --碰牌类型
WIK_GANG    =0x10    --杠牌类型
WIK_PEPLACE =0x20    --
WIK_CHI_HU  = 0x40	 --吃胡类型
WIK_LISTEN  = 0x80	 --吃胡类型

--胡牌定义
--点数权位
CHR_PING_HU                 = 0x00000001                                    --屁胡
CHR_PENG_PENG				= 0x00000002									--碰碰胡
CHR_QI_DUI					= 0x00000004									--七对
CHR_QING_YI_SE				= 0x00000008									--清一色
CHR_HUN_YI_SE				= 0x00000010									--混一色
CHR_GANG_KAI				= 0x00000020									--杠开
CHR_QIANG_GANG				= 0x00000040									--抢杠
CHR_DAN_DIAO				= 0x00000080									--单钓
CHR_ZI_MO					= 0x00000100									--自摸
CHR_HUA_QI					= 0x00000200									--花齐
CHR_Q_F_J					= 0x00000400									--全风将	

CalculateFHInfo = class()
function CalculateFHInfo:ctor()
    self.m_huaCount = 0
	self.m_anGang = 0
	self.m_mingGang = 0
	self.m_fengAnGang = 0
	self.m_fengMingGang = 0
	self.m_fengke = 0

	self.m_huaGang = 0
	self.m_duidui = 0
	self.m_hunshe = 0
	self.m_qingse = 0
	self.m_ganghua = 0
	self.m_haidilao = 0
	self.m_dandiao = 0
	self.m_menqing = 0
	self.m_baozi = 0
	self.m_liujv = 0
	self.m_qianggang = 0
    self.m_hupai = 0

    
end