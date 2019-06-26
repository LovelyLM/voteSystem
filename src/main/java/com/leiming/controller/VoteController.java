package com.leiming.controller;

import com.leiming.entity.Score;
import com.leiming.entity.Vote;
import com.leiming.service.VoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by Leiming
 * DateTime: 2019/6/23 0:41
 */
@Controller
public class VoteController {
    @Autowired
    private VoteService voteService;
    @RequestMapping("/deleteVote")
    @ResponseBody
    public int deleteVote(int vid){
        if (voteService.findAllByVid(vid).getStatus()==1){
            return 2;
        }else {
            return voteService.deleteVote(vid);
        }

    }
    @RequestMapping("/addVote")
    @ResponseBody
    public int addVote(Vote vote){
        String[] players = vote.getVplayer().split(",");

        if (vote.getVplayer().length()<5){
            return 2;
        }
        else {
            return voteService.addVote(vote);

        }
    }
    @RequestMapping(value = "/findAllVotePlayer",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String findAllVotePlayer(int vid){
        return voteService.findAllVotePlayer(vid);
    }
    @RequestMapping(value = "/findPoll",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String findPoll(int vid){
        return voteService.findPoll(vid);
    }
    @RequestMapping(value = "/findDescribe",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String findDescribe(int vid){
        return voteService.findDescribe(vid);
    }
    @RequestMapping(value = "/vote", produces = "application/json; charset=utf-8")
    @ResponseBody
    public int vote(String name,String newi,int vid) {

        System.out.println(name+"~~~"+newi+"~~~~"+vid);
        Score score=new Score();
        score.setVid(vid);//前端传值

        String vplayer="";//查找vplayer字段的值
        String vpoll="";//查找vpoll字段的值
        String ips="";//查找ips字段的值
        List<Score> list =voteService.selectScore(score);
        for (Score s: list) {
            vplayer=s.getVplayer();
            vpoll=s.getVpoll();
            ips=s.getIps();
        }

        System.out.println(ips+"~~~"+vpoll+"~~~"+vplayer);
        String ip[]=ips.split(",");//拆解处理
        Set hashSet = new HashSet();
        for (String s: ip) {
            hashSet.add(s);
        }
        hashSet.add(newi);
        if (hashSet.size() == ip.length) {
            return 0;//返回一个信息
        }else {
            ips=ips+","+newi;
            score.setIps(ips);
            //执行sql语句
            int i=voteService.updateIp(score);

            int place=0;//比对对应位置
            for (String s: vplayer.split(",")) {
                if (s.equals(name)) {
                    break;
                }
                place=place+1;
            }
            String poll[]=vpoll.split(",");//拆解处理
            String newp =poll[place];
            int newpt=Integer.parseInt(newp);//字符串转换数字
            poll[place]=String.valueOf(newpt+1);//Integer.toString(i)或者"" + i;

            vpoll="";//更新vpoll(分数)
            for (String s: poll) {
                vpoll=vpoll+s+",";
            }
            vpoll = vpoll.substring(0,vpoll.length() - 1);//多了一个","删除掉
            score.setVpoll(vpoll);
            //执行sql语句
            int n=voteService.updateScore(score);
            if (n==1) {
                return 1;
            }else {
                return -1;
            }

        }

    }


    @RequestMapping("/closeVote")
    @ResponseBody
    public Integer closeVote(int vid){

        return voteService.closeVote(vid);
    }



}


