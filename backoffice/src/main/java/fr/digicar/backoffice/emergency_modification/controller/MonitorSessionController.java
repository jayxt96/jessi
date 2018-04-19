package fr.digicar.backoffice.emergency_modification.controller;

import fr.digicar.backoffice.emergency_modification.service.RetardCalculeService;
import fr.digicar.backoffice.emergency_modification.service.SessionEnCoursService;
import fr.digicar.backoffice.service.SessionService;
import fr.digicar.model.RetardCalcule;
import fr.digicar.model.Session;
import fr.digicar.model.SessionEnCours;
import fr.digicar.odt.FilterRegistrationIdOdt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/modifurgent")
public class MonitorSessionController {

    @Autowired
    private SessionService sessionService;

    @Autowired
    private RetardCalculeService retardCalculeService;

    @Autowired
    private SessionEnCoursService sessionEnCoursService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView AddMonitorCoursePage() throws IOException{
        ModelAndView modelAndView = new ModelAndView("emergency-modification/monitoring-course-form");
        modelAndView.addObject("ligneRetard", new RetardCalcule());
        retardCalculeService.deleteAllRetardsCalcule();
        retardCalculeService.addRetardCalculeAutomatically();
        List<RetardCalcule> retardscalcule = retardCalculeService.getRetardsCalcule(); //liste des personnes à appele
        return AffichageMultiTable(retardscalcule,modelAndView);
    }

    @RequestMapping(value = "/cloturer/{id}", method = RequestMethod.GET)
    public ModelAndView edditingClotureLigneRetard(@PathVariable Integer id) {

        ModelAndView modelAndView = new ModelAndView("emergency-modification/monitoring-course-form");
        modelAndView.addObject("ligneRetard", new RetardCalcule());
        RetardCalcule retardCalcule=new RetardCalcule();
        SessionEnCours sessionEnCours=new SessionEnCours();
        retardCalcule.setTagAppel(true);
        retardCalcule.setId(id);
        sessionEnCours.setIdSession(retardCalculeService.getRetardCalcule(id).getIdSession());
        sessionEnCours.setTag(true);
        retardCalculeService.updateRetardCalcule(retardCalcule);
        sessionEnCoursService.updateSessionEnCours(sessionEnCours);
        List<RetardCalcule> retardscalcule = retardCalculeService.getRetardsCalcule(); //liste des personnes à appele
        return AffichageMultiTable(retardscalcule,modelAndView);
    }

    @RequestMapping(value = "/impactedSession", method = RequestMethod.GET)
    public ModelAndView getImpactedAllSessions() {

        //Delay identified
        List<RetardCalcule> retardscalcule = retardCalculeService.getRetardsCalcule();

        //impacted sessions
        List<Session> sessionimpacted = new ArrayList<>();

        List<Session> allSession = sessionService.getAllSessions();
        String registration;
        String impact;
        for (int i=0; i<retardscalcule.size(); i++){
            registration = retardscalcule.get(i).getImmatriculation();
            Long t1 = retardscalcule.get(i).getHeureRetourCalcule().getTime();

            for (int j=0; j<allSession.size(); j++) {

                impact = allSession.get(j).getCar_registration_id();
                Long t2 = allSession.get(j).getDeparture_date().getTime();

                if(registration.equals(impact)){
                    if (t1 >= t2) {
                        sessionimpacted.add(allSession.get(j));
                    }
                }
            }
        }
        ModelAndView modelAndView = new ModelAndView("emergency-modification/impacted-sessions");
        modelAndView.addObject("sessionimpacted",  sessionimpacted);
        modelAndView.addObject("filteregistration", new FilterRegistrationIdOdt());

        return modelAndView;
    }
    @RequestMapping(value = "/impactedSession/registrationId", method = RequestMethod.POST)
    public ModelAndView findSessionByregistrationId(@ModelAttribute("filteregistration") final FilterRegistrationIdOdt filterRegistrationIdOdt) {

        return findSession(filterRegistrationIdOdt);

    }

    @RequestMapping(value = "/impactedSession/{registrationId}", method = RequestMethod.GET)
    public ModelAndView getViewForUpdateSession(@PathVariable String registrationId) {
        FilterRegistrationIdOdt filterRegistrationIdOdt = new FilterRegistrationIdOdt();
        filterRegistrationIdOdt.setregistrationNumber(registrationId);

        return findSession(filterRegistrationIdOdt);
    }

    @RequestMapping(value = "/reouvrir/{id}", method = RequestMethod.GET)
    public ModelAndView edditingReouvrirLigneRetard(@PathVariable Integer id) {

        ModelAndView modelAndView = new ModelAndView("monitoring-course-form");
        modelAndView.addObject("ligneRetard", new RetardCalcule());
        RetardCalcule retardCalcule=new RetardCalcule();
        SessionEnCours sessionEnCours=new SessionEnCours();
        retardCalcule.setTagAppel(false);
        retardCalcule.setId(id);
        sessionEnCours.setIdSession(retardCalculeService.getRetardCalcule(id).getIdSession());
        sessionEnCours.setTag(true);
        retardCalculeService.updateRetardCalcule(retardCalcule);
        sessionEnCoursService.updateSessionEnCours(sessionEnCours);
        List<RetardCalcule> retardscalcule = retardCalculeService.getRetardsCalcule(); //liste des personnes à appele
       return AffichageMultiTable(retardscalcule,modelAndView);
    }

    public ModelAndView AffichageMultiTable(List<RetardCalcule> retardscalcule,ModelAndView modelAndView ){
        List<RetardCalcule> retardcalculesAppeler=new ArrayList<RetardCalcule>();
        List<RetardCalcule> retardcalculesNonEnRetard=new ArrayList<RetardCalcule>();
        List<RetardCalcule> retardcalculesNonAppeler=new ArrayList<RetardCalcule>();

        for(RetardCalcule r : retardscalcule){
            if(r.getHeureRetourCalcule().getTime()<=r.getHeureRetourPrevu().getTime()){
                retardcalculesNonEnRetard.add(r);
            }
            else if (r.getTagAppel() == true) {
                retardcalculesAppeler.add(r);
            }
            else retardcalculesNonAppeler.add(r);
        }

        modelAndView.addObject("retardCalcule", retardcalculesNonAppeler);
        modelAndView.addObject("retardCalculeAppeler", retardcalculesAppeler);
        modelAndView.addObject("retardCalculeNonEnRetard", retardcalculesNonEnRetard);
        return modelAndView;
    }

    private ModelAndView findSession(FilterRegistrationIdOdt filterRegistrationIdOdt)
    {
        String registration = filterRegistrationIdOdt.getregistrationNumber();
        String message;

        List<RetardCalcule> retardscalcule = retardCalculeService.getRetardsCalcule();
        Long arrival_time = null;

        for (int i=0; i<retardscalcule.size(); i++) {

            if (retardscalcule.get(i).getImmatriculation() == registration) {

                arrival_time = retardscalcule.get(i).getHeureRetourCalcule().getTime();
                break;
            }
        }

        List<Session> sessionimpacted = sessionService.getImpactedSessions(registration, arrival_time);

        ModelAndView modelAndView = new ModelAndView("emergency-modification/impacted-sessions");
        modelAndView.addObject("filteregistration", new FilterRegistrationIdOdt());

        if (sessionimpacted.isEmpty() || sessionimpacted == null){
            message = "Veuillez Renseigner un matricule correcte";
            modelAndView.addObject("message", message);
        }
        else {
            modelAndView.addObject("sessionimpacted", sessionimpacted);
        }
        return modelAndView;
    }
}