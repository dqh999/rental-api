package com.rental.api.domain.shared.entity;

import com.rental.api.domain.shared.valueobject.Identifier;
import jakarta.persistence.Id;
import jakarta.persistence.MappedSuperclass;

@MappedSuperclass
public abstract class BaseEntity {
    @Id
    private Identifier id;

    // Constructor để khởi tạo id
    public BaseEntity(String id) {
        if (id != null && !id.isEmpty()) {
            this.id = new Identifier(id);
        }
    }

    // Constructor mặc định cho JPA
    public BaseEntity() {}

    // Getter cho id dưới dạng chuỗi
    public String getId() {
        return id != null ? id.toString() : null;
    }

    // Setter cho id
    public void setId(String id) {
        if (id != null && !id.isEmpty()) {
            this.id = new Identifier(id);
        }
    }
}