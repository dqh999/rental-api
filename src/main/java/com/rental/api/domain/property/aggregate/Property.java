package com.rental.api.domain.property.aggregate;

import com.rental.api.domain.shared.entity.BaseEntity;
import com.rental.api.domain.shared.valueobject.Identifier;
import jakarta.persistence.Entity;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Data
public class Property extends BaseEntity {
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

    public Property() {
        super(null);
    }

    public Property(String id) {
        super(id);
    }
}
