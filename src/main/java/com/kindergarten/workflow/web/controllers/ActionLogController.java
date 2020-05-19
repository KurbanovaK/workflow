package com.kindergarten.workflow.web.controllers;

import com.kindergarten.workflow.data.ActionLogRepository;
import com.kindergarten.workflow.domain.ActionLog;
import com.kindergarten.workflow.domain.Document;
import com.kindergarten.workflow.domain.Roles;
import com.kindergarten.workflow.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
@RequestMapping("logs")
public class ActionLogController {

    @Autowired
    private ActionLogRepository actionLogRepository;

    @GetMapping(path="/all")
    public ModelAndView getAllDocuments(Map<String, Object> model, @AuthenticationPrincipal User user) {
        if (!user.getRoles().contains(Roles.Admin)){
            new ModelAndView("main", model);
        }
        Iterable<ActionLog> logs = actionLogRepository.findAll();
        model.put("logs", logs);
        return new ModelAndView("logList", model);
    }

}
