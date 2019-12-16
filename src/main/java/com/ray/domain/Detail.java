package com.ray.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class Detail {



    private String username;
    private int in;
    private int out;
    private Timestamp timestamp;

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }





    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getIn() {
        return in;
    }

    public void setIn(int in) {
        this.in = in;
    }

    public int getOut() {
        return out;
    }

    public void setOut(int out) {
        this.out = out;
    }

    @Override
    public String toString() {
        return "Detail{" +
                "username='" + username + '\'' +
                ", in=" + in +
                ", out=" + out +
                ", timestamp=" + timestamp +
                '}';
    }

}
