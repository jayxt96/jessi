package fr.digicar.backoffice.service;

import fr.digicar.dao.CarAvailabilityDAO;
import fr.digicar.model.CarAvailability;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.MockitoJUnitRunner;

import java.util.ArrayList;
import java.util.List;

import static org.mockito.Mockito.when;




/**
 * Created by barry on 10/05/2018.
 */
@RunWith(MockitoJUnitRunner.Silent.class)
public class CarAvailabilityServiceImplTest {

    @Mock
    private CarAvailabilityDAO carAvailabilityDAO;

    @InjectMocks
    private CarAvailabilityServiceImpl carAvailabilityService;


    /**
     * Unit test for getAllCarAvailability method
     * from CarAvailabilityServiceImpl class
     */
    @Test
    public void listAllCarAvailabilitiesShouldReturnAllCarAvailabilities() {
        //
        //GIVEN
        //
        List<CarAvailability> carAvailabilities = new ArrayList<>();
        carAvailabilities.add(new CarAvailability(1, 3, 7, "yes"));
        carAvailabilities.add(new CarAvailability(2, 8, 1, "yes"));
        carAvailabilities.add(new CarAvailability(3, 2, 3, "yes"));
        carAvailabilities.add(new CarAvailability(4, 4, 2, "yes"));
        carAvailabilities.add(new CarAvailability(5, 5, 4, "yes"));

        Mockito.when(carAvailabilityDAO.getAllCarAvailabilities()).thenReturn(carAvailabilities);
        //
        //WHEN
        //
        List<CarAvailability> carAvailabilityListTest = carAvailabilityService.getAllCarAvailabilities();
        //
        //THEN
        //
        Assert.assertEquals(carAvailabilities, carAvailabilityListTest);
    }

    /**
     * Unit test for getCarAvailabilityByCriteria method
     * from CarAvailabilityServiceImpl class
     */
    @Test
    public void getCarAvailabilityByCriteriaShouldReturnCarAvailabilityByCriteria() {
        //
        //GIVEN
        //
        List<CarAvailability> carAvailabilities = new ArrayList<>();

        CarAvailability exceptedCarAvailability1 = new CarAvailability(4, 4, 2, "no");
        CarAvailability exceptedCarAvailability2 = new CarAvailability(5, 5, 4, "yes");

        carAvailabilities.add(new CarAvailability(1, 3, 7, "yes"));
        carAvailabilities.add(new CarAvailability(2, 8, 1, "yes"));
        carAvailabilities.add(new CarAvailability(3, 2, 3, "yes"));
        carAvailabilities.add(exceptedCarAvailability1);
        carAvailabilities.add(exceptedCarAvailability2);

        Mockito.when(carAvailabilityDAO.getCarAvailabilityByCriteria("no")).thenReturn(exceptedCarAvailability1);
        Mockito.when(carAvailabilityDAO.getCarAvailabilityByCriteria("yes")).thenReturn(exceptedCarAvailability2);
        //
        //WHEN
        //
        CarAvailability carAvailabilityTest1 = carAvailabilityService.getCarAvailabilityByCriteria("yes");
        CarAvailability carAvailabilityTest2 = carAvailabilityService.getCarAvailabilityByCriteria("no");
        //
        //THEN
        //
        Assert.assertNotSame(exceptedCarAvailability1, carAvailabilityTest1);
        Assert.assertNotSame(exceptedCarAvailability2, carAvailabilityTest2);
    }


}

