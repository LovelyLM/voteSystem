package com.leiming.controller;

import com.leiming.entity.Player;
import com.leiming.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Leiming
 * DateTime: 2019/6/22 14:15
 */
@Controller
public class PlayerController {
    @Autowired
    private PlayerService playerService;
    @RequestMapping("/deletePlayer")
    @ResponseBody
    public int deletePlayer(int id){
        return playerService.deletePlayer(id);
    }
    @RequestMapping("/addPlayer")
    @ResponseBody
    public int deletePlayer(Player player){
        return playerService.addPlayer(player);
    }
    @RequestMapping("/updatePlayer")
    @ResponseBody
    public int updatePlayer(Player player){
        return playerService.updatePlayer(player);
    }
    @RequestMapping("/findAllName")
    @ResponseBody
    public List<Player> findAllName(){
        return playerService.findAllName();
    }

}
