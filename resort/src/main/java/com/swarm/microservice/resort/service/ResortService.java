package com.swarm.microservice.resort.service;

import com.swarm.microservice.resort.model.ResortEntity;
import com.swarm.microservice.resort.repository.ResortRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

@Service
public class ResortService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ResortRepository resortRepository;

    public List<ResortEntity> getAllResorts() {

        logger.info("ResortService: Getting all resorts ");
        return resortRepository.findAll();
    }

    public ResortEntity getResortById(String id) {

        logger.info("ResortService: Getting resort by Id: {}", id);
        return resortRepository.findById(id).orElse(null);
    }

    public List<ResortEntity> getTopResorts() {

        logger.info("ResortService: Getting top resorts");
        return resortRepository.findTopResorts().orElse(null);
    }

    public ResponseEntity<?> addResort(ResortEntity resort) {

        logger.info("ResortService: Adding resort");
        ResortEntity newResort = resortRepository.save(resort);

        URI location = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}")
                .buildAndExpand(newResort).toUri();

        return ResponseEntity.created(location).build();
    }
}
