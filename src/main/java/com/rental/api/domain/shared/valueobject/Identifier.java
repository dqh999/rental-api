package com.rental.api.domain.shared.valueobject;

import java.util.UUID;

public class Identifier {
    private final String value;

    public Identifier() {
        this.value = UUID.randomUUID().toString();
    }

    public Identifier(String value) {
        this.value = value;
    }
}
