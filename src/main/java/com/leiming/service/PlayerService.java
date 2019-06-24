package com.leiming.service;

import com.leiming.entity.Player;

import java.util.List;

/**
 * Created by Leiming
 * DateTime: 2019/6/22 11:27
 */
public interface PlayerService {
    List<Player> findAll();
    List<Player> findAllName();
    int deletePlayer(int id);
    int addPlayer(Player player);
    Player findById(int id);
    int updatePlayer(Player player);


}
