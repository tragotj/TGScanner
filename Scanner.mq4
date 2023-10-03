//+------------------------------------------------------------------+
//|                                                      Scanner.mq4 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#property indicator_separate_window



input string Indicator        = "pricechannel_stop_v1.3";
input double Risk             = 0.30;
input int    ChannelPeriod    = 21;
extern string oooooooo     = " ------ Price Dashboard ------ ";
extern int font_Size       = 12;
extern int X_Distance      = 90;
extern int Y_Distance      = 30;
input string font_name     = "Berlin Sans FB";
input color font_Color     = Gold;

int timeframe[]     = {PERIOD_M1,PERIOD_M5,PERIOD_M15,PERIOD_M30,PERIOD_H1,PERIOD_H4,PERIOD_D1,PERIOD_W1,PERIOD_MN1 }; 
string timename[]   = { "M1","M5","M15","M30","H1","H4","D1","WN","MN" };

string  symbol = Symbol();
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping

//--- indicator  mapping
   IndicatorShortName("TopGear Scanner");
    
 
   int win_idx = WindowFind("TopGear Scanner");             // Checking Windows 
   int count   = ArraySize(timeframe);
   
   // Creating Table in Separate window
   for(int x=0;x<count;x++)
      for(int y=0;y<3;y++)
      {
         ObjectCreate("ob"+x+y,OBJ_LABEL,win_idx,0,0,0,0);
         ObjectSet("ob"+x+y,OBJPROP_XDISTANCE,x*(X_Distance+font_Size)+10);
         
               
         // adding a horizontal indent 12 pixels
         ObjectSet("ob"+x+y,OBJPROP_YDISTANCE,y*(Y_Distance+font_Size)+20);
         // adding a vertical indent 20 pixels
         //ObjectSetText("ob"+x+y,"Today",12,"Arial",Gold);
         
       
         
      }
  
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---
   int count   = ArraySize(timeframe);
   
   
  /* double upTrend       = UpTrend(_Symbol,_Period);
   double dnTrend     = DnTrend(_Symbol,_Period);
   
   double dnsingnal     = DnSignal(_Symbol,_Period);
   //Comment( "\n", "\n", "\n","UP: ",upTrend,"    Signal : ",upsignal, "\n", "DN: ",dnTrend, "    Signal : ",dnsingnal);
   
   */
   
 /*  // SL Price     
   for(int x=0;x<count;x++)
      for(int y=0;y<4;y++){
      double signal ;
      double SL ;
      string name = timeframe[x];
      double upTrend       = UpTrend(_Symbol,x);
      if(upTrend > 5000)  { // means down trend
          signal   = DnSignal(_Symbol,x);
          SL       = (dnTrend - signal )*10;
          }
      else { signal = UpSignal(_Symbol,x); 
             SL     = (upTrend - signal )*10;
           }
     
      ObjectSetText("ob"+x+y,signal,font_Size-1,"Arial",font_Color);    
   
   
   }
   
   
   // Open Price     
   for(int x=0;x<count;x++)
      for(int y=0;y<3;y++){
      double signal ;
      int name = timeframe[x];
      double upTrend       = NormalizeDouble( UpTrend(symbol,x),Digits);
      double dnTrend       = NormalizeDouble( DnTrend(symbol,x), Digits);
      
      signal = upTrend > 5000? dnTrend:upTrend;
     
      ObjectSetText("ob"+x+y,signal,font_Size-1,"Arial",font_Color);    
      signal = -1;
   
   }
   
    // Signals     
   for(int x=0;x<count;x++)
      for(int y=0;y<2;y++){
      int name = timeframe[x];
      double upTrend       = NormalizeDouble( UpTrend(symbol,x),Digits);
      double dnTrend       = NormalizeDouble( DnTrend(symbol,x), Digits);
      string trend;
      
      if ( upTrend < 5000 ) trend = "Buy";
      if ( dnTrend < 5000 ) trend = "Sell";
      
      ObjectSetText("ob"+x+y,trend,font_Size-1,"Arial",font_Color);    
   
   
   } */
   
  // Headers     
   for(int x=0;x<count;x++)
      for(int y=0;y<1;y++){
      string name = timename[x];
      ObjectSetText("ob"+x+y,name,font_Size-1,font_name,font_Color);
      
   
   
   }
   
   
   // M1
   double BTrend_M1 = NormalizeDouble ( UpTrend(symbol,PERIOD_M1),Digits ); 
   double STrend_M1 = NormalizeDouble ( DnTrend(symbol,PERIOD_M1),Digits );
   string Price_M1  = ( BTrend_M1 >5000 )? "Sell":"Buy";
   ObjectSetText("ob01", Price_M1,font_Size-1,font_name,font_Color);
   
   double SL_M1     = ( BTrend_M1 >5000 )? STrend_M1:BTrend_M1;
   ObjectSetText("ob02", SL_M1,font_Size-1,font_name,font_Color);
   
   // M5
   double BTrend_M5 = NormalizeDouble ( UpTrend(symbol,PERIOD_M5),Digits ); 
   double STrend_M5 = NormalizeDouble ( DnTrend(symbol,PERIOD_M5),Digits );
   string Price_M5  = ( BTrend_M5 >5000 )? "Sell":"Buy";
   ObjectSetText("ob11", Price_M5,font_Size-1,font_name,font_Color);
   
   double SL_M5     = ( BTrend_M5 >5000 )? STrend_M5:BTrend_M5;
   ObjectSetText("ob12", SL_M5,font_Size-1,font_name,font_Color);
   
   // M15
   double BTrend_M15 = NormalizeDouble ( UpTrend(symbol,PERIOD_M15),Digits ); 
   double STrend_M15 = NormalizeDouble ( DnTrend(symbol,PERIOD_M15),Digits );
   string Price_M15  = ( BTrend_M15 >5000 )? "Sell":"Buy";
   ObjectSetText("ob21", Price_M15,font_Size-1,font_name,font_Color);
   
   double SL_M15     = ( BTrend_M15 >5000 )? STrend_M15:BTrend_M15;
   ObjectSetText("ob22", SL_M15,font_Size-1,font_name,font_Color);
   
   // M30
   double BTrend_M30 = NormalizeDouble ( UpTrend(symbol,PERIOD_M30),Digits ); 
   double STrend_M30 = NormalizeDouble ( DnTrend(symbol,PERIOD_M30),Digits );
   string Price_M30  = ( BTrend_M30 >5000 )? "Sell":"Buy";
   ObjectSetText("ob31", Price_M30,font_Size-1,font_name,font_Color);
   
   double SL_M30     = ( BTrend_M30 >5000 )? STrend_M30:BTrend_M30;
   ObjectSetText("ob32", SL_M30,font_Size-1,"Arial",font_Color);
   
   // H1
   double BTrend_H1 = NormalizeDouble ( UpTrend(symbol,PERIOD_H1),Digits ); 
   double STrend_H1 = NormalizeDouble ( DnTrend(symbol,PERIOD_H1),Digits );
   string Price_H1  = ( BTrend_H1 >5000 )? "Sell":"Buy";
   ObjectSetText("ob41", Price_H1,font_Size-1,font_name,font_Color);
   
   double SL_H1     = ( BTrend_H1 >5000 )? STrend_H1:BTrend_H1;
   ObjectSetText("ob42", SL_H1,font_Size-1,font_name,font_Color);
   
   // H4
   double BTrend_H4 = NormalizeDouble ( UpTrend(symbol,PERIOD_H4),Digits ); 
   double STrend_H4 = NormalizeDouble ( DnTrend(symbol,PERIOD_H4),Digits );
   string Price_H4  = ( BTrend_H4 >5000 )? "Sell":"Buy";
   ObjectSetText("ob51", Price_H4,font_Size-1,font_name,font_Color);
   
   double SL_H4     = ( BTrend_H4 >5000 )? STrend_H4:BTrend_H4;
   ObjectSetText("ob52", SL_H4,font_Size-1,font_name,font_Color);
   
   // D1
   double BTrend_D1 = NormalizeDouble ( UpTrend(symbol,PERIOD_D1),Digits ); 
   double STrend_D1 = NormalizeDouble ( DnTrend(symbol,PERIOD_D1),Digits );
   string Price_D1  = ( BTrend_D1 >5000 )? "Sell":"Buy";
   ObjectSetText("ob61", Price_D1,font_Size-1,font_name,font_Color);
   
   double SL_D1     = ( BTrend_D1 >5000 )? STrend_D1:BTrend_D1;
   ObjectSetText("ob62", SL_D1,font_Size-1,font_name,font_Color);
   
   // W1
   double BTrend_W1 = NormalizeDouble ( UpTrend(symbol,PERIOD_W1),Digits ); 
   double STrend_W1 = NormalizeDouble ( DnTrend(symbol,PERIOD_W1),Digits );
   string Price_W1  = ( BTrend_W1 >5000 )? "Sell":"Buy";
   ObjectSetText("ob71", Price_W1,font_Size-1,font_name,font_Color);
   
   double SL_W1     = ( BTrend_W1 >5000 )? STrend_W1:BTrend_W1;
   ObjectSetText("ob72", SL_W1,font_Size-1,font_name,font_Color);
   
   // MN1
   double BTrend_MN1 = NormalizeDouble ( UpTrend(symbol,PERIOD_MN1),Digits ); 
   double STrend_MN1 = NormalizeDouble ( DnTrend(symbol,PERIOD_MN1),Digits );
   string Price_MN1  = ( BTrend_MN1 >5000 )? "Sell":"Buy";
   ObjectSetText("ob81", Price_MN1,font_Size-1,font_name,font_Color);
   
   double SL_MN1     = ( BTrend_MN1 >5000 )? STrend_MN1:BTrend_MN1;
   ObjectSetText("ob82", SL_MN1,font_Size-1,font_name,font_Color);
   
   
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+


double UpTrend(string symbol, int timeframe  ) {
      
      double uptrend = iCustom(symbol,timeframe, Indicator,ChannelPeriod,0,0);
         
         
      return(uptrend);
}

double DnTrend(string symbol, int timeframe  ) {
      
      double dntrend = iCustom(symbol,timeframe, Indicator,ChannelPeriod,1,0);
         
         
      return(dntrend);
}
double UpSignal(string symbol, int timeframe  ) {
      
      double UpSignal = iCustom(symbol,timeframe, Indicator,ChannelPeriod,2,1);
         
         
      return(UpSignal);
}

double DnSignal(string symbol, int timeframe  ) {
      
      double DnSignal = iCustom(symbol,timeframe, Indicator,ChannelPeriod,3,1);
         
         
      return(DnSignal);
}


//+------------------------------------------------------------------+
int deinit()
  {
 
   for(int x=0;x<11;x++)
      for(int y=0;y<4;y++)
      {
         ObjectDelete("ob"+x+y);
         
      }
 
   
//----

   return(0);
   
   
  }