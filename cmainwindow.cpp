#include "cmainwindow.h"
#include "ui_cmainwindow.h"

#include "EDSDK.h"
#include "EDSDKTypes.h"

#include <QDebug>


cMainWindow::cMainWindow(QWidget *parent)
	: QMainWindow(parent)
	, ui(new Ui::cMainWindow)
{
	ui->setupUi(this);

	EdsError			err			= EDS_ERR_OK;
	EdsCameraListRef	cameraList	= NULL;
	EdsUInt32			count		= 0;
	EdsDeviceInfo		deviceInfo;
	EdsCameraRef		camera		= NULL;

	err	= EdsInitializeSDK();

	if(err != EDS_ERR_OK)
		return;

	err = EdsGetCameraList(&cameraList);

	if(err != EDS_ERR_OK)
	{
		EdsTerminateSDK();
		return;
	}

	err = EdsGetChildCount(cameraList, &count);

	if(count == 0)
	{
		err = EDS_ERR_DEVICE_NOT_FOUND;
		EdsTerminateSDK();
		return;
	}

	for(EdsUInt32 i = 0;i < count;i++)
	{
		err = EdsGetDeviceInfo(camera , &deviceInfo);
		if(err == EDS_ERR_OK && camera == NULL)
		{
			err = EDS_ERR_DEVICE_NOT_FOUND;
		}
	}

	EdsTerminateSDK();
}

cMainWindow::~cMainWindow()
{
	delete ui;
}

