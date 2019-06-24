package com.leiming.entity;

import java.sql.Timestamp;

/**
 * Created by Leiming
 * DateTime: 2019/6/22 11:03
 */
public class Vote {
    private Integer vid;
    private String vdescribe;
    private String vplayer;
    private String vpoll;
    private Timestamp vstart;
    private int status;
    private int ltime;

    public Integer getVid() {
        return vid;
    }

    public void setVid(Integer vid) {
        this.vid = vid;
    }

    public String getVdescribe() {
        return vdescribe;
    }

    public void setVdescribe(String vdescribe) {
        this.vdescribe = vdescribe;
    }

    public String getVplayer() {
        return vplayer;
    }

    public void setVplayer(String vplayer) {
        this.vplayer = vplayer;
    }

    public String getVpoll() {
        return vpoll;
    }

    public void setVpoll(String vpoll) {
        this.vpoll = vpoll;
    }

    public Timestamp getVstart() {
        return vstart;
    }

    public void setVstart(Timestamp vstart) {
        this.vstart = vstart;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getLimit() {
        return ltime;
    }

    public void setLimit(int limit) {
        this.ltime = limit;
    }

    @Override
    public String toString() {
        return "Vote{" +
                "vid=" + vid +
                ", vdescribe='" + vdescribe + '\'' +
                ", vplayer='" + vplayer + '\'' +
                ", vpoll='" + vpoll + '\'' +
                ", vstart=" + vstart +
                ", status=" + status +
                ", limit=" + ltime +
                '}';
    }
}
