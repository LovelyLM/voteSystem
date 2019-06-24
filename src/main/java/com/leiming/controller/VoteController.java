package com.leiming.controller;

import com.leiming.entity.Vote;
import com.leiming.service.VoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashSet;

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


}


