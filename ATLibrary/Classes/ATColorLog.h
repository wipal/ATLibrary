//
//  ATColorLog.h
//  DemoColor
//
//  Created by Thái on 5/4/16.
//  Copyright © 2016 Âu Ngọc Thái. All rights reserved.
//

#define XCODE_COLORS_ESCAPE_IOS @"\033["
#define XCODE_COLORS_ESCAPE_MAC @"\xC2\xA0["

#if TARGET_IPHONE_SIMULATOR
#define XCODE_COLORS_ESCAPE  XCODE_COLORS_ESCAPE_IOS
#else
#define XCODE_COLORS_ESCAPE  XCODE_COLORS_ESCAPE_IOS
#endif

#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"   // Clear any foreground or background color /* ATColorLog_h */

#ifdef DEBUG
#define LogInfo(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg45,120,185;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#else
#   define LogInfo(...)
#endif

#ifdef DEBUG
#define DLogInfo(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg45,120,185;\n%s [Line %d] \n " frmt XCODE_COLORS_RESET), __PRETTY_FUNCTION__, __LINE__,##__VA_ARGS__)
#else
#   define DLogInfo(...)
#endif

#ifdef DEBUG
#define LogError(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg230,70,60;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#else
#   define LogError(...)
#endif

#ifdef DEBUG
#define DLogError(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg230,70,60;\n%s [Line %d] \n " frmt XCODE_COLORS_RESET), __PRETTY_FUNCTION__, __LINE__,##__VA_ARGS__)
#else
#   define DLogError(...)
#endif

#ifdef DEBUG

#define LogWarning(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg250,200,40;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)

#define DLogWarning(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg250,200,40;\n%s [Line %d] \n " frmt XCODE_COLORS_RESET), __PRETTY_FUNCTION__, __LINE__,##__VA_ARGS__)

#define LogSuccess(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg75,175,70;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)

#define DLogSuccess(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg75,175,70;\n%s [Line %d] \n " frmt XCODE_COLORS_RESET), __PRETTY_FUNCTION__, __LINE__,##__VA_ARGS__)

#else
#   define LogWarning(...)
#   define DLogWarning(...)
#   define LogSuccess(...)
#   define DLogSuccess(...)
#endif
