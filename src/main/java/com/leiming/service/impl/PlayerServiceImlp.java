package com.leiming.service.impl;

import com.leiming.entity.Player;
import com.leiming.mapper.PlayerDao;
import com.leiming.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Leiming
 * DateTime: 2019/6/22 14:08
 */
@Service
public class PlayerServiceImlp implements PlayerService {
    @Autowired
    //查询所有选手信息
    private PlayerDao playerDao;
    public List<Player> findAll() {
        return playerDao.findAll();
    }
    //查询所有选手名字，方便投票时选择
    public List<Player> findAllName() {
        return playerDao.findAllName();
    }

    public int deletePlayer(int id) {
        return playerDao.deletePlayer(id);
    }

    public int addPlayer(Player player) {
        return playerDao.addPlayer(player);
    }

    public Player findById(int id) {
        return playerDao.findById(id);
    }

    public int updatePlayer(Player player) {
        return playerDao.updatePlayer(player);
    }
}
