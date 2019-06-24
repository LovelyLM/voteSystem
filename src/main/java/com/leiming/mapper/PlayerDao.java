package com.leiming.mapper;

import com.leiming.entity.Player;

import java.util.List;

/**
 * Created by Leiming
 * DateTime: 2019/6/22 11:09
 */
public interface PlayerDao {
    List<Player> findAll();
    List<Player> findAllName();
    int deletePlayer(int id);
    int addPlayer(Player player);
    Player findById(int id);
    int updatePlayer(Player player);
}
