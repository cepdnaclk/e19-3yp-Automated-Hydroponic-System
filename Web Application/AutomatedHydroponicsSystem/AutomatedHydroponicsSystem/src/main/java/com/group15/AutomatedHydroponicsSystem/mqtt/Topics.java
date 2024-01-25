package com.group15.AutomatedHydroponicsSystem.mqtt;

public class Topics {
    //Topics to be subscribed
    public static final String phsensorTopic = "phsensor";   // key : ph
    public static final String tdssensorTopic = "tdssensor";  // key : tds
    public static final String floatsensorTopic = "floatsensor";  // key : float


    public static final String phpumpTopic = "phpump";   // key : phhighpumpstate
    public static final String phlowpumpTopic = "phlowpump";  // key : phlowpumpstate
    public static final String tdspumpTopic = "tdspump";  // key : tdspumpstate


    public static final String phhigherrorTopic = "phhigherror";  // key : phhigherror
    public static final String phlowerrorTopic = "phlowerror";  // key : phlowerror
    public static final String tdserrorTopic = "tdserror";  // key : tdserror


    public static final String phsensorerrorTopic = "phsensorerror";  // key : phsensorerror
    public static final String tdssensorerrorTopic = "tdssensorerror";  // key : tdssensorerror


    //Topics to be published   common key : message
    public static final String tdsLow = "tdslow";
    public static final String tdsHigh = "tdshigh";
    public static final String phHigh = "phhigh";
    public static final String phLow = "phlow";
    public static final String waterPump = "waterpump";
    public static final String pHLowPumpBack = "phlowpumpBack";
    public static final String pHHighPumpBack = "phpumpBack";
    public static final String tdsPumpBack = "tdspumpBack";



}
