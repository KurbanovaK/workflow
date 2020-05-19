package com.kindergarten.workflow.services;

import com.kindergarten.workflow.data.DocumentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;


@Component
public class DocumentService {
    @Autowired
    private DocumentRepository documentRepository;
}
