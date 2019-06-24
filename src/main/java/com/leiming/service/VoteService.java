package com.leiming.service;

import com.leiming.entity.Vote;

import java.util.List;

/**
 * Created by Leiming
 * DateTime: 2019/6/22 11:28
 */
public interface VoteService {
    List<Vote> findAll();
    int deleteVote(int vid);
    Vote findAllByVid(int vid);
    int addVote(Vote vote);
    String findAllVotePlayer(int vid);
    String findPoll(int vid);
    String findDescribe(int vid);

}
