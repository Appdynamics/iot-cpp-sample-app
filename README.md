C++ Sample Application using IoT C++ SDK
==========================================

This application fills and sends sample data for Custom, Network and Error Events.
Sample Data reflects a Smart Car Application capturing usage information, network performance and errors.

Below are instructions to run sample application.

Download IoT C++ SDK Library (https://download.appdynamics.com) and unzip into the directory `sdk`.

Set APPD_IOT_SDK_PATH environment variable to the directory `sdk` which has `include` and `lib` folders.
Makefile reads APPD_IOT_SDK_PATH environment variable to include SDK headers and link SDK library to sample application

```sh
$ export APPD_IOT_SDK_PATH=<sdk>
$ make
```

To dynamically link IoT C++ SDK library to your application running on Mac, set DYLD_LIBRARY_PATH environment variable to lib directory of SDK.

```sh
$ export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$APPD_IOT_SDK_PATH/lib
```


To dynamically link IoT C++ SDK library to your application running on Linux, set LD_LIBRARY_PATH environment variable to lib directory of SDK.

```sh
$ export LD_LIBRARY_PATH=$ LD_LIBRARY_PATH:$APPD_IOT_SDK_PATH/lib
```


Below is usage information for the sample app. Provide AppKey as an input along with any options as needed.

```sh
USAGE: ./simple <appkey> [options]
options:
-collectorurl <url> Collector URL to which sdk will send events to.
-logfile <file>     Log file to which sdk log messages are written to.
-loglevel <level>   Log level set to one of the values:
                    1-error, 2-warn, 3-info, 4-debug, 5-verbose, 6-all.
-sendevent <event>  Sample event to be sent. Set to one of the following
                    event types: 1-custom, 2-network, 4-error, 7-all.
-url <url>          URL to trigger network request and capture network event.
-request <command>  Specify the request type to url. It is set to GET by default.
-data <data>        Data in JSON format that is to be sent in a POST request.
-help               Display available options
```

Below are the default values used by the sample app if above options are not given
```sh
DEFAULT PARAMS:
collectorurl = https://iot-col.eum-appdynamics.com
logfile = appd_iot_sdk.log
loglevel = 6
sendevent = 7
```

Here are some examples of using the sample app:

Display Usage Information
```sh
$ ./simple -h
```

Send Sample Custom, Network, and Error Events to default APPD Collector
```sh
$ ./simple <appkey>
```

Send Sample Custom, Network, and Error Events to Custom Collector (http://localhost:9001)
```sh
$  ./simple <appkey> -c http://localhost:9001
```

Send Sample Custom, Network, and Error Events to Custom Collector (http://localhost:9001) and publish log messages to custom log file (mylog.log)
```sh
$  ./simple <appkey> -c http://localhost:9001 -f mylog.log
```

Send Sample Custom, Network, and Error Events to Custom Collector (http://localhost:9001) and publish log messages to mylog.log with loglevel set to warn
```sh
$  ./simple <appkey> -c http://localhost:9001 -f mylog.log -l 2
```

Send Sample Custom Event to Custom Collector (http://localhost:9001)
```sh
$  ./simple <appkey> -c http://localhost:9001 -s 1
```

Send Sample Network Event to Custom Collector (http://localhost:9001)
```sh
$  ./simple <appkey> -c http://localhost:9001 -s 2
```

Trigger POST Network Request to URL (http://yoururl.com) with data in JSON format. Capture and Send Network Event to Custom Collector (http://localhost:9001)
```sh
$  ./simple <appkey> -c http://localhost:9001 -s 2 -u http://yoururl.com -x POST -d '{"param1"="value1"}'
```

Send Sample Error Event to Custom Collector (http://localhost:9001)
```sh
$  ./simple <appkey> -c http://localhost:9001 -s 4
```
