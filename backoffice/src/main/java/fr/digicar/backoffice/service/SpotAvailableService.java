package fr.digicar.backoffice.service;

import fr.digicar.model.ParkingSpot;
import fr.digicar.model.SpotAvailable;
import org.hibernate.JDBCException;

import java.util.List;

public interface SpotAvailableService {

    void updateSpotAvailable(SpotAvailable spotAvailable) throws JDBCException;

    SpotAvailable getSpotAvailableById(int id_parking_spots);

    ParkingSpot getSpotAvailableByIdLocation(String location);

    List<SpotAvailable> getAllSpotsAvailable();

}
