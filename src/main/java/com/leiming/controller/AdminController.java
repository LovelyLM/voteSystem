package com.leiming.controller;

import com.leiming.entity.Player;
import com.leiming.entity.Vote;
import com.leiming.service.PlayerService;
import com.leiming.service.VoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class AdminController {
    @Autowired
    private PlayerService playerService;
    @Autowired
    private VoteService voteService;
    @RequestMapping("/login")
    public String login(){
        return "login";
    }
    @RequestMapping("/index")
    public String index(){
        return "index";
    }
    @RequestMapping("/welcome")
    public String welcome(){
        return "jsp/welcome";
    }
    @RequestMapping("/welcome1")
    public String welcome1(){
        return "jsp/welcome1";
    }
    @RequestMapping("/memberList")
    public String memberList(Model model){
        List<Player> playList = playerService.findAll();
        model.addAttribute("playerList",playList);
        return "/jsp/player/member-list";
    }
    @RequestMapping("/memberEdit")
    public String memberEdit(int id,Model model){
        Player player = playerService.findById(id);

        model.addAttribute("player",player);
        return "/jsp/player/member-edit";
    }
    @RequestMapping("/memberAdd")
    public String memberAdd(){
        return "/jsp/player/member-add";
    }
    @RequestMapping("/voteList")
    public String voteList(Model model){
        List<Vote> voteList = voteService.findAll();
        System.out.println(voteList);
        model.addAttribute("voteList",voteList);
        return "/jsp/vote/vote-list";
    }
    @RequestMapping("/voteAdd")
    public String voteAdd(Model model){
        model.addAttribute("players",playerService.findAllName());
        return "/jsp/vote/vote-add";
    }
    @RequestMapping("/voteResult")
    public String voteResult(int vid,Model model){
        model.addAttribute("vid",vid);
        return "/jsp/voteResult";
    }
    @RequestMapping("/voting")
    public String voting(int vid,Model model){
        Vote vote = voteService.findAllByVid(vid);
        model.addAttribute("vote",vote);
        return "/jsp/voting";
    }

}
