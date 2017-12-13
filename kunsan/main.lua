--region *.lua
--Date
--此文件由[BabeLua]插件自动生成
module("kunsan",package.seeall)
function bebe_tostring( ... )
    local num = select("#", ...);
    local args ={...};
    local outs ={};

    for i=1,num do
        if i>1 then
            outs[#outs+1] ="\t"
        end
        outs[#outs+1] =tostring(args[i]);
        
    end
   return table.concat(outs)
end

local babe_print =print;
local babe_output=function(...)
    babe_print(...);
    
    if decoda_output ~=nil then
        local str =babe_tostring(...);
        decoda_output(str);
    end
end

print =babe_output

module("kunsan",package.seeall)
require("common.game")
require("common.include")
reloadModule("game.kunsan.include")

--game.kunsan.main
--创建游戏场景
local function InitGameScene()
    setBtnClickedEff("kunsan/Sound/Special_menu.mp3")
    return kunsan.getClientViewInstance()
end

--结束游戏场景
local function EndGameScene( ... )
    kunsan.getClientViewInstance():readClose()
    return true
end

--游戏版本
GameInfo.GameVersion ="1.0.0"

--游戏名
GameInfo.name ="kunsan"

--初始化场景函数
GameInfo.initfunc = InitGameScene

--结束场景函数
GameInfo.endfunc = EndGameScene

--游戏框架实例
GameInfo.GameViewIns =hsz.getViewIns()

--游戏视图实例
GameInfo.GameFrameIns =kunsan.getDlaInstance()

--endregion