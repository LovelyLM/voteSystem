package com.leiming.service;

import com.leiming.entity.Score;
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
    int updateIp(Score score);
    List<Score> selectScore(Score score);
    int updateScore(Score score);
    Integer closeVote(int vid);
    int findStatus(int vid);


}
