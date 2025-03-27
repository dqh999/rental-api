package com.rental.api.domain.property.valueobject;

public enum PropertyStatus {
    AVAILABLE, RENTED, UNDER_MAINTENANCE;

    public boolean canChangeTo(PropertyStatus newStatus) {
        return switch (this) {
            case AVAILABLE -> newStatus == RENTED || newStatus == UNDER_MAINTENANCE;
            case RENTED -> newStatus == AVAILABLE;
            case UNDER_MAINTENANCE -> newStatus == AVAILABLE;
        };
    }
}
