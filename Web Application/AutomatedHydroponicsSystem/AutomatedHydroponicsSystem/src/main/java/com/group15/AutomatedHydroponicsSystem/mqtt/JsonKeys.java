package com.group15.AutomatedHydroponicsSystem.mqtt;

public class JsonKeys {

    // Keys related to pH sensor
    public static final String pHKey = "ph";
    public static final String acidicPumpStateKey = "phlowpumpstate";
    public static final String basePumpStateKey = "phhighpumpstate";
    public static final String pHHighErrorKey = "phhigherror";
    public static final String pHLowErrorKey = "phlowerror";
    public static final String pHSensorErrorKey = "phsensorerror";


    // Keys related to TDS sensor
    public static final String tdsKey = "tds";
    public static final String tdsPumpStateKey = "tdspumpstate";
    public static final String tdsErrorKey = "tdserror";
    public static final String tdsSensorErrorKey = "tdssensorerror";


    // Keys related to Floating sensor
    public static final String floatKey = "float";
}
