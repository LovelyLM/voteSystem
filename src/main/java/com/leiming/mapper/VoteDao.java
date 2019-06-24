package com.leiming.mapper;

import com.leiming.entity.Vote;

import java.util.List;

/**
 * Created by Leiming
 * DateTime: 2019/6/22 11:12
 */
public interface VoteDao {
    List<Vote> findAll();
    int deleteVote(int vid);
    int addVote(Vote vote);
    Vote findAllByVid(int vid);
    String findAllVotePlayer(int vid);
    String findPoll(int vid);
    String findDescribe(int vid);



}
