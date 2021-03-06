package fr.digicar.webportal.controller;

import fr.digicar.model.User;
import fr.digicar.webportal.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Slf4j
@Controller
@RequestMapping("/registration")
public class RegistrationController {

    @Autowired
    UserService userService;

    User user;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView registerUser() {
        log.debug("RegistrationController#registerUser");

        ModelAndView modelAndView = new ModelAndView("registration");
        modelAndView.addObject("user", new User());
        return modelAndView;
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public ModelAndView registerUserPersonalInfo(@ModelAttribute User user) {
        log.debug("RegistrationController#registerUserPerosnalInfo");
        log.debug("user.email : " + user.getEmail());
        log.debug("user.password : " + user.getPassword());
        log.debug("user.passwordConfirm : " + user.getPasswordConfirm());

        ModelAndView modelAndView;
        if (!user.getPassword().equals(user.getPasswordConfirm())) {
            modelAndView = new ModelAndView("registration");
            modelAndView.addObject("message", "Les mots de passe renseignés doivent être identiques.");
            user.setPassword(null);
            user.setPasswordConfirm(null);
        } else if (!userService.checkEmailExistence(user.getEmail())) {
            modelAndView = new ModelAndView("registration");
            modelAndView.addObject("message", "Cette adresse email est déjà enregistrée.");
            user.setPassword(null);
            user.setPasswordConfirm(null);
        } else {
            this.user = user;
            modelAndView = new ModelAndView("registration-personal-info");
        }
        modelAndView.addObject("user", user);
        return modelAndView;
    }

    @RequestMapping(value = "/confirm", method = RequestMethod.POST)
    public ModelAndView confirmUserRegistration(@ModelAttribute User user) throws ParseException {
        log.debug("RegistrationController#confirmUserRegistration");
        log.debug("user : " + user);

        user.setEmail(this.user.getEmail());
        user.setPassword(this.user.getPassword());

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        user.setBirthdate(format.parse(user.getBirthdateString()));
        if (calculateAge(user.getBirthdate(), new Date()) < 21) {
            ModelAndView modelAndView = new ModelAndView("registration-personal-info");
            modelAndView.addObject("user", user);
            modelAndView.addObject("message", "Vous devez avoir plus de 21 ans pour vous inscrire.");
            return modelAndView;
        }
        userService.createUser(user);
        return new ModelAndView("registration-confirm");
    }

    static int calculateAge(Date birthDate, Date now) {
        long timeBetween = now.getTime() - birthDate.getTime();
        double yearsBetween = timeBetween / 3.15576e+10;
        return (int) Math.floor(yearsBetween);
    }

}
