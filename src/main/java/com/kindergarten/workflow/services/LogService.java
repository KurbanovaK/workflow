package com.kindergarten.workflow.services;

import com.kindergarten.workflow.data.ActionLogRepository;
import com.kindergarten.workflow.domain.ActionLog;
import com.kindergarten.workflow.domain.Document;
import com.kindergarten.workflow.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class LogService {
    @Autowired
    ActionLogRepository logRepository;

    public void CommitEvent(User author, Document document,  String mesage){
        ActionLog log = new ActionLog();
        log.setAuthor(author);
        log.setDate(new Date());
        log.setDocument(document);
        log.setMessage(mesage);
        logRepository.save(log);
    }

}
