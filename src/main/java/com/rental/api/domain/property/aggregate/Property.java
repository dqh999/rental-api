package com.rental.api.domain.property.aggregate;

import lombok.Data;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

@Data
public class Property {
    private String id;
    private String ownerId;
    private String title;
    private String thumbnail;
    private String description;
    private String address;
    private String city;
    private BigDecimal price;
    private BigDecimal area;
    private int numBedrooms;
    private int numBathrooms;
    private boolean available = true;
    private String status;
    private Timestamp createdAt;
    private List<Media> mediaList;
    private List<Amenity> amenities;
}
