/**
  ******************************************************************************
  * @file    RTC/RTC_Calendar_Alarm.c
  * @author  Vov
  * @version V1.0.0
  * @date    10 09 2019
  * @brief   Main program body
  ******************************************************************************  
*/
 
/* Includes ------------------------------------------------------------------*/
#include "stm8l15x.h"
#include "stm8l_discovery_lcd.h"
#include "discover_board.h"
#include "icc_measure.h"
#include "discover_functions.h"
#include "main.h" 

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
uint8_t state_machine; //Machine status used by main for active function set by user button in interrupt handler
int cnt = 0; //счётчик нажатий
int alarmmm = 0;
/* LCD bar graph: used for display active function */
extern uint8_t t_bar[2]; //типо индикатор заряда в версии с экраном.
/* Auto_test activation flag: set by interrupt handler if user button is pressed few seconds */
extern bool Auto_test; // типо будет сервисный режим
/* Set in interrupt handler for indicate that user button is pressed */ 
extern bool KeyPressed;
bool AlarmOccurred = FALSE;
bool GerCont1 = FALSE;

RTC_InitTypeDef   RTC_InitStr;
 RTC_TimeTypeDef   RTC_TimeStr;
 RTC_DateTypeDef   RTC_DateStr;
 RTC_AlarmTypeDef  RTC_AlarmStr;

/* Private function prototypes -----------------------------------------------*/
void display_temp(void);  // формирование и вывод  последовательности символов на дисплей из значений счётчика
void LSE_StabTime(void);   // Задержка LSE
void Calendar_Init(void);  //  установка при подаче питания и/или  при присылке с сервера
//void Time_Show(void); // вывод на экран времени
void alarm_next_set(void); // установка следующего времени сеанса связи - отправки показаний.
void Show_Counter(void); // вывод показаний счетчика по его сработке.
/* Private functions смотри внизу ---------------------------------------------------------*/




/**
  * @brief main entry point.
  * @par Parameters None
  * @retval void None
  * @par Required preconditions: None
  */
void main(void)
{ 

uint8_t index = 0;
/* Enable LSE  снижаем потребление низкой частотой  */
   CLK_LSEConfig(CLK_LSE_ON);
   /* Wait for LSE clock to be ready */
   while (CLK_GetFlagStatus(CLK_FLAG_LSERDY) == RESET);
   /* wait for 1 second for the LSE Stabilisation устакаинился генератор наконец */
   LSE_StabTime();
	  /* Select LSE (32.768 KHz) as RTC clock source жалкая попытка обойтись без отдельного кварца для реалтаймного таймера с будильником*/
   CLK_RTCClockConfig(CLK_RTCCLKSource_LSE, CLK_RTCCLKDiv_1);
    CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);
		Calendar_Init();
		//  инициализация конкретно наплатного  LCD glass, ну и чистим. 
  LCD_GLASS_Init(); LCD_GLASS_Clear();
	


/* Init I/O ports,  вдруг светодиоды понадобятся :) или привод закрытия крана при протечке */
 EXTI->CR3 |= 0x00;
  EXTI->CR2 = 0x00; 
//порт С, пин 1 ( кнопка на плате) , порт_ в моду_ввода_без подтягивающих резисторов(плавающий)_вызывает внешнее прерывание
  GPIO_Init( BUTTON_GPIO_PORT, USER_GPIO_PIN, GPIO_Mode_In_FL_IT);
	
	GPIO_Init(GPIOC, GPIO_Pin_0, GPIO_Mode_In_FL_IT);
	EXTI->CR3 |= 0x11; //Устанавливаем 1 и 2 бит в PBIS -  прерывание по любому фронту
	
	
//  определим и сразу загасим изначально светодиоды 		
//зелёный светодиод: порт Е, пин 7, порт_в моду_вывода_подтянут к _высокому уровню_до 10 мГц
  GPIO_Init( LED_GREEN_PORT, LED_GREEN_PIN, GPIO_Mode_Out_PP_High_Fast); GPIO_LOW(LED_GREEN_PORT,LED_GREEN_PIN);	
//синий светодиод: порт С, пин 7, порт_в моду_вывода_подтянут к _высокому уровню_до 10 мГц
  GPIO_Init( LED_BLUE_PORT, LED_BLUE_PIN, GPIO_Mode_Out_PP_High_Fast);GPIO_LOW(LED_BLUE_PORT,LED_BLUE_PIN);		
		
// подключение выхода счётчика на схему измерения тока :
  //порт С, пин 4, порт_в моду_вывода_не подтянут к _высокое сопротивление(импеданс)_до 2 мГц
  GPIO_Init( CTN_GPIO_PORT, CTN_CNTEN_GPIO_PIN, GPIO_Mode_Out_OD_HiZ_Slow);
	
// вход для пробуждения при измерении тока в режиме остановки: для определения конца счетчика , 
//установленного в активном режиме прерывания входа: 
//порт Е, пин 6, порт_в моду_ввода_не подтянут к _прерывание
  GPIO_Init( WAKEUP_GPIO_PORT, ICC_WAKEUP_GPIO_PIN, GPIO_Mode_In_FL_IT);

//  разрешение для порт Е, пин 6, по растущему фронту для пробуждения 
  EXTI->CR2 = 0x10; 	


	
//  для  LCD glass, с настройкой таймера в камне под него (контроллер его и RTC тоже). 
  CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);

//  инициализация таймер АЦП-! с настройкой его таймера , ну и включение. 
  ADC_Icc_Init();

//  измерение напряжения питания и вывод на наш LCD
  Vref_measure();

//  тампер не вскрыт (пока)
  Auto_test = FALSE;

//  юзеркнопка не нажата (пока) 
  KeyPressed = FALSE;
		 

		
// проверка, не нажата ли кнопка при включении питания 
  while ((GPIOC->IDR & USER_GPIO_PIN) == 0x0) // будет активация передатчика при включении - вариант сервисного режима
  {
    Bias_measurement(); //  --> измеряем ток камня и пишем его в память
  }	
  
  // enableInterrupts();	

  
  /* At "power on"  diplays */
	//LCD_GLASS_ScrollSentence("      RTC_CALENDAR_ALARM_COUNTER    ",1,SCROLL_SPEED);
  state_machine = STATE_VREF;  //  готовимся померять батарейку
  LCD_GLASS_DisplayString("BATT:");
	delay_ms(100);
	Vref_measure();//  меряем батарейку и выводим значение на экран
	delay_ms(200);
	LCD_GLASS_DisplayString("COUNT:");
	delay_ms(100);
	cnt ++; // собсно счётчик нажатий :)
		display_temp(); // счёчик на экран
		delay_ms(200);
  KeyPressed = FALSE;	
	LCD_GLASS_Clear();
		       
				
			//KeyPressed = FALSE;	
			enableInterrupts(); // теперь можно дёргать за ноги :)
			
		wfi();  // будь готов проснуться! по любому событию
			halt(); // СПАААААТь!
			
  while (1) // основной цикл если проснулись
  {
		disableInterrupts();	
		// пока прерывания не нужны
			
	
	if (GerCont1 == TRUE)
	{
GerCont1 = FALSE;
 Show_Counter(); // показать на LCD только счётчик

  }
		   if (KeyPressed == TRUE) //  если кнопка, то показать и батарейку
			 {
				  LCD_GLASS_Clear(); 
					LCD_GLASS_DisplayString("BATT:");
	delay_ms(100);
	Vref_measure();
	delay_ms(100);
	LCD_GLASS_Clear();
				 
			 }
	     if (AlarmOccurred == TRUE) alarm_next_set(); 
			 //если пробудились по ежесуточному будильнику, то переставить пробуждение на завтра
   			 
	
	enableInterrupts(); // опять прерывания нужны
  	LCD_GLASS_Clear();
			KeyPressed = FALSE;		
			 halt();
    }
}		

/*собсно всё, теперь функции: */
void display_temp(void)  // формирование и вывод  последовательности символов на дисплей из значений счётчика
{
u16 display_array[6];
u32 Nbre1Tmp;
u32 Nbre2Tmp;
		
		Nbre1Tmp = cnt;
		Nbre2Tmp = cnt / 10000;
    display_array[0] = Nbre2Tmp + 0x30;
    
		Nbre1Tmp = Nbre1Tmp - (Nbre2Tmp * 10000);
    Nbre2Tmp = Nbre1Tmp / 1000;
    display_array[1] = Nbre2Tmp + 0x30;
				
		Nbre1Tmp = Nbre1Tmp - (Nbre2Tmp * 1000);
    Nbre2Tmp = Nbre1Tmp / 100;
    display_array[2] = Nbre2Tmp + 0x30;
		
		Nbre1Tmp = Nbre1Tmp - (Nbre2Tmp * 100);
    Nbre2Tmp = Nbre1Tmp / 10;
    display_array[3] = Nbre2Tmp + 0x30;
		
		Nbre1Tmp = Nbre1Tmp - (Nbre2Tmp * 10);
    Nbre2Tmp = Nbre1Tmp;
    display_array[4] = Nbre2Tmp + 0x30;

    Nbre1Tmp = Nbre1Tmp - (10 * Nbre2Tmp);
    display_array[5] = Nbre1Tmp + 0x30;
    
		    
		LCD_GLASS_DisplayStrDeci(display_array);  delay_ms(100); LCD_GLASS_Clear();// вывод собсно
  
}


void LSE_StabTime(void)
 {
 
   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 
   /* Configure TIM4 to generate an update event each 1 s */
   TIM4_TimeBaseInit(TIM4_Prescaler_16384, 123);
   /* Clear update flag */
   TIM4_ClearFlag(TIM4_FLAG_Update);
 
   /* Enable TIM4 */
   TIM4_Cmd(ENABLE);
 
   /* Wait 1 sec */
   while ( TIM4_GetFlagStatus(TIM4_FLAG_Update) == RESET );
 
   TIM4_ClearFlag(TIM4_FLAG_Update);
 
   /* Disable TIM4 */
   TIM4_Cmd(DISABLE);
 
   CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
 }
 
 void Calendar_Init(void)
 {
	 alarmmm = 01;
   RTC_InitStr.RTC_HourFormat = RTC_HourFormat_24;
   RTC_InitStr.RTC_AsynchPrediv = 0x7F;
   RTC_InitStr.RTC_SynchPrediv = 0x00FF;
   RTC_Init(&RTC_InitStr);
 
   RTC_DateStructInit(&RTC_DateStr);
   RTC_DateStr.RTC_WeekDay = RTC_Weekday_Monday;
   RTC_DateStr.RTC_Date = 20;
   RTC_DateStr.RTC_Month = RTC_Month_September;
   RTC_DateStr.RTC_Year = 19;
   RTC_SetDate(RTC_Format_BIN, &RTC_DateStr);
 
   RTC_TimeStructInit(&RTC_TimeStr);
   RTC_TimeStr.RTC_Hours   = 18;
   RTC_TimeStr.RTC_Minutes = 00;
   RTC_TimeStr.RTC_Seconds = 00;
   RTC_SetTime(RTC_Format_BIN, &RTC_TimeStr);
 
 
   RTC_AlarmStructInit(&RTC_AlarmStr);
   RTC_AlarmStr.RTC_AlarmTime.RTC_Hours   = 18;
   RTC_AlarmStr.RTC_AlarmTime.RTC_Minutes = 01;
   RTC_AlarmStr.RTC_AlarmTime.RTC_Seconds = 00;
   RTC_AlarmStr.RTC_AlarmMask = RTC_AlarmMask_DateWeekDay;
   RTC_SetAlarm(RTC_Format_BIN, &RTC_AlarmStr);
 
   RTC_ITConfig(RTC_IT_ALRA, ENABLE);
   RTC_AlarmCmd(ENABLE);
 }
 
 void Time_Show()  // (uint8_t Line)
 {
   
	 u16 display_array[6];
	 /* Wait until the calendar is synchronized */
   while (RTC_WaitForSynchro() != SUCCESS);
 
   /* Get the current Time*/
   RTC_GetTime(RTC_Format_BCD, &RTC_TimeStr);
 
 
  //LCD_GLASS_DisplayStrDeci(display_array);
	
   // Fill the LCDString fields with the current Time
   
	 display_array[0] = (uint8_t)(((uint8_t)(RTC_TimeStr.RTC_Hours & 0xF0) >> 4) + 0x30);
	 display_array[1] = (uint8_t)(((uint8_t)(RTC_TimeStr.RTC_Hours & 0x0F)) + 0x30);
	 display_array[1] |= DOUBLE_DOT;
	 display_array[2] = (uint8_t)(((uint8_t)(RTC_TimeStr.RTC_Minutes & 0xF0) >> 4) + 0x30);
	 display_array[3] = (uint8_t)(((uint8_t)(RTC_TimeStr.RTC_Minutes & 0x0F)) + 0x30);
	 display_array[3] |= DOUBLE_DOT;
	 display_array[4] = (uint8_t)(((uint8_t)(RTC_TimeStr.RTC_Seconds & 0xF0) >> 4) + 0x30);
	 display_array[5] = (uint8_t)(((uint8_t)(RTC_TimeStr.RTC_Seconds & 0x0F)) + 0x30);
	 
	 LCD_GLASS_DisplayStrDeci(display_array); delay_ms(100); LCD_GLASS_Clear();
	 //Alarm_Regulate();
	 
	 /*LCDStringTime[4] = (uint8_t)(((uint8_t)(RTC_TimeStr.RTC_Hours & 0xF0) >> 4) + ASCII_NUM_0);
     LCDStringTime[5] = (uint8_t)(((uint8_t)(RTC_TimeStr.RTC_Hours & 0x0F)) + ASCII_NUM_0);
 
   LCDStringTime[7] = (uint8_t)(((uint8_t)(RTC_TimeStr.RTC_Minutes & 0xF0) >> 4) + ASCII_NUM_0);
   LCDStringTime[8] = (uint8_t)(((uint8_t)(RTC_TimeStr.RTC_Minutes & 0x0F)) + (uint8_t)ASCII_NUM_0);
 
   LCDStringTime[10] = (uint8_t)(((uint8_t)(RTC_TimeStr.RTC_Seconds & 0xF0) >> 4) + ASCII_NUM_0);
   LCDStringTime[11] = (uint8_t)(((uint8_t)(RTC_TimeStr.RTC_Seconds & 0x0F)) + ASCII_NUM_0);*/
 
   /* Print the Time Calendar on the LCD
   LCD_SetCursorPos(Line, 0);
   LCD_Print((uint8_t*)LCDStringTime);*/
 }
 
 void alarm_next_set()  // (uint8_t Line)
 {
   alarmmm = alarmmm + 01;
		 if (alarmmm == 60) alarmmm = 00;
         
   RTC_AlarmStr.RTC_AlarmTime.RTC_Minutes = alarmmm;
   //RTC_AlarmStr.RTC_AlarmTime.RTC_Seconds = 00;
   RTC_SetAlarm(RTC_Format_BIN, &RTC_AlarmStr);
	  RTC_ITConfig(RTC_IT_ALRA, ENABLE); RTC_AlarmCmd(ENABLE);
		
		
   //RTC_AlarmStr.RTC_AlarmMask = RTC_AlarmMask_DateWeekDay;
   
		AlarmOccurred = FALSE;
		
	      	 
 }
 
 void Alarm_Regulate(void)
 {
   //uint8_t alarmhh = 0, alarmmm = 0, alarmss = 0;
 
   /* Read alarm hours 
   alarmhh = ReadDigit((uint8_t*)LCDStringAlarm, 4, 0x2, 0x0);
 
   if (alarmhh == 0x2)
   {
     if (LCDStringAlarm[5] > 0x03 + 0x30)
     {
       LCDStringAlarm[5] = 0 + 0x30;
     }
     alarmhh = alarmhh * 10 + ReadDigit((uint8_t*)LCDStringAlarm, 5, 0x3, 0x0);
   }
   else
   {
     alarmhh = alarmhh * 10 + ReadDigit((uint8_t*)LCDStringAlarm, 5, 0x9, 0x0);
   }*/
 
   /* Read alarm minutes 
   alarmmm = ReadDigit((uint8_t*)LCDStringAlarm, 7, 0x5, 0x0);
   alarmmm  = alarmmm * 10 + ReadDigit((uint8_t*)LCDStringAlarm, 8, 0x9, 0x0);*/
 
   /* Read alarm seconds 
   alarmss = ReadDigit((uint8_t*)LCDStringAlarm, 10, 0x5, 0x0);
   alarmss = alarmss * 10 + ReadDigit((uint8_t*)LCDStringAlarm, 11, 0x9, 0x0);*/
 
   /* Set the alarm */
   RTC_AlarmStr.RTC_AlarmTime.RTC_Hours   = 01;
   RTC_AlarmStr.RTC_AlarmTime.RTC_Minutes = 02;
   RTC_AlarmStr.RTC_AlarmTime.RTC_Seconds = 00;
   RTC_SetAlarm(RTC_Format_BIN, &RTC_AlarmStr);
	  RTC_ITConfig(RTC_IT_ALRA, ENABLE); RTC_AlarmCmd(ENABLE);
		
		
   //RTC_AlarmStr.RTC_AlarmMask = RTC_AlarmMask_DateWeekDay;
   
		AlarmOccurred = FALSE;
		
	  GPIO_TOGGLE(LED_BLUE_PORT,LED_BLUE_PIN);delay_ms(10);	
					GPIO_TOGGLE(LED_GREEN_PORT,LED_GREEN_PIN);delay_ms(10);
					GPIO_TOGGLE(LED_GREEN_PORT,LED_GREEN_PIN);delay_ms(10);
					GPIO_TOGGLE(LED_GREEN_PORT,LED_GREEN_PIN);delay_ms(10);
					GPIO_TOGGLE(LED_GREEN_PORT,LED_GREEN_PIN);delay_ms(10);
					GPIO_TOGGLE(LED_GREEN_PORT,LED_GREEN_PIN);
	 
 }
 
 void Show_Counter(void)
 {
	 
	LCD_GLASS_Clear();
	LCD_GLASS_DisplayString("COUNT:");
	delay_ms(100);
	cnt ++; // собсно счётчик нажатий :)
		display_temp();delay_ms(100); LCD_GLASS_Clear();
		
	 } 
 