package com.kindergarten.workflow.data;

import com.kindergarten.workflow.domain.ActionLog;
import com.kindergarten.workflow.domain.Document;
import org.springframework.data.repository.CrudRepository;

public interface ActionLogRepository  extends CrudRepository<ActionLog, Integer> {
}
