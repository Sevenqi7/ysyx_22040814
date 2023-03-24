#include <am.h>
#include <riscv/riscv.h>
#include <sys/time.h>
#include <stdio.h>

static long int boot_time;

void __am_timer_init() {
  while(1);
  boot_time = inl(0xa00000048);
  printf("boot_time:%d\n");
}

void __am_timer_uptime(AM_TIMER_UPTIME_T *uptime) {
  // uptime->us = inl(0xa0000048) - boot_time;
}

void __am_timer_rtc(AM_TIMER_RTC_T *rtc) {
  rtc->second = 0;
  rtc->minute = 0;
  rtc->hour   = 0;
  rtc->day    = 0;
  rtc->month  = 0;
  rtc->year   = 1900;
}

