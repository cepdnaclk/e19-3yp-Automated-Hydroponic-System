package com.group15.AutomatedHydroponicsSystem.mqtt;

public class DataVariables {
    // ON and OFF states
    public  static  final Boolean ON_STATE = true;
    public  static final Boolean OFF_STATE = false;
    //static variables to store the received data
    public  static double pHData ;
    public static double tdsData;
    public static boolean floatSensorData;
    public static boolean phpumpData;
    public static boolean phlowpumpData;
    public static boolean tdspumpData;
    public static boolean phhigherrorData;
    public static boolean phlowerrorData;
    public static boolean tdserrorData;
    public static boolean phsensorerrorData;
    public static boolean tdssensorerrorData;

    public static int  phPumpCount = 0;
    public static int phLowPumpCount = 0;
    public static int tdsPumpCount = 0;

}
