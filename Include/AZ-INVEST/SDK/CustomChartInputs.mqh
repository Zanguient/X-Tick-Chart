#property copyright "Copyright 2018-2020, Level Up Software"
#property link      "http://www.az-invest.eu"

#ifdef SHOW_INDICATOR_INPUTS
         
   #ifdef USE_CUSTOM_SYMBOL
   
      #ifdef MQL5_MARKET_DEMO
         string                     customChartName = "";                        // Override default custom chart name with
      #else
         input string               customChartName = "";                        // Override default custom chart name with
      #endif // MQL5_MARKET_DEMO
   
      input string               applyTemplate = "default";                      // Apply template to custom chart
   
   #endif // USE_CUSTOM_SYMBOL
      
   #ifndef USE_CUSTOM_SYMBOL        
       
      #ifdef AMP_VERSION  
         input string                  TradingSessionTime = "14:30-23:00";       // Trading session time
         input double                  TopBottomPaddingPercentage = 0.30;        // Use padding top/bottom (0.0 - 1.0)
      #else
         input string                  TradingSessionTime = "00:00-00:00";       // Trading session time
      #endif
         input ENUM_PIVOT_POINTS       showPivots = ppNone;                      // Show pivot levels
         input ENUM_PIVOT_TYPE         pivotPointCalculationType = ppHLC3;       // Pivot point calculation method
         input color                   RColor = clrDodgerBlue;                   // Resistance line color
         input color                   PColor = clrGold;                         // Pivot line color
         input color                   SColor = clrFireBrick;                    // Support line color   
         input color                   PDHColor = clrHotPink;                    // Previous day's high
         input color                   PDLColor = clrLightSkyBlue;               // Previous day's low
         input color                   PDCColor = clrGainsboro;                  // Previous day's close
               ENUM_BOOL               showNextBarLevels = false;                // Show current bar's close projections
               color                   HighThresholdIndicatorColor = clrLime;    // Bullish bar projection color
               color                   LowThresholdIndicatorColor = clrRed;      // Bearish bar projection color
               color                   InfoTextColor = clrNONE;                  // Current bar's open time info color
         
      #ifdef AMP_VERSION  

         input ENUM_BOOL               showCurrentBarOpenTime = true;            // Display chart info

         input ENUM_BOOL               NewBarAlert = false;                      // Alert on new a bar
         input ENUM_BOOL               ReversalBarAlert = false;                 // Alert on reversal bar
         input ENUM_BOOL               MaCrossAlert = false;                     // Alert on MA crossover
         input ENUM_BOOL               UseAlertWindow = false;                   // Display alert in Alert Window
         input ENUM_BOOL               UseSound = false;                         // Play sound on alert
         input ENUM_BOOL               UsePushNotifications = false;             // Send alert via push notification to a smartphone
         input string                  SoundFileBull = "news.wav";               // Use sound file for bullish alert
         input string                  SoundFileBear = "timeout.wav";            // Use sound file for bearish alert
      
      #else
         
         input ENUM_ALERT_WHEN         AlertMeWhen = ALERT_WHEN_None;            // Alert condition
         input ENUM_ALERT_NOTIFY_TYPE  AlertNotificationType = ALERT_NOTIFY_TYPE_None; // Alert notification type
         
      #endif
         

         
      #ifdef AMP_VERSION  
      
            input ENUM_BOOL               MA1on = false;                            // Show tick
            input ENUM_MA_LINE_TYPE       MA1lineType = MA_DOTS;                    // Tick Draw as
            input int                     MA1period = 1;                            // Tick period
            input ENUM_MA_METHOD_EXT      MA1method =  _MODE_EMA;                   // Tick method
            input ENUM_APPLIED_PRICE      MA1applyTo = PRICE_CLOSE;                 // Tick apply to
            input int                     MA1shift = 0;                             // Tick shift
            input ENUM_BOOL               MA1priceLabel = false;                    // Show tick price label
            
            input ENUM_BOOL               MA2on = false;                            // Show FYL
            input ENUM_MA_LINE_TYPE       MA2lineType = MA_LINE;                    // FYL draw as
            input int                     MA2period = 86;                           // FYL period
            input ENUM_MA_METHOD_EXT      MA2method = _LINEAR_REGRESSION;           // FLY method
            input ENUM_APPLIED_PRICE      MA2applyTo = PRICE_CLOSE;                 // FLY apply to
            input int                     MA2shift = 0;                             // FLY shift
            input ENUM_BOOL               MA2priceLabel = false;                    // Show FLY price label
            
            input ENUM_BOOL               MA3on = false;                            // Show third MA 
            input ENUM_MA_LINE_TYPE       MA3lineType = MA_LINE;                    // 3rd MA draw as
            input int                     MA3period = 20;                           // 3rd MA period
            input ENUM_MA_METHOD_EXT      MA3method = _VWAP_TICKVOL;                // 3rd MA method
            input ENUM_APPLIED_PRICE      MA3applyTo = PRICE_CLOSE;                 // 3rd MA apply to
            input int                     MA3shift = 0;                             // 3rd MA shift
            input ENUM_BOOL               MA3priceLabel = false;                    // 3rd MA show price label
   
            input ENUM_BOOL               MA4on = false;                            // Show fourth MA 
            input ENUM_MA_LINE_TYPE       MA4lineType = MA_LINE;                    // 4th MA draw as
            input int                     MA4period = 21;                           // 4th MA period
            input ENUM_MA_METHOD_EXT      MA4method = _MODE_SMA;                    // 4th MA method
            input ENUM_APPLIED_PRICE      MA4applyTo = PRICE_CLOSE;                 // 4th MA apply to
            input int                     MA4shift = 0;                             // 4th MA shift
            input ENUM_BOOL               MA4priceLabel = false;                    // 4st MA show price label
            
            input ENUM_CHANNEL_TYPE       ShowChannel = _None;                      // Show Keltner Channel
            input int                     ChannelPeriod = 20;                       // Keltner channel period
            input int                     ChannelAtrPeriod = 10;                    // Keltner channel ATR period
            input ENUM_APPLIED_PRICE      ChannelAppliedPrice = PRICE_CLOSE;        // Keltner channel applied price
            input double                  ChannelMultiplier = 2;                    // Keltner channel multiplier
                  double                  ChannelBandsDeviations = 2.0;             
            input ENUM_BOOL               ChannelPriceLabel = false;                // Show Keltner channel price labels
            input ENUM_BOOL               ChannelMidPriceLabel = false;             // Show Keltner channel mid-price label

      #else

            input ENUM_BOOL               MA1on = false;                             // Show first MA 
            input ENUM_MA_LINE_TYPE       MA1lineType = MA_LINE;                    // 1st MA draw as
            input int                     MA1period = 9;                            // 1st MA period
            input ENUM_MA_METHOD_EXT      MA1method =  _MODE_EMA;                   // 1st MA method
            input ENUM_APPLIED_PRICE      MA1applyTo = PRICE_CLOSE;                 // 1st MA apply to
            input int                     MA1shift = 0;                             // 1st MA shift
            input ENUM_BOOL               MA1priceLabel = false;                    // 1st MA show price label
            
            input ENUM_BOOL               MA2on = false;                             // Show second MA 
            input ENUM_MA_LINE_TYPE       MA2lineType = MA_LINE;                     //2nd MA draw as
            input int                     MA2period = 86;                           // 2nd MA period
            input ENUM_MA_METHOD_EXT      MA2method = _LINEAR_REGRESSION;           // 2nd MA method
            input ENUM_APPLIED_PRICE      MA2applyTo = PRICE_CLOSE;                 // 2nd MA apply to
            input int                     MA2shift = 0;                             // 2nd MA shift
            input ENUM_BOOL               MA2priceLabel = false;                    // 2nd MA show price label
            
            input ENUM_BOOL               MA3on = false;                            // Show third MA 
            input ENUM_MA_LINE_TYPE       MA3lineType = MA_LINE;                    // 3rd MA draw as
            input int                     MA3period = 20;                           // 3rd MA period
            input ENUM_MA_METHOD_EXT      MA3method = _VWAP_TICKVOL;                // 3rd MA method
            input ENUM_APPLIED_PRICE      MA3applyTo = PRICE_CLOSE;                 // 3rd MA apply to
            input int                     MA3shift = 0;                             // 3rd MA shift
            input ENUM_BOOL               MA3priceLabel = false;                    // 3rd MA show price label
   
            input ENUM_BOOL               MA4on = false;                            // Show fourth MA 
            input ENUM_MA_LINE_TYPE       MA4lineType = MA_LINE;                    // 4th MA draw as
            input int                     MA4period = 21;                           // 4th MA period
            input ENUM_MA_METHOD_EXT      MA4method = _MODE_SMA;                    // 4th MA method
            input ENUM_APPLIED_PRICE      MA4applyTo = PRICE_CLOSE;                 // 4th MA apply to
            input int                     MA4shift = 0;                             // 4th MA shift
            input ENUM_BOOL               MA4priceLabel = false;                    // 4st MA show price label
            
            input ENUM_CHANNEL_TYPE       ShowChannel = _None;                      // Show Channel
            input int                     ChannelPeriod = 20;                       // Channel period
            input int                     ChannelAtrPeriod = 10;                    // Channel ATR period
            input ENUM_APPLIED_PRICE      ChannelAppliedPrice = PRICE_CLOSE;        // Channel applied price
            input double                  ChannelMultiplier = 2;                    // Channel multiplier
            input double                  ChannelBandsDeviations = 2.0;             // Channel Bands deviations
            input ENUM_BOOL               ChannelPriceLabel = false;                // Channel Bands price labels   
            input ENUM_BOOL               ChannelMidPriceLabel = false;             // Channel mid-price label   
         
      #endif // AMP_VERSION  
                  
         input ENUM_BOOL               UsedInEA = false;                            // Indicator used in EA via iCustom()

      #ifndef AMP_VERSION  
         input double                  TopBottomPaddingPercentage = 0.30;        // Use padding top/bottom (0.0 - 1.0)
         input ENUM_BOOL               showCurrentBarOpenTime = true;            // Display chart info
         input string                  SoundFileBull = "news.wav";               // Use sound file for bullish alert
         input string                  SoundFileBear = "timeout.wav";            // Use sound file for bearish alert
      #endif // !AMP_VERSION  
      
//      #ifdef AMP_VERSION    
//         input ENUM_BOOL               DisplayAsBarChart = true;                    // Display as tick chart
//      #else
         input ENUM_BOOL               DisplayAsBarChart = false;                   // Display as bar chart
//      #endif // AMP_VERSION 
         input ENUM_BOOL               ShiftObj = false;                            // Shift objects with chart

   #endif // !USE_CUSTOM_SYMBOL

#else // don't SHOW_INDICATOR_INPUTS

   //
   //  This block sets default values
   //
   
   string                     TradingSessionTime = "0:0-0:0"; 
   double                     TopBottomPaddingPercentage = 0;
   ENUM_PIVOT_POINTS          showPivots = ppNone;
   ENUM_PIVOT_TYPE            pivotPointCalculationType = ppHLC3;
   color                      RColor = clrNONE;
   color                      PColor = clrNONE;
   color                      SColor = clrNONE;
   color                      PDHColor = clrNONE;
   color                      PDLColor = clrNONE;
   color                      PDCColor = clrNONE;
   ENUM_BOOL                  showNextBarLevels = false;
   color                      HighThresholdIndicatorColor = clrNONE;
   color                      LowThresholdIndicatorColor = clrNONE;
   ENUM_BOOL                  showCurrentBarOpenTime = false;
   color                      InfoTextColor = clrNONE;
   
   #ifdef AMP_VERSION  

      ENUM_BOOL                  NewBarAlert = false; 
      ENUM_BOOL                  ReversalBarAlert = false;
      ENUM_BOOL                  MaCrossAlert = false;    
      ENUM_BOOL                  UseAlertWindow = false;  
      ENUM_BOOL                  UseSound = false;        
      ENUM_BOOL                  UsePushNotifications = false;
   
   #else
      
      ENUM_ALERT_WHEN         AlertMeWhen = ALERT_WHEN_None;  
      ENUM_ALERT_NOTIFY_TYPE  AlertNotificationType = ALERT_NOTIFY_TYPE_None; 
      
   #endif
      
   string                     SoundFileBull = "";
   string                     SoundFileBear = "";
   ENUM_BOOL                  DisplayAsBarChart = true;
   ENUM_BOOL                  ShiftObj = false;
   ENUM_BOOL                  UsedInEA = true; // This should always be set to TRUE for EAs & Indicators
          
#endif // SHOW_INDICATOR_INPUTS
