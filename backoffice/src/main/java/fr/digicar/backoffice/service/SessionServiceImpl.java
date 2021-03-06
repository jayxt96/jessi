package fr.digicar.backoffice.service;

import fr.digicar.dao.SessionDAO;
import fr.digicar.model.Car;
import fr.digicar.model.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Time;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class SessionServiceImpl implements SessionService {

    @Autowired
    private SessionDAO sessionDAO;

    @Override
    public Session getSession(int id) {
        return sessionDAO.getSession(id);
    }

    @Override
    public List<Session> getUserSessions(int userID, Date d) {
        return sessionDAO.getUserSessions(userID,d);
    }

    @Override
    public void removeSessionById(int id) {
        sessionDAO.removeSessionById(id);
    }

    @Override
    public void updateSessionById(int sessionId, int carId) {
        sessionDAO.updateSessionById(sessionId, carId);
    }

    @Override
    public Car getSessionCar(int sessionId) {
        return sessionDAO.getSessionCar(sessionId);
    }

}
