--region *.lua
--Date
--此文件由[BabeLua]插件自动生成
module("kunsan",package.seeall)

KIND_ID    =55                --游戏ID

GAME_PLAYER     =4            --游戏人数
GAME_NAME       ="四川麻将"    --游戏名字
GAME_GENRE      =(GAME_CENRE_SCORE or GAME_CENRE_MATCH or GAME_GENRE_GOLD)  --游戏类型

--游戏状态
GS_MJ_FREE   =gamelib.GS_FREE   --空闲状态
GS_MJ_PLAY   =gamelib.GS_PLAYING+1 --游戏状态


--常量定义 
MAX_WEAVE             =4         --最大组合
MAX_INDEX             =27        --最大索引
MAX_COUNT             =14        --最大数目
MAX_REPERTORY         =118       --最大库存

