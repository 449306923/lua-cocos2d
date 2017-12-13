--region *.lua
--Date
--此文件由[BabeLua]插件自动生成
module("kunsan",package.seeall)
require("kunsan.cmd")

FLOAT_FONT_HEIGHT       =25   --浮动字高度

IDT_SOUNDMANAGER        =2

--按钮标识
IDC_START               =100  --开始按钮
IDC_TRUSTEE_CONTROL     =104  --托管控制
IDC_PROP                =106
IDC_SETUP               =107
IDC_QUIT                =108  --退出
IDC_RULE                =109
IDC_STOP                =110  --停止
IDC_GAME_SOUND          =111
IDC_BACK_SOUND          =120

--动作标识
IDI_BOMB_EFFECT         =101  --动作标识
IDI_DISC_EFFECT         =102  --丢弃标识
IDI_MOVE_CARD           =103  --移动
IDI_MOVE_REPLACE        =104
IDI_SCORE_EFFECT        =105

--动作数目
BOMB_EFFECT_COUNT       =4    --动作数目
DISC_EFFECT_COUNT       =8    --丢弃效果	

IDT_TIME_ROBOTFRAME     =2500


MOVE_STEP_COUNT         =4    --移动步数
TIME_MOVE_CARD          =25   --牌动画定时时间


USER_BACK_UP_WIDTH      =114  --用户上下面板宽度
USER_BACK_LR_WIDTH      =80   --用户左右面板宽度
USER_BACK_UD_HEIGHT     =61   --用户上下面板高度
USER_BACK_LR_HEIGHT     =88   --用户左右面板高度
BOTTOM_SHADING_WIDTH    =744  --视图下方底纹宽度
BOTTOM_SHADING_HEIGHT   =62   --视图下方底纹高度

WM_USER =0
--消息定义
IDM_OUT_CARD            =(WM_USER+105)    --出牌消息
IDM_TRUSTEE_CONTROL     =(WM_USER+102)    --托管控制
IDM_CARD_OPERATE        =(WM_USER+106)    --玩家操作牌
IDM_USER_ACTION_FINISH  =(WM_USER+107)    --动画结束
IDM_GAME_SOUND          =(WM_USER+108)    --游戏声音
IDM_BACK_SOUND          =(WM_USER+112)    --返回声音
IDM_RIGHT_DOWN          =(WM_USER+113)    --
IDM_MOVE_REPLACE        =(WM_USER+114)
IDM_USER_INFO           =(WM_USER+115)    --用户信息
IDM_USER_INFO_2         =(WM_USER+116)    --用户信息

--声音
IDS_AUTO                ="AUTO"
IDS_CARD_SET            ="CARD_SET"
IDS_DRAW_SICE           ="DRAW_SICE"
IDS_GAME_END            ="GAME_END"
IDS_GAME_LOST           ="GAME_LOST"
IDS_GAME_START          ="GAME_START"
IDS_GAME_WARN           ="GAME_WARN"
IDS_GAME_WIN            ="GAME_WIN"
IDS_NOAUTO              ="NOAUTO"
IDS_OUT_CARD            ="OUT_CARD"
IDS_SEND_CARD           ="SEND_CARD"
--男声
IDS_BOY_C               ="BOY_C"
IDS_BOY_P               ="BOY_P"
IDS_BOY_G               ="BOY_G"
IDS_BOY_T               ="BOY_T"
IDS_BOY_BH_0            ="BOY_BH_0"
IDS_BOY_BH_1            ="BOY_BH_1"
IDS_BOY_H               ="BOY_H"
--女声
IDS_GIRL_C              ="GIRL_C"
IDS_GIRL_P              ="GIRL_P"
IDS_GIRL_G              ="GIRL_G"
IDS_GIRL_T              ="GIRL_T"
IDS_GIRL_BH_0           ="GIRL_BH_0"
IDS_GIRL_BH_1           ="GIRL_BH_1"
IDS_GIRL_H              ="GIRL_H"

--视图位置
MYSELF_VIEW_ID          =2


local static_GameView = nil
local CGameClientView =class("CGameClientView",function function_name()
    return cc.Scene:create()
end)



function getClientViewInstance()()
  if static_GameView ==nil then
     static_GameView = CGameClientView.new()
     static_GameView:setAllPos()
     static_GameView:initUI()
    --  static_GameView:_initEvent()
end


function CGameClientView:loadImage(str,rect)
   if str=nil then
    return nil
   end
   return ccSprite((self._imgPath..str..".png"),rect)
   
end



--定义构造函数
function CGameClientView:ctor()
    self.m_imgpath ="kunsan"
    self._imgPath ="kunsan/"
    self._nTickUpdate =0.1

    self.yytype="fangyan/"
    self._MusicPath ="kunsan/Sound/"
    setWinSize(cc.Director:getInstance():getWinSize())
    getAdaptiveInstance():initDesign(1136,640)
    self.m_dlgInstance =nil
    self.friendRoom = false
    

    --用户信息tag值   一共为11-14
    --用户信息里面包含

    --ntag 1 用户头像
    --ntag 2 用户昵称
    --ntag 3 用户金币
    --ntag 4 用户托管
    --ntag 5 用户准备状态

    self._nTag_Player =100
    self._nTag_Player_ICON =1
    self._nTag_Player_NICK =2
    self._nTag_Player_COIN =3
    self._nTag_Player_ROBBOT = 4
    self._nTag_Player_STATUS = 5
    self._nTag_Player_BANKER = 6   --庄家
    self._nTag_Player_VIP =7 --vip
    self._nTag_Player_DIZHU =20 --用户底注
    self._nTag_Player_RESTCARD =7
    self._nTag_Player_BAOCHUN =8
    self.m_nTag_Chat =40  --40到44

    self.m_iBankerPeople =0
    -- self._pTimer_Center = {}
    self.m_ptReady ={}
    self._nTimerIndex =0

    --------------------
    -----------------------

    self.touxiang_pos ={}  --任务头像位置
    self.warntext_pos ={}  --准备等文字位置
    self.time_pos ={}      --时钟位置
    self.handcard_pos ={}  --手牌位置
    self.deskcard_pos ={}  --出的牌的位置

    self.m_HandCardControl={}  --出的牌
    self.m_UserCardControl={}  --桌上的牌
    
    self._pTimer_Center ={} --时间
    self.m_pPlayerReady ={} --准备
    self.m_iPassPic     ={} --不要
    self.m_playName     ={} --名字
    self.m_iUerStation  ={} --状态
    self.OutsideCardControl ={}
    self.m_headUserId   ={}

    for i=0,GAME_PLAYER -1 do
        self.touxiang_pos[i] =cc.p(0.0)
        self.warntext_pos[i] =cc.p(0,0)
        self.time_pos[i]     =cc.p(0,0)
        self.handcard_pos[i] =cc.p(0,0)
        self.deskcard_pos[i] =cc.p(0,0)

        self._pTimer_Center[i] =nil
        self.m_pPlayerReady[i] =nil
        self.m_iPassPic[i]     =nil
        self.m_playName[i]     =nil
        self.m_iUerStation[i]  =nil

        self.m_HandCardControl[i] ={}  --出的牌
        self.m_UserCardControl[i] ={}  --桌上的牌
        self.OutsideCardControl[i] ={} 

        for j=0,MAX_COUNT-1 do
            self.m_HandCardControl[i][j] =nil
            self.m_UserCardControl[i][j] =nil
            self.OutsideCardControl[i][j] =nil
        end
      self.m_headUserId[i] =0
    end
  --托管
  self.m_bUserTrustee={}
  for wChairIdx=0,GAME_PLAYER-1 do
      self.m_bUserTrustee[wChairIdx] =false
  end

  --底注
  self.m_iBasePoint =0

  --余牌
  self.rest_card ={}
  self.m_iWarningAni ={}
  self.m_pRestNum ={}

  for i=0,GAME_PLAYER-1 do
      self.rest_card[i] =nil
      self.m_iWarningAni[i] =nil
      self.m_pRestNum[i] =nil
  end

  self.friendType =0
  self.warn_layer =nil

  --测试数据
  self.m_cbHandCardData ={}
  for i=0,MAX_COUNT-1 do
      self.m_cbHandCardData[i] =nil
  end

  self.m_bReady ={}
  for i=0,GAME_PLAYER-1 do
      self.m_bReady[i] =nil
  end

  self.gameScoreLayer =nil

  self.banbenTiShi =nil
  self.isHaoYouFang =false

--   self.tionimeSidse =nil
--   self.direction =nil
  self.timeSidse ={}
  self.direction ={}

  for i=0,GAME_PLAYER-1 do
      self.timeSidse[i] =nil
      self.direction[i] =nil

  end

  self.bankPlayer =-1

  self.ChooseOutBtnPos ={}
  self.ChooseBtn ={}
  self.flowerCard ={}
  self.flowerPose ={}
  self.OutsideCardPos ={}

  for i=0,GAME_PLAYER-1 do
      self.ChooseOutBtnPos=cc.p(0,0)
      self.ChooseBtn[i] =nil
      self.flowerCard[i] =nil
      self.flowerPose[i] =cc.p(0,0)
      self.OutsideCardPos=cc.p(0,0)
  end

  --操作按钮
  self.stateArry ={}
  self.chiArry ={}
  self.gangType =0
  self.pengType ={}

  for i=0,GAME_PLAYER-1 do
    self.stateArry[i] =nil
    self.chiArry[i] =nil
    self.gangType[i] =0
    self.pengType[i] =0
  end

  self.outPepoleName ="人员"
  self.isShengQingTuiChu =false
  self.havePlayerApply =false

  self.showlayer =nil
  self.playerLayer =nil
  self.endLayer =nil
  self.runningLog =nil
  self.setRunningLayer =nil

  self.tingHuLayer =nil
  self.bankSp =nil
  self.playerHandSprite ={}
  for i=0,GAME_PLAYER-1 do
      self.playerHandSprite[i] =nil
  end
  self.isGameing =false

  self.card ={}
  for i=0,30 do
     self.card[i] =nil
  end

  self.yuyinlist ={
    "你快点打呀,慢的要命",
    "哎呦,花很多呀",
    "这个手气好的不得了",
    "哎哟,送杠了",
    "手气真差,吃也吃不到,碰也碰不到",
    "讨厌,我要吃的被你碰了"
  }
  
end

--设置所有控件的位置
function CGameClientView:setAllPos()
    local mPosx = getWinSize.width
    local mPosy = getWinSize.height

    --背景
    self.bg_pos =cc.p(mPosx/2,mPosy/2)
end


--设置UI
function CGameClientView:initUI()
    self:setAllPos()

    --背景
    self.sp_bg=ccSprite(self.m_imgpath.."view/zm_bg.png")
    self.sp_bg:setPosition(self.bg_pos)
    self:addChild(self.sp_bg)

    getAdaptiveInstance:boundBGAdaptive(self.sp_bg)
end






