package com.swarm.microservice.resort.repository;


import com.swarm.microservice.resort.model.ResortEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.swing.text.html.Option;
import java.util.List;
import java.util.Optional;

@Repository
public interface ResortRepository extends JpaRepository<ResortEntity, String>{

    @Query("SELECT resort from ResortEntity resort where rating > 0.3")
    public Optional<List<ResortEntity>> findTopResorts() ;
}
