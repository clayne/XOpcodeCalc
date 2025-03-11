QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = xocalc

macx {
    TARGET = XOcalc
}

TEMPLATE = app

CONFIG += c++11

SOURCES +=\
    guimainwindow.cpp \
    main_gui.cpp \
    dialogabout.cpp \
    dialogoptions.cpp

HEADERS +=\
    guimainwindow.h \
    dialogabout.h \
    dialogoptions.h \
    ../asm/asm.h \
    ../asm_defs.h \
    ../global.h

FORMS += \
    guimainwindow.ui \
    dialogabout.ui \
    dialogoptions.ui

include(../build.pri)

!contains(XCONFIG, xoptions) {
    XCONFIG += xoptions
    include(../XOptions/xoptions.pri)
}

!contains(XCONFIG, xaboutwidget) {
    XCONFIG += xaboutwidget
    include(../XAboutWidget/xaboutwidget.pri)
}

!contains(XCONFIG, xlineedithex) {
    XCONFIG += xlineedithex
    include(../Controls/xlineedithex.pri)
}

win32 {
    RC_ICONS = ../icons/main.ico
    CONFIG -= embed_manifest_exe
    QMAKE_MANIFEST = windows.manifest.xml
    VERSION = 0.05
    QMAKE_TARGET_COMPANY = NTInfo
    QMAKE_TARGET_PRODUCT = x86/64 Opcode calculator
    QMAKE_TARGET_DESCRIPTION = XOpcodeCalc
    QMAKE_TARGET_COPYRIGHT = horsicq@gmail.com
}

macx {
    ICON = ../icons/main.icns
}

RESOURCES += \
    resources.qrc

preprocess.name = assembler
preprocess.input = ASM_FILES

win32-msvc*{
    preprocess.output = ${QMAKE_FILE_BASE}.obj
    !contains(QMAKE_TARGET.arch, x86_64) {
        message("Win msvc x86 build")
        ASM_FILES = ../asm/msvc32.asm
        preprocess.commands = ml /c /coff ${QMAKE_FILE_IN}
    } else {
        message("Win msvc x86_64 build")
        ASM_FILES = ../asm/msvc64.asm
        preprocess.commands = ml64 /c /coff ${QMAKE_FILE_IN}
    }
}

linux-g++*{
    BITSIZE = $$system(getconf LONG_BIT)
    !contains(BITSIZE, 64) {
        message("Linux gcc x32 build")
        ASM_FILES = ../asm/gcc32.s
    } else {
        message("Linux gcc x64 build")
        ASM_FILES = ../asm/gcc64.s
    }

    preprocess.output = ${QMAKE_FILE_BASE}.o
    preprocess.commands = gcc -c ${QMAKE_FILE_IN}
}

win32-g++*{
    contains(QT_ARCH, i386) {
        message("Win gcc x32 build")
        ASM_FILES = ../asm/gcc32.s
    } else {
        message("Win gcc x64 build")
        ASM_FILES = ../asm/gcc64.s
    }

    preprocess.output = ${QMAKE_FILE_BASE}.o
    preprocess.commands = gcc -c ${QMAKE_FILE_IN}
}

osx{
    message("OSX x64 build")
    ASM_FILES = ../asm/gcc64.s
    preprocess.output = ${QMAKE_FILE_BASE}.o
    preprocess.commands = gcc -arch x86_64 -c ${QMAKE_FILE_IN}
}

QMAKE_EXTRA_COMPILERS += preprocess

DISTFILES += \
    ../changelog.txt \
    ../release_version.txt \
    CMakeLists.txt
