package com.swarm.microservice.resort.controller;

import com.swarm.microservice.resort.model.ResortEntity;
import com.swarm.microservice.resort.service.ResortService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ResortController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ResortService resortService;

    @GetMapping("/resort")
    public ResponseEntity<List<ResortEntity>> getAllResorts() {
        List<ResortEntity> resortList = resortService.getAllResorts();

        if (resortList.size() == 0) {
            return new ResponseEntity<>(resortList, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(resortList, HttpStatus.OK);
    }

    @GetMapping("/resort/{id}")
    public ResponseEntity<ResortEntity> getResortById(@PathVariable(name = "id") String id) {
        ResortEntity  resort = resortService.getResortById(id);

        if (resort == null ) {
            return new ResponseEntity<>(resort, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(resort, HttpStatus.OK);
    }

    @GetMapping("/resort/top")
    public ResponseEntity<List<ResortEntity>> getTopResorts() {
        List<ResortEntity> resortList = resortService.getTopResorts();

        if (resortList.size() == 0) {
            return new ResponseEntity<>(resortList, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(resortList, HttpStatus.OK);
    }

    @PostMapping("/resort-add")
    public ResponseEntity<?> addResort(@RequestBody ResortEntity resort) {

//        if (resort == null ) {
//            return new ResponseEntity<>(resort, HttpStatus.NOT_FOUND);
//        }
        return resortService.addResort(resort);
    }

}
