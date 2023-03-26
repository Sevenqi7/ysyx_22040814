#include <am.h>
#include <riscv/riscv.h>
#include <sys/time.h>
#include <stdio.h>

static unsigned long long boot_time;

void __am_timer_init() {
  boot_time = inl(0xa0000048) / 10;
  printf("boot_time:%d\n", boot_time);
}

void __am_timer_uptime(AM_TIMER_UPTIME_T *uptime) {
  unsigned long gettime = inl(0xa0000048);
  // printf("get_time:%d\n", gettime-boot_time);
  uptime->us = gettime / 10 - boot_time;
}

void __am_timer_rtc(AM_TIMER_RTC_T *rtc) {
  rtc->second = 0;
  rtc->minute = 0;
  rtc->hour   = 0;
  rtc->day    = 0;
  rtc->month  = 0;
  rtc->year   = 1900;
}

