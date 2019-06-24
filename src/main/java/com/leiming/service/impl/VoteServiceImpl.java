package com.leiming.service.impl;

import com.leiming.entity.Vote;
import com.leiming.mapper.VoteDao;
import com.leiming.service.VoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Leiming
 * DateTime: 2019/6/22 14:10
 */
@Service
public class VoteServiceImpl implements VoteService {
    @Autowired
    private VoteDao voteDao;
    public List<Vote> findAll() {
        return voteDao.findAll();
    }

    public int deleteVote(int vid) {
        return voteDao.deleteVote(vid);
    }

    public Vote findAllByVid(int vid) {
        return voteDao.findAllByVid(vid);
    }

    public int addVote(Vote vote) {
        return voteDao.addVote(vote);
    }

    public String findAllVotePlayer(int vid) {
        return voteDao.findAllVotePlayer(vid);
    }

    public String findPoll(int vid) {
        return voteDao.findPoll(vid);
    }

    public String findDescribe(int vid) {
        return voteDao.findDescribe(vid);
    }
}
