--region *.lua
--Date
--此文件由[BabeLua]插件自动生成
module("kunsan",package.seeall)

--游戏定时器
IDI_START_GAME   =200       --开始定时器
IDI_OPERATE_CARD =201       --操作定时器
IDI_REPLACE_CARD =301       --补牌定时器
IDI_NEXT_CARD    =303       

IDI_OPERATE_UCARD =321
IDI_GAMEENDDALAYT =404

--游戏定时器
TIME_START_GAME    =20      --开始定时器
TIME_OPERATE_CARD  =10      --操作定时器
TIME_REPLACTE_CARD =1000    --补牌定时器

IDI_SHOW_YU_YIN    =388     --语音
IDI_PLAY_TOUZIANIM =555     --动画 播放
IDI_STARTSEND_CARD =556     --进入发牌
IDI_SEND_ALLCARD   =557     --发牌

MAX_TIME_OUT  =3
IDI_TEST   =400  --测试

GAME_SCENE_FREE  =gamelib.GS_FREE    --等待开始
GAME_SCENE_PLAY  =gamelib.GS_PLAYING --游戏进行
GAME_SCENE_END   =gamelib.GS_PLAYING+2 --游戏结束
INVALID_CHAIR    =gamelib.INVALID_CHAIR

local static_gameClientDlg = nil
local CGameClientDlg =class("CGameClientDlg")

function getDlgInstance()
    if static_gameClientDlg ==nil then
        static_gameClientDlg =CGameClientDlg.new()
    end
    return static_gameClientDlg
end

function CGameClientDlg:ctor(_mm)
    cclog("初始化...CGameClientDlg")
    -- self.m_GameLogic =kunsan.createLogic()
    self.m_GameClientView =kunsan.getClientViewInstance()
    --游戏变量
    self.m_GameClientView.m_dlgInstance=self
    --辅助变量
    self._MusicPath ="kunsan/Sound/"
    self.baoshu =nil

    --搜索变量
    self.m_cbSearchResultIndex=0

end

--创建函数    
function CGameClientDlg:OnInitGameEngine()
    -- 控件变量
    self.m_GameClientView = kunsan.getClientViewInstance()
    self:ResetGameFrame()
end

--清空ClientDlg
function clearInstance()
    static_gameClientDlg = nil
end

