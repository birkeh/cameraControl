VERSION = 0.0.1.0
QMAKE_TARGET_COMPANY = WIN-DESIGN
QMAKE_TARGET_PRODUCT = cameraControl
QMAKE_TARGET_DESCRIPTION = cameraControl
QMAKE_TARGET_COPYRIGHT = (c) 2020 WIN-DESIGN

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

win32-msvc* {
    contains(QT_ARCH, i386) {
        message("msvc 32-bit")
    } else {
        message("msvc 64-bit")
    }
}

win32-g++ {
    contains(QT_ARCH, x86_64) {
        message("mingw 64-bit")
        INCLUDEPATH += C:\dev\3rdParty\edsdk\EDSDK\Header
        LIBS += -LC:\dev\3rdParty\edsdk\EDSDK_64\Library -lEDSDK.dll
    } else {
        message("mingw 32-bit")
        INCLUDEPATH += C:\dev\3rdParty\edsdk\EDSDK\Header
        LIBS += -LC:\dev\3rdParty\edsdk\EDSDK\Library -lEDSDK.dll
    }
}

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += APP_VERSION=\\\"$$VERSION\\\"

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \
    cmainwindow.cpp

HEADERS += \
    cmainwindow.h

FORMS += \
    cmainwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
