package com.library.bookhub.utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class TimeUtils {
    public static String timestampToString(Timestamp timestamp) {

        // yyyy-MM-dd HH:mm:ss
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        return sdf.format(timestamp);
    }

    public static String dateTimeToString(Timestamp timestamp) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(timestamp);
    }

    /**
     * Timestamp 타입을 날짜로 변경함
     */
    public static String dateToString(Timestamp timestamp) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(timestamp);
    }
}
