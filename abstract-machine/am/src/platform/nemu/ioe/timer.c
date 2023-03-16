#include <am.h>
#include <nemu.h>
#include <stdio.h>

// static uint64_t __am_timer_boot_time = 0;

void __am_timer_init() {
  // __am_timer_boot_time = inb(RTC_ADDR);
}

void __am_timer_uptime(AM_TIMER_UPTIME_T *uptime) {
  // uptime->us = inl(RTC_ADDR);
  uptime->us = inl(RTC_ADDR+4);
  printf("us:%d", uptime->us);
}

void __am_timer_rtc(AM_TIMER_RTC_T *rtc) {
  rtc->second = 0;
  rtc->minute = 0;
  rtc->hour   = 0;
  rtc->day    = 0;
  rtc->month  = 0;
  rtc->year   = 1900;
}
