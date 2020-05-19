package com.kindergarten.workflow.data;

import com.kindergarten.workflow.domain.Document;
import org.springframework.data.repository.CrudRepository;

public interface DocumentRepository extends CrudRepository<Document, Integer> {
}
