package fr.digicar.backoffice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LinkController {

    @RequestMapping(value = "/")
    public ModelAndView mainPage() {
        return new ModelAndView("home");
    }

    @RequestMapping(value = "/lieu")
    public ModelAndView lieu() {
        return new ModelAndView("lieu");
    }

    @RequestMapping(value = "/charts")
    public ModelAndView charts() {
        return new ModelAndView("charts");
    }

}
