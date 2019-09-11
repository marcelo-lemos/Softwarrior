package com.softwarrior.scoreboard.controller;

import com.softwarrior.scoreboard.model.Score;
import com.softwarrior.scoreboard.service.ScoreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import java.util.List;

@RestController
public class ScoreController {
    @Autowired
    private ScoreRepository scoreRepository;

    @GetMapping("/score")
    public List<Score> getAllScores(){
        return scoreRepository.findAll();
    }

    @GetMapping("/score/{level}")
    public List<Score> getLevelTopScores(@PathVariable Long level, @RequestParam(required = false, defaultValue = "100") @Min(1) @Max(100) Integer top){
        List<Score> topScores = scoreRepository.findTop100ByLevelIdOrderByScoreValue(level);
        return topScores.subList(0,Math.min(top,topScores.size()));
    }

    @PostMapping("/score")
    public Score createScore(@Valid @RequestBody Score employee) {
        return scoreRepository.save(employee);
    }
}
