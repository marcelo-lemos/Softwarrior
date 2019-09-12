package com.softwarrior.scoreboard.service;

import com.softwarrior.scoreboard.model.Score;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ScoreRepository extends JpaRepository<Score,Long> {
    List<Score> findTop100ByLevelIdOrderByScoreValueDesc(Long levelId);
}
