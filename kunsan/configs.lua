--region *.lua
--Date
--此文件由[BabeLua]插件自动生成
module("kunsan",package.seeall)
----
----
SW_HIDE         =false
SW_SHOW         =true
FALSE           =0
NULL            =0

tabmyCARD_ATTR ={width =675/9,height =550/5}

--用户扑克位置
tab_HandCardPos ={
    [0] ={x=getWinSize().width -180,y=410};
    [1] ={x=getWinSize().width -180,y=230};
    [2] ={x=getWinSize().width -180,y=10};
    [3] ={x=180,y=230};
    [4] ={x=180,y=410};
};

--Y排列方式
enYTop =0          --上对齐
enYCenter =1       --中对齐
enYBottom =2       --下对齐

--X排列方式
enXLeft =0         --左对齐
enXCenter=1       --中对齐
enXRight =2        --右对齐

--方向枚举
Direction_East =0   --东
Direction_South =1  --南
Direction_West =2   --西
Direction_North =3  --北

--保存数据的key值
VALUE_SETTED  ="sdsetted"
VALUE_MUSIC   ="sdmusic"
VALUE_EFFECT  ="sdeffect"
VALUE_WAVE    ="sdwave"
VALUE_WRITE   ="sdwrite"
VALUE_PLAYER  ="mplayer"
VALUE_PLAYERSET="playerset"

--endregion