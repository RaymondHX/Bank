package com.ray.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class Detail {


    private String username;
    private double into;
    private double out;
    private String time;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public double getInto() {
        return into;
    }

    public void setInto(double into) {
        this.into = into;
    }

    public double getOut() {
        return out;
    }

    public void setOut(double out) {
        this.out = out;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }



    @Override
    public String toString() {
        return "Detail{" +
                "username='" + username + '\'' +
                ", into=" + into +
                ", out=" + out +
                ", time='" + time + '\'' +
                '}';
    }


}
