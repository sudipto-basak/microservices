package com.swarm.microservice.resort.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "resort")
public class ResortEntity {

    @Id
    @Column(name = "RESORTCODE")
    private String id;
    private String resortname;
    @Column(name = "COUNTRY_NAME")
    private String country;
    @Column(name = "STRATA_NAME")
    private String crown;
    @Column(name = "WEIGHTED_SCORE")
    private float rating;

}
