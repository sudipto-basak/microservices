package com.swarm.microservice.webapp.controller;

import com.netflix.discovery.EurekaClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import java.util.logging.Logger;

@Controller
public class WebappController {

    private Logger logger = Logger.getLogger(WebappController.class.getName());

    @Autowired
    Environment env;

    @Value("${spring.application.name}")
    String appName;

    @GetMapping("/webapp")
    public String homePage(Model model) {

        logger.info("Running webapp in " + System.getenv("HOST_HOSTNAME"));

        model.addAttribute("appName", appName);
        model.addAttribute("hostMachine",System.getenv("HOST_HOSTNAME"));
        model.addAttribute("host",env.getProperty("server.host"));
        model.addAttribute("port", env.getProperty("server.port"));
        return "home";
    }

}
